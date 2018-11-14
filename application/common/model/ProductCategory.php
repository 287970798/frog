<?php


namespace app\common\model;


class ProductCategory extends BaseModel
{
    public function multilingual()
    {
        return $this->hasMany('ProductMultilingualCategory', 'category_id', 'id');
    }
}