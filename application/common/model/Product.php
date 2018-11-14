<?php


namespace app\common\model;


class Product extends BaseModel
{
    public function category()
    {
        return $this->belongsTo('ProductCategory', 'category_id', 'id');
    }
}