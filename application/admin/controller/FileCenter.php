<?php


namespace app\admin\controller;


class FileCenter extends BaseController
{
    public function all()
    {
        $files = \app\common\model\FileCenter::order('id DESC')->select();
        if ($this->request->isAjax()) {
            $get = $this->request->get();
            $contents = \app\common\model\FileCenter::order('id DESC')->paginate($get['limit'])->toArray();
            return [
                'code' => 0,
                'msg' => '',
                'count' => $contents['total'],
                'data' => $contents['data']
            ];
        }
        $this->assign([
            'title' => '文件中心',
            'files' => $files
        ]);
        return $this->fetch();
    }

    public function detail($model = null)
    {
        return parent::detail(new \app\common\model\FileCenter());
    }

    public function add()
    {
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->post();
            $file = new \app\common\model\FileCenter();
            $result = $file->save($post);
            return mkRestful(0, '文件添加成功', 'success', $file);
        }
        $this->assign([
            'title' => '添加文件'
        ]);
        return $this->fetch();
    }

    public function edit()
    {
        $id = $this->request->param('id');
        $detail = \app\common\model\FileCenter::get($id);


        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->post();
            $result = $detail->allowField(true)->save($post);
            if ($result === 1) {
                return mkRestful(0, '修改成功', 'success');
            } else {
                return mkRestful(1, '修改失败');
            }
        }
        if (!$detail) {
            return mkRestful(-1, '文件不存在');
        }

        $this->assign([
            'title' => '文件编辑',
            'detail' => $detail
        ]);
        return $this->fetch();
    }

    public function del($model = null)
    {
        return parent::del(new \app\common\model\FileCenter());
    }
}