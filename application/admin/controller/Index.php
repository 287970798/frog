<?php


namespace app\admin\controller;


use think\Controller;

class Index extends Controller
{
    public function index()
    {
        $this->assign([
            'title' => '控制台'
        ]);
        return $this->fetch();
    }
}