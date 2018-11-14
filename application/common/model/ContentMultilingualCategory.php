<?php


namespace app\common\model;


class ContentMultilingualCategory extends BaseModel
{
    public function language()
    {
        return $this->belongsTo('Language', 'language_id', 'id');
    }
}