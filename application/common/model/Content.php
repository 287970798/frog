<?php


namespace app\common\model;


class Content extends BaseModel
{
    public function category()
    {
        return $this->belongsTo('ContentCategory', 'category_id', 'id');
    }
}