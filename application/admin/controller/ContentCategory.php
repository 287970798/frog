<?php


namespace app\admin\controller;


use app\common\model\Language;
use app\common\model\ContentMultilingualCategory;
use think\Db;

class ContentCategory extends BaseController
{
    public function index()
    {
        $this->assign([
            'title' => '内容栏目管理'
        ]);
        return $this->fetch();
    }

    public function getAll()
    {
        $cats = \app\common\model\ContentCategory::all();
        return json(makeApi('成功', 0, $cats));
    }

    // 获取树
    public function tree($pid)
    {
        $cats = (new \app\common\model\ContentCategory())->field('id,pid,name')->select();
        return $this->getTree($cats, $pid);
    }

    // 把数据处理成树状图
    public function getTree($data, $pid)
    {
        $tree = [];
        foreach ($data as $k=>$v){
            if ($v['pid'] === $pid) {
                unset($data[$k]);
                $v['children'] = $this->getTree($data, $v['id']);
                $tree[] = $v;
            }
        }
        return $tree;
    }

    public function add()
    {
        $pid = $this->request->param('pid');
        $config = \app\common\model\Config::get(1);
        $multilingual = $config->multilingual;

        if ($this->request->isAjax() && $this->request->post()) {
            $post = $this->request->post();
            Db::startTrans();
            try {
                $catModel = new \app\common\model\ContentCategory();
                $result = $catModel->allowField(true)->save($post);
                // 记录多语言栏目名
                if ($multilingual === 1) {
                    $multi_data = [];
                    foreach ($post['multi_name'] as $language_id => $language_name) {
                        $multi_data[] = ['language_id' => $language_id, 'category_id' => $catModel->id, 'name' => $language_name];
                    }
                    $MultiModel = new ContentMultilingualCategory();
                    $result2 = $MultiModel->saveAll($multi_data);
                }
                Db::commit();
            } catch (\Exception $e) {
                $result = $e;
                Db::rollback();
            }
            if ($result === 1) {
                $ret = mkRestful(0, '成功', 'success', $catModel);
            } else {
                $ret = mkRestful(1, '出错', 'error', $result);
            }
            return $ret;
        }

        $languages = [];
        if ($multilingual === 1) {
            $languages = Language::all();
        }
        $this->assign([
            'title' => '添加一级栏目',
            'pid' => $pid,
            'multilingual' => $multilingual,
            'languages' => $languages
        ]);
        return $this->fetch();
    }

    public function edit()
    {
        $id = $this->request->param('id');
        $config = \app\common\model\Config::get(1);
        $multilingual = $config->multilingual;

        if ($this->request->isAjax() && $this->request->post()) {
            $post = $this->request->post();
            Db::startTrans();
            try {
                $catModel = new \app\common\model\ContentCategory();
                $result = $catModel->allowField(true)->save($post, ['id' => $id]);
                // 记录多语言栏目名
                if ($multilingual === 1) {
//                    $multi_data = [];
                    foreach ($post['multi_name'] as $language_id => $language_name) {
//                        $multi_data[] = ['language_id' => $language_id, 'category_id' => $id, 'name' => $language_name];
                        // 查询是否已存在
                        $one = ContentMultilingualCategory::where('language_id', $language_id)->where('category_id', $id)->find();
                        if ($one) {
                            // 存在则更新
                            $one->name = $language_name;
                            $one->save();
                        } else {
                            // 不存在则新增
                            $multiCateModel = new ContentMultilingualCategory();
                            $multiCateModel->save(
                                ['language_id' => $language_id, 'category_id' => $id, 'name' => $language_name]
                            );
                        }
                    }
//                    $MultiModel = new ContentMultilingualCategory();
//                    $result2 = $MultiModel->saveAll($multi_data);
                }
                Db::commit();
            } catch (\Exception $e) {
                $result = $e->getMessage();
                Db::rollback();
            }
            if ($result === 1) {
                $ret = mkRestful(0, '成功', 'success', $catModel);
            } else {
                $ret = mkRestful(1, '出错', 'error', $result);
            }
            return $ret;
        }
        if ($multilingual === 1) {
            $cat = \app\common\model\ContentCategory::get($id);
            $languages = Language::with(['multiCat' => function ($query) use ($id) {
                $query->where('category_id', $id);
            }])->select();
        } else {
            $languages = [];
            $cat = \app\common\model\ContentCategory::get($id);
        }
        //  栏目不存在
        if (!$cat) {
            $ret = mkRestful();
            return $ret;
        }
        $this->assign([
            'title' => '添加一级栏目',
            'cat' => $cat,
            'languages' => $languages,
            'multilingual' => $multilingual
        ]);
        return $this->fetch();
    }

    public function delete()
    {
        if (!$this->request->isAjax() || !$this->request->isDelete()) {
            return json(mkRestful(1, '非法操作'));
        }
        $id = $this->request->param('id');
        $hasChildren = \app\common\model\ContentCategory::where('pid', $id)->count();
        if ($hasChildren > 0) {
            return mkRestful(1, '下有子栏目，不能删除');
        }
        $result = \app\common\model\ContentCategory::destroy($id);
        if ($result === 1) {
            $ret = mkRestful(0, '成功', 'success', $result);
        } else {
            $ret = mkRestful();
        }
        return $ret;
    }

    // 状态设置
    public function status()
    {
        $id = $this->request->param('id');
        $status = $this->request->post('status');
        $catModel = new \app\common\model\ContentCategory();
        $result = $catModel->where('id', $id)->setField('status', $status);
        if ($result === 1) {
            $ret = mkRestful(0, '成功', 'success', $catModel);
        } else {
            $ret = mkRestful();
        }

        return $ret;
    }
}