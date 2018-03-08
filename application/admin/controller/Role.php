<?php


namespace app\admin\controller;

use app\common\model\Role as RoleModel;

class Role extends BaseController
{
    // add
    public function add()
    {
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->post();
            $roleModel = new RoleModel();
            $one = $roleModel->where('name', $post['name'])->find();
            if ($one) {
                return mkRestful(1, '角色名已存在');
            }
            $result = $roleModel->allowField(true)->save($post);
            if ($result === 1) {
                return mkRestful(0, '添加角色成功', 'success');
            } else {
                return mkRestful(1, '添加角色失败');
            }
        }
        $this->assign([
            'title' => '新增角色'
        ]);
        return $this->fetch();
    }
    // del
    public function del($model = null)
    {
        return parent::del(new RoleModel());
    }

    // edit

    // all
    public function all()
    {
        if ($this->request->isAjax()) {
            $get = $this->request->get();
            $roles = RoleModel::paginate($get['limit'])->toArray();
            return [
                'code' => 0,
                'msg' => '',
                'count' => $roles['total'],
                'data' => $roles['data']
            ];
        }
        $roles = RoleModel::all();
        $this->assign([
            'title' => '角色管理',
            'roles' => $roles
        ]);
        return $this->fetch();
    }

    // detail

}