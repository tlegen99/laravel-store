@extends('layouts.main')

@section('title', 'Category title')

@section('custom_css')
	<link rel="stylesheet" type="text/css" href="/styles/categories.css">
	<link rel="stylesheet" type="text/css" href="/styles/categories_responsive.css">
@endsection

@section('content')
	<!-- Home -->

	<div class="home">
		<div class="home_container">
			<div class="home_background" style="background-image:url(/images/{{$category->image}})"></div>
			<div class="home_content_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="home_title">{{$category->title}}<span>.</span></div>
								<div class="home_text"><p>{{$category->description}}</p></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Products -->

	<div class="products">
		<div class="container">
			<div class="row">
				<div class="col">
					
					<!-- Product Sorting -->
					<div class="sorting_bar d-flex flex-md-row flex-column align-items-md-center justify-content-md-start">
						<div class="results">Showing <span>{{$category->products->count()}}</span> results</div>
						<div class="sorting_container ml-md-auto">
							<div class="sorting">
								<ul class="item_sorting">
									<li>
										<span class="sorting_text">Sort by</span>
										<i class="fa fa-chevron-down" aria-hidden="true"></i>
										<ul>
											<li class="product_sorting_btn" data-order="sort_default">
												<span>По умолчанию</span>
											</li>
											<li class="product_sorting_btn" data-order="price_asc">
												<span>Цена по возрастанию</span>
											</li>
											<li class="product_sorting_btn" data-order="price_desc">
												<span>Цена по убыванию</span>
											</li>
											<li class="product_sorting_btn" data-order="title_asc">
												<span>По имени</span>
											</li>
											<li class="product_sorting_btn" data-order="title_desc">
												<span>По имени в обратном</span>
											</li>
										</ul>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					
					<div class="product_grid">
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
							<div class="product_image"><img src="/images/{{ $image }}" alt=""></div>
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
					</div>
					{{$products->appends(request()->query())->links('pagination.view')}}						
				</div>
			</div>
		</div>
	</div>

	<!-- Icon Boxes -->

	<div class="icon_boxes">
		<div class="container">
			<div class="row icon_box_row">
				
				<!-- Icon Box -->
				<div class="col-lg-4 icon_box_col">
					<div class="icon_box">
						<div class="icon_box_image"><img src="/images/icon_1.svg" alt=""></div>
						<div class="icon_box_title">Free Shipping Worldwide</div>
						<div class="icon_box_text">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie.</p>
						</div>
					</div>
				</div>

				<!-- Icon Box -->
				<div class="col-lg-4 icon_box_col">
					<div class="icon_box">
						<div class="icon_box_image"><img src="/images/icon_2.svg" alt=""></div>
						<div class="icon_box_title">Free Returns</div>
						<div class="icon_box_text">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie.</p>
						</div>
					</div>
				</div>

				<!-- Icon Box -->
				<div class="col-lg-4 icon_box_col">
					<div class="icon_box">
						<div class="icon_box_image"><img src="/images/icon_3.svg" alt=""></div>
						<div class="icon_box_title">24h Fast Support</div>
						<div class="icon_box_text">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie.</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Newsletter -->

	<div class="newsletter">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="newsletter_border"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 offset-lg-2">
					<div class="newsletter_content text-center">
						<div class="newsletter_title">Subscribe to our newsletter</div>
						<div class="newsletter_text"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie eros</p></div>
						<div class="newsletter_form_container">
							<form action="#" id="newsletter_form" class="newsletter_form">
								<input type="email" class="newsletter_input" required="required">
								<button class="newsletter_button trans_200"><span>Subscribe</span></button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
@endsection
@section('custom_js')
	<script>
		$(document).ready(function () {
			$('.product_sorting_btn').click(function () {
				let order_by = $(this).data('order');

				$.ajax({
					url: '{{route('view_category', $category->slug)}}',
					type: "GET",
					data: {
						order_by: order_by,
						page: {{ isset($_GET['page']) ? $_GET['page'] : 1 }}
					},
				    headers: {
				        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
				    },
					success: (data) => {
                        let positionParameters = location.pathname.indexOf('?');
                        let url = location.pathname.substring(positionParameters,location.pathname.length);
                        let newURL = url + '?'; // http://127.0.0.1:8001/phones?
                        newURL += "page={{ isset($_GET['page']) ? $_GET['page'] : 1 }}" + '&order_by=' + order_by; // http://127.0.0.1:8001/phones?order_by=name-z-a
                        history.pushState({}, '', newURL);

						$('.product_grid').html(data);

                        $('.product_grid').isotope('destroy');
                        $('.product_grid').imagesLoaded( function() {
                            let grid = $('.product_grid').isotope({
                                itemSelector: '.product',
                                layoutMode: 'fitRows',
                                fitRows:
                                    {
                                        gutter: 30
                                    }
                            });
                        });
					}
				});
			});
		});
	</script>
	<script src="/js/categories.js"></script>
@endsection