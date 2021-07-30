<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;

class ProductController extends Controller
{
    public function view($category, $product_id)
    {
        $item = Product::where('id', $product_id)->first();

        return view('product.view', [
            'product' => $item
        ]);
    }

    public function viewCategory(Request $request,$slug)
    {
        $category = Category::where('slug', $slug)->first();

        $products = Product::where('category_id', $category->id)->get();

        if (isset($request->order_by)) {
            $exp = explode('_', $request->order_by);
            if ($request->order_by == 'sort_default') {
                $products = Product::where('category_id', $category->id)->get();
            }else{
                $products = Product::where('category_id', $category->id)->orderBy($exp[0], $exp[1])->get();
            }
        }

        if ($request->ajax()) {
            return view('ajax.order_by', [
                'products' => $products
            ])->render();
        }

        return view('category.view', [
            'category' => $category,
            'products' => $products
        ]);
    }
}
