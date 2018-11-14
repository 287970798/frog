<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * 生成简易接口数据 功能同 mkRestful()
 * @param string $message
 * @param int $code
 * @param null $data
 * @return array
 */
function makeApi($message = '成功', $code = 0, $data = null)
{
    return [
        'code' => $code,
        'message' => $message,
        'data' => $data
    ];
}

/**
 * 生成restful格式的接口数据
 * @param int $code
 * @param string $message
 * @param string $type error|success
 * @param array $data
 * @return array
 */
function mkRestful($code = 1, $message = '操作失败', $type = 'error', $data = []) {
    if ($type === 'success') {
        return [
            'success_response' => [
                'data' => $data,
                'code' => $code,
                'message' => $message
            ]
        ];
    }
    return [
        'error_response' => [
            'code' => $code,
            'message' => $message,
            'error' => $data
        ]
    ];
}

/**
 * 生成layui表格重载的接口数据
 * @param \think\Paginator $pagination
 * @return array
 */
function mkTableRestful(\think\Paginator $pagination) {
    $paginationArrayData = $pagination->toArray();
    return [
        'code' => 0,
        'msg' => '',
        'count' => $paginationArrayData['total'],
        'data' => $paginationArrayData['data']
    ];
}