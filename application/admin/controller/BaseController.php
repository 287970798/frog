<?php


namespace app\admin\controller;


use think\Controller;
use think\facade\Session;

class BaseController extends Controller
{

    public function initialize()
    {
        $this->auth();
    }

    protected function auth()
    {

        if (Session::has('admin')) {
            $admin = Session::get('admin');
            if ($admin['id'] === 1) return;
        };

        // 请求的权限
        $requestPrivilege = $this->request->module() . '/' . $this->request->controller() . '/' . $this->request->action();
        $requestPrivilege = strtolower($requestPrivilege);

        if ($requestPrivilege === 'admin/login/logout') {
            // 登出
            return;
        }


        // 如果已登录，打开login页面，直接跳转到后台控制台
        if ($requestPrivilege === 'admin/login/index') {
            if (Session::has('admin')) {
                $this->redirect('/admin/index/index', 302);
            }
            return;
        }
        // 如果未登录，打开后台页面跳转到登录页
        if (!Session::has('admin') && $requestPrivilege !== 'admin/login/index'){
            $this->redirect('/admin/login',302);
        }

        // 获取用户权限
        $privileges = array_merge($admin['privileges'], [
            'admin/index/index',
            'admin/login/index',
        ]);

        // in_array
        if (!in_array($requestPrivilege, $privileges)) {
            $this->error('无权限');
        }
    }

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