<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class SlugProductsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i=0; $i < 11; $i++) { 
            DB::table('products')->insert([
                'slug' => 'product_' . $i,
            ]);
        }
    }
}
