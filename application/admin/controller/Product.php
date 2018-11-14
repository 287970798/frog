<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/12
 * Time: 22:50
 */

namespace app\admin\controller;

use app\common\model\Language;

class Product extends BaseController
{
    public function all()
    {
        $products = \app\common\model\Product::with(['category'])->order('id DESC')->select();
        if ($this->request->isAjax()) {
            $get = $this->request->get();
            $products = \app\common\model\Product::with(['category'])->order('id DESC')->paginate($get['limit'])->toArray();
            return [
                'code' => 0,
                'msg' => '',
                'count' => $products['total'],
                'data' => $products['data']
            ];
        }
        $this->assign([
            'title' => '产品管理',
            'products' => $products
        ]);
        return $this->fetch();
    }

    public function detail($model = null)
    {
        return parent::detail(new \app\common\model\Product());
    }

    public function add()
    {
        if ($this->request->isAjax() && $this->request->isPost()) {
            $post = $this->request->post();
            $Product = new \app\common\model\Product();
            $result = $Product->allowField(true)->save($post);
            if ($result === 1) {
                return mkRestful(0, '添加成功', 'success');
            } else {
                return mkRestful(1, '添加失败');
            }
        }

        // 获取分类
        $Cat = new ProductCategory();
        $tree = $Cat->tree(0);

        // 多语言
        $config = \app\common\model\Config::get(1);
        $multilingual = $config->multilingual;
        $languages = [];
        if ($multilingual === 1) {
            // 获取语言列表
            $languages = Language::all();
        }

        $this->assign([
            'title' => '产品添加',
            'tree' => $tree,
            'languages' => $languages,
            'multilingual' => $multilingual
        ]);
        return $this->fetch();
    }

    public function edit()
    {
        $id = $this->request->param('id');
        $detail = \app\common\model\Product::with(['category'])->find($id);


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
            return mkRestful(-1, '产品不存在');
        }

        // 获取分类
        $Cat = new ProductCategory();
        $tree = $Cat->tree(0);

        // 多语言
        $config = \app\common\model\Config::get(1);
        $multilingual = $config->multilingual;
        $languages = [];
        if ($multilingual === 1) {
            // 获取语言列表
            $languages = Language::all();
        }

        $this->assign([
            'title' => '产品编辑',
            'detail' => $detail,
            'tree' => $tree,
            'languages' => $languages,
            'multilingual' => $multilingual
        ]);
        return $this->fetch();
    }

    public function del($model = null)
    {
        return parent::del(new \app\common\model\Product());
    }
}