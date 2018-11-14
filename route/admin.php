<?php
// login
Route::any('admin/login', 'admin/login/index');
Route::any('admin/logout', 'admin/login/logout');

// content
Route::any('admin/content/all$', 'admin/content/all');
Route::any('admin/content/detail/:id$', 'admin/content/detail');
Route::any('admin/content/edit/:id$', 'admin/content/edit');
Route::any('admin/content/del', 'admin/content/del');
Route::any('admin/content/add$', 'admin/content/add');
// content category
Route::any('admin/content_category/all', 'admin/ContentCategory/getAll');
Route::any('admin/content_category/add/[:pid]', 'admin/ContentCategory/add');
Route::any('admin/content_category/edit/:id', 'admin/ContentCategory/edit');
Route::any('admin/content_category/delete/:id', 'admin/ContentCategory/delete');
Route::any('admin/content_category/status/:id', 'admin/ContentCategory/status');


// product
Route::any('admin/product/all$', 'admin/product/all');
Route::any('admin/product/detail/:id$', 'admin/product/detail');
Route::any('admin/product/edit/:id$', 'admin/product/edit');
Route::any('admin/product/del', 'admin/product/del');
Route::any('admin/product/add$', 'admin/product/add');
// product category
Route::any('admin/product_category/all', 'admin/ProductCategory/getAll');
Route::any('admin/product_category/add/[:pid]', 'admin/ProductCategory/add');
Route::any('admin/product_category/edit/:id', 'admin/ProductCategory/edit');
Route::any('admin/product_category/delete/:id', 'admin/ProductCategory/delete');
Route::any('admin/product_category/status/:id', 'admin/ProductCategory/status');

// config
Route::any('admin/config$', 'admin/config/index');

// privilege category
Route::any('privilege/category/add', 'admin/PrivilegeCategory/add');
Route::any('privilege/category/all', 'admin/PrivilegeCategory/all');
Route::any('privilege/category/detail/:id', 'admin/PrivilegeCategory/detail');
Route::any('privilege/category/edit/:id', 'admin/PrivilegeCategory/edit');
Route::any('privilege/category/del', 'admin/PrivilegeCategory/del');

// privilege
Route::any('privilege/add$', 'admin/Privilege/add');
Route::any('privilege/del$', 'admin/Privilege/del');
Route::any('privilege/edit/:id$', 'admin/Privilege/edit');
Route::any('privilege$', 'admin/Privilege/all');
Route::any('privilege/detail/:id$', 'admin/Privilege/detail');
Route::any('privilege/methods$', 'admin/Privilege/public_getMethods');

// role
Route::any('role/add$', 'admin/Role/add');
Route::any('role/del$', 'admin/Role/del');
Route::any('role/edit/:id$', 'admin/Role/edit');
Route::any('role$', 'admin/Role/all');
Route::any('role/detail/:id$', 'admin/Role/detail');

// user
Route::any('user/add$', 'admin/user/add');
Route::any('user/del$', 'admin/user/del');
Route::any('user/edit/:id$', 'admin/user/edit');
Route::any('user$', 'admin/user/all');
Route::any('user/detail/:id$', 'admin/user/detail');

// config
Route::any('config/edit/:id$', 'admin/config/edit');

// file center
Route::any('admin/file_center/all$', 'admin/FileCenter/all');
Route::any('admin/file_center/detail/:id$', 'admin/FileCenter/detail');
Route::any('admin/file_center/edit/:id$', 'admin/FileCenter/edit');
Route::any('admin/file_center/del', 'admin/FileCenter/del');
Route::any('admin/file_center/add$', 'admin/FileCenter/add');
Route::any('admin/file_center/upload/:field$', 'admin/FileCenter/upload');






