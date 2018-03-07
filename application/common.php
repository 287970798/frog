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
 * 生成restful格式的接口数据
 * @param int $code
 * @param string $message
 * @param int $type
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
            'message' => $message
        ]
    ];
}