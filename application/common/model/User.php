<?php


namespace app\common\model;


class User extends BaseModel
{
    public function getLockedAttr($value)
    {
        $locked = [1=>'是',2=>'否'];
        return $locked[$value];
    }

    public function roles()
    {
        return $this->belongsToMany('Role', 'UserRole', 'role_id', 'user_id');
    }

//    public function privileges()
//    {
//        return $this->hasManyThrough('Privilege', 'Role', 'user_id', 'role_id');
//    }
}