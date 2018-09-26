<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/12
 * Time: 22:46
 */

namespace app\admin\controller;


class Content extends BaseController
{
    public function index()
    {
        $this->assign([
            'title' => '内容管理'
        ]);
        return $this->fetch();
    }


}