<?php


namespace app\admin\controller;


use think\Controller;

class BaseController extends Controller
{
    public function detail($model)
    {
        $id = $this->request->param('id');
        $detail = $model->find($id);
        if (!$detail) {
            return mkRestful(-1, '记录不存在');
        }
        $this->assign([
            'title' => '查看详情',
            'detail' => $detail
        ]);
        return $this->fetch();
    }

    public function del($model)
    {
        if (!$this->request->isDelete() || !$this->request->isAjax()) {
            return mkRestful(-1, '非法操作');
        }
        $ids = $this->request->delete('ids');
        $result = $model->destroy($ids);
        if ($result > 0) {
            $return = mkRestful(0, '成功删除'.$result.'条数据', 'success');
        } else {
            $return = mkRestful(1, '删除失败');
        }
        return $return;
    }
}