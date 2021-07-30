<?php

use Illuminate\Support\Facades\Route;

Route::get('/{category}/{product_id}', 'ProductController@view')->name('view_product');
Route::get('/{category}', 'ProductController@viewCategory')->name('view_category');

Route::get('/', 'HomeController@index');
