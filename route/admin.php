<?php
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

// role
Route::any('role/add$', 'admin/Role/add');
Route::any('role/del$', 'admin/Role/del');
Route::any('role/edit/:id$', 'admin/Role/edit');
Route::any('role$', 'admin/Role/all');
Route::any('role/detail/:id$', 'admin/Role/detail');

// role
Route::any('user/add$', 'admin/user/add');
Route::any('user/del$', 'admin/user/del');
Route::any('user/edit/:id$', 'admin/user/edit');
Route::any('user$', 'admin/user/all');
Route::any('user/detail/:id$', 'admin/user/detail');

