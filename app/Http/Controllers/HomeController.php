<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class HomeController extends Controller
{
    public function index()
    {
        $products = Product::where('show_home', 1)->get();

        return view('home.index', [
            'products' => $products
        ]);
    }
}
