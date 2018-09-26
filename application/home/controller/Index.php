<?php


namespace app\home\controller;


class Index
{
    public function index()
    {
        return __METHOD__;
    }

    public function test($var = 'data')
    {
        $data = [
            [
                'name' => 'tom',
                'age' => 25,
                'height' => '170CM',
                'phone' => '15966326431'
            ],
            [
                'name' => 'jack',
                'age' => 25,
                'height' => '170CM',
                'phone' => '15966326431'
            ],
        ];
        return 'var ' . $var . ' = ' . json_encode($data);
    }
}