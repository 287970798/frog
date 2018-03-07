<?php


namespace app\common\model;


class PrivilegeCategory extends BaseModel
{
    public function getPositionAttr($value)
    {
        $position = [
            1 => '左侧栏',
            2 => '顶部导航',
            3 => '右侧栏'
        ];
        return $position[$value];
    }
    public function getDisplayAttr($value)
    {
        $display = [
            1 => '是',
            2 => '否'
        ];
        return $display[$value];
    }
}