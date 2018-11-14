<?php


namespace app\common\model;


class ProductMultilingualCategory extends BaseModel
{
    public function language()
    {
        return $this->belongsTo('Language', 'language_id', 'id');
    }
}