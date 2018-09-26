<?php


namespace app\admin\controller;

use app\common\model\PrivilegeCategory as PriCateModel;
use app\common\model\Privilege as PriModel;

class Privilege extends BaseController
{
    // all
    public function all()
    {
        if ($this->request->isAjax()) {
            $get = $this->request->get();
            $categories = PriModel::with('category')->order('category_id asc,name asc,id asc')->paginate($get['limit'])->toArray();
            return [
                'code' => 0,
                'msg' => '',
                'count' => $categories['total'],
                'data' => $categories['data']
            ];
        }
        $privileges = PriModel::with('category')->order('category_id asc,name asc,id asc')->select();
        $this->assign([
            'title' => '权限管理',
            'privileges' => $privileges
        ]);
        return $this->fetch();
    }

    // detail
    public function detail($model = null)
    {
        return parent::detail(new PriModel());
    }
    // add
    public function add()
    {
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->post();
            $priModel = new PriModel();
            $one = $priModel->where('name', $post['name'])->find();
            if ($one) {
                return mkRestful(1, '权限名已存在');
            }
            $result = $priModel->allowField(true)->save($post);
            if ($result === 1) {
                return mkRestful(0, '新增成功', 'success');
            } else {
                return mkRestful(1, '新增失败');
            }
        }
        $categories = PriCateModel::field('id,name')->select();
        $this->assign([
            'title' => '新增权限',
            'categories' => $categories
        ]);
        return $this->fetch();
    }

    // edit
    public function edit()
    {
        $id = $this->request->param('id');
        $privilege = PriModel::get($id);
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->post();
            $result = $privilege->save($post);
            if ($result === 1) {
                return mkRestful(0, '修改权限成功', 'success');
            } else {
                return mkRestful(1, '修改权限失败');
            }
        }
        if (!$privilege) {
            return mkRestful(-1, '权限不存在');
        }
        $categories = PriCateModel::field('id,name')->select();
        $this->assign([
            'title' => '编辑权限',
            'privilege' => $privilege->getData(),
            'categories' => $categories
        ]);
        return $this->fetch();
    }
    // del
    public function del($model = null)
    {
        // 删除权限，需要删除角色权限中间记录，分类权限中间记录
        // todo...
        return parent::del(new PriModel());
    }
}