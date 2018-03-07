<?php


namespace app\admin\controller;

use app\common\model\PrivilegeCategory as PriCateModel;

class PrivilegeCategory extends BaseController
{
    // add
    public function add()
    {
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->post();
            // 验证分类名是否存在
            $one = PriCateModel::where('name', $post['name'])->find();
            if ($one) {
                return mkRestful(-1, '分类名已存在');
            }
            $priCateInst = new PriCateModel();
            $result = $priCateInst->save($post);
            return mkRestful(0, '分类添加成功', 'success', $priCateInst);
        }
        $this->assign([
            'title' => '增加权限分类'
        ]);
        return $this->fetch();
    }
    // edit

    // delete
    public function del()
    {
        if (!$this->request->isDelete() || !$this->request->isAjax()) {
            return mkRestful(-1, '非法操作');
        }
        $ids = $this->request->delete('ids');
        $result = PriCateModel::destroy($ids);
        if ($result > 0) {
            $return = mkRestful(0, '成功删除'.$result.'条数据', 'success');
        } else {
            $return = mkRestful(1, '删除失败');
        }
        return $return;
    }
    // all
    public function all()
    {
        $categories = PriCateModel::all();
        if ($this->request->isAjax()) {
            $get = $this->request->get();
            $categories = PriCateModel::paginate($get['limit'])->toArray();
            return [
                'code' => 0,
                'msg' => '',
                'count' => $categories['total'],
                'data' => $categories['data']
            ];
        }
        $this->assign([
            'title' => '权限分类',
            'categories' => $categories
        ]);
        return $this->fetch();
    }
}