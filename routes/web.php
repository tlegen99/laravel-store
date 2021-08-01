<?php

use Illuminate\Support\Facades\Route;

Route::get('/store/{category}/{product_id}', 'ProductController@view')->name('view_product');
Route::get('/store/{category}', 'ProductController@viewCategory')->name('view_category');

Route::get('/cart', 'CartController@viewCart')->name('view_cart');

Route::get('/', 'HomeController@index')->name('home');
