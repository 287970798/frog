<?php


namespace app\admin\controller;


use app\common\lib\enum\UserEnum;
use app\common\model\User as UserModel;
use think\facade\Session;

class Login extends BaseController
{
    public function index()
    {
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            // 获取用户信息
            $user = UserModel::with(['roles'])
                ->where('username', $post['username'])
                ->where('password', sha1($post['password']))
                ->find();
            if (!$user) {
                return mkRestful(1, '用户不存在');
            }
            if ($user['locked'] === UserEnum::LOCKED) {
                return mkRestful(1, '该帐号被锁定，请联系管理员');
            }
            $user = $user->visible(['roles'=>['id','name'], 'id', 'locked', 'username', 'privileges']);

            // 角色ids
            $roleIds = [];
            // 如果用户被分配角色
            if (isset($user['roles'])) {
                foreach ($user['roles'] as $role) {
                    $roleIds[] = $role['id'];
                }
            }
            $roleIds = join(',', $roleIds);

            $privileges = Role::getRolesPrivileges($roleIds);
            $user['privileges'] = $privileges;
            Session::set('admin', $user);

            return mkRestful(0, '登录成功', 'success');
        }
        $this->assign([
            'title' => '登录'
        ]);
        return $this->fetch();
    }

    public function logout()
    {
        Session::delete('admin');
        $this->redirect('/admin/login', 302);
    }
}