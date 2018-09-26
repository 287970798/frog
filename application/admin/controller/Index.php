<?php


namespace app\admin\controller;


class Index extends BaseController
{
    public function index()
    {
        $menu = PrivilegeCategory::menu();
        $this->assign([
            'title' => '控制台',
            'menu' => $menu
        ]);
        return $this->fetch();
    }
}