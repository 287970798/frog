<?php


namespace app\common\model;


class Role extends BaseModel
{
    public function getDisabledAttr($value)
    {
        $disabled = [1=>'是',2=>'否'];
        return $disabled[$value];
    }

    public function privileges()
    {
        return $this->belongsToMany('Privilege', 'RolePrivilege', 'privilege_id', 'role_id');
    }
}