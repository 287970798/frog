<?php


namespace app\common\model;


class Language extends BaseModel
{
    public function multiCat()
    {
        return $this->hasMany('ContentMultilingualCategory', 'language_id', 'id');
    }
}