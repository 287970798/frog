<?php


namespace app\common\model;


class Privilege extends BaseModel
{
    public function getDisplayAttr($value)
    {
        $display = [1=>'是',2=>'否'];
        return $display[$value];
    }

    public function category()
    {
        return $this->belongsTo('PrivilegeCategory', 'category_id', 'id')->bind(['category'=>'name']);
    }
}