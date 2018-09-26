<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/12
 * Time: 23:14
 */

namespace app\admin\controller;

use app\common\model\Config as ConfigModel;

class Config extends BaseController
{
    public function index()
    {
        // 读取配置
        $config = ConfigModel::get(1);
        $this->assign([
            'title' => '系统设置',
            'config' => $config
        ]);
        return $this->fetch();
    }

    public function edit()
    {
        $id = $this->request->param('id');
        $post = $this->request->post();
        $config = ConfigModel::get($id);
        $result = $config->save($post);
        if ($result === 1) {
            return mkRestful(0, '修改成功', 'success');
        } elseif ($result === 0) {
            return mkRestful(1, '未修改');
        } else {
            return mkRestful();
        }
    }
}