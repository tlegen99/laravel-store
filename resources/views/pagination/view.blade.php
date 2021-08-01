<div class="product_pagination">
	<ul>

	    @foreach ($elements as $element)
	        <!-- "Three Dots" Separator -->
	        @if (is_string($element))
	            <li class="disabled">{{ $element }}</li>
	        @endif

	        <!-- Array Of Links -->
	        @if (is_array($element))
{{-- 	        	@php  
	        		$orderBy = '';

	        		if (isset($_GET['order_by'])) {
	        			$orderBy = '&order_by=' . $_GET['order_by'];
	        		}
	        	@endphp --}}
	            @foreach ($element as $page => $url)
	                @if ($page == $paginator->currentPage())
	                    <li class="active">0{{ $page }}.</li>
	                @else
	                    <li><a href="{{ $url }}">0{{ $page }}.</a></li>
	                @endif
	            @endforeach
	        @endif
	    @endforeach
	</ul>
</div>