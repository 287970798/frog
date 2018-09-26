<?php


namespace app\common\behavior;


use think\App;

class Version
{
    public function run()
    {
        $version = App::VERSION;
        return $version;
    }
}