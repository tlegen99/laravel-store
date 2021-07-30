@foreach($products as $product)
@php
	$image = '';
	if (count($product->images) > 0) {
		$image = $product->images[0]['image'];
	}else{
		$image = 'no-image.jpg';
	}
@endphp
<!-- Product -->
<div class="product">
	<div class="product_image"><img src="images/{{ $image }}" alt=""></div>
	<div class="product_content">
		<div class="product_title"><a href="{{ route('view_product', ['category', $product->id]) }}">{{ $product->title }}</a></div>
		@if($product->new_price != null)
			<div style="text-decoration: line-through;">{{ $product->price }} руб.</div>
			<div class="product_price">{{ $product->new_price }} руб.</div>
		@else
			<div class="product_price">{{ $product->price }} руб.</div>
		@endif
	</div>
</div>
@endforeach
