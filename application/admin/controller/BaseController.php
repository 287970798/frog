<?php


namespace app\admin\controller;


use think\Controller;
use think\facade\Session;

class BaseController extends Controller
{
    protected $config;

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
        if (!Session::has('admin') && $requestPrivilege !== 'admin/login/index') {
            $this->redirect('/admin/login', 302);
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
            return json(mkRestful(-1, '记录不存在'));
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
            $return = mkRestful(0, '成功删除' . $result . '条数据', 'success');
        } else {
            $return = mkRestful(1, '删除失败');
        }
        return $return;
    }

    /**
     * @return \think\response\Json
     */
    public function upload()
    {
        $uploadDir = 'uploads';
        $field = $this->request->param('field');
        $file = $this->request->file($field);
        $info = $file->move($uploadDir);
        if ($info) {
            $data = [
                'ext' => $info->getExtension(),
                'filename' => $info->getFilename(),
                'path' => $uploadDir . DIRECTORY_SEPARATOR . $info->getSaveName()
            ];
            return json(mkRestful(0, '上传成功', 'success', $data));
        } else {
            return json(mkRestful(
                1,
                '上传失败',
                'error',
                ['error' => $file->getError()]
            ));
        }
    }

    /**
     * @return \think\response\Json
     */
    public function upload_editor()
    {
        $uploadDir = 'uploads';
        $field = $this->request->param('field');
        $file = $this->request->file($field);
        $info = $file->move($uploadDir);
        if ($info) {

            $data = [
                "url" => 'http://' . $this->request->host() . '/uploads/' . $info->getSaveName(),
                "code" => 200
            ];
            return json($data);
        } else {
            return json(mkRestful(
                1,
                '上传失败',
                'error',
                ['error' => $file->getError()]
            ));
        }
    }
}