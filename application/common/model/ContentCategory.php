<?php


namespace app\common\model;


class ContentCategory extends BaseModel
{
    public function multilingual()
    {
        return $this->hasMany('ContentMultilingualCategory', 'category_id', 'id');
    }
}