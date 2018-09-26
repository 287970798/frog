<?php


namespace app\admin\controller;

use app\common\lib\enum\PriCateEnum;
use app\common\lib\enum\PriEnum;
use app\common\model\PrivilegeCategory as PriCateModel;
use think\facade\Session;
use think\facade\Url;

class PrivilegeCategory extends BaseController
{
    public static function menu()
    {
        $menu = PriCateModel::with(['privileges' => function($query){return $query->where('display', PriEnum::DISPLAY);}])
            ->where('display', PriCateEnum::DISPLAY)
            ->order('list_order asc')
            ->order('id desc')
            ->select()
            ->visible(['privileges'=>['name', 'a','c','m'], 'id', 'name', 'position'])
            ->toArray();
        foreach ($menu as &$item) {
            foreach ($item['privileges'] as $key => &$privilege) {
                $str = $privilege['m'] . '/' . $privilege['c'] . '/' . $privilege['a'];
                // 删除未无权限的功能，超管理员除外
                if (!in_array(strtolower($str), Session::get('admin')['privileges']) && Session::get('admin.id') !== 1) {
                    unset($item['privileges'][$key]);
                    continue;
                }
                $privilege['url'] = Url::build($str);
            }
        }
//        print_r($menu);
        return $menu;
    }
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
    public function edit()
    {
        $id = $this->request->param('id');
        $detail = PriCateModel::get($id);
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
            return mkRestful(-1, '权限分类不存在');
        }
        $this->assign([
            'title' => '权限分类编辑',
            'detail' => $detail->getData()
        ]);
        return $this->fetch();

    }
    // delete
    public function del($model = null)
    {
        return parent::del(new PriCateModel());
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
    // detail
    public function detail($model = null)
    {
        return parent::detail(new PriCateModel());
    }
}