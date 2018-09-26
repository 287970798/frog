<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/12
 * Time: 22:50
 */

namespace app\admin\controller;


class Product extends BaseController
{
    public function index()
    {
        $this->assign([
            'title' => '产品管理'
        ]);
        return $this->fetch();
    }
}