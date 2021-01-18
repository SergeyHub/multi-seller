@extends('layouts.front')

@section('content')

<div class="pl-200 pr-200 overflow clearfix">
    <div class="categori-menu-slider-wrapper clearfix">
        <div class="categories-menu">
            <div class="category-heading">
                <h3>категории<i class="pe-7s-angle-down"></i></h3>
            </div>
            <div class="category-menu-list">
                <ul>
                    @foreach($categories as $category)
                        <li>
                        <a href="{{route('products.index', ['category_id' => $category->id])}}">{{$category->name}}
                            <!--<i class="pe-7s-angle-right"></i>-->
                        </a>
                                    @php
                                        $children = TCG\Voyager\Models\Category::where('parent_id', $category->id)->get();
                                    @endphp
                               @if($children->isNotEmpty())
                                <div class="category-menu-dropdown">
                                    @foreach ($children as $child)
                                        <div class="category-dropdown-style category-common3">
                                            <p class="categories-subtitle">
                                                <a href="{{route('products.index', ['category_id' => $child->id])}}">
                                                {{$child->name}}
                                                </a>
                                            </p>
                                            @php
                                                $grandChild = TCG\Voyager\Models\Category::where('parent_id', $child->id)->get();
                                            @endphp
                                            @if($grandChild->isNotEmpty())
                                                <ul>
                                                    @foreach ($grandChild as $c)
                                                        <li><a href="{{route('products.index', ['category_id' => $c->id])}}">{{$c->name}}</a></li>
                                                    @endforeach
                                                </ul>
                                            @endif
                                        </div>
                                    @endforeach
                                </div>
                              @endif
                        </li>
                    @endforeach
                </ul>
            </div>
        </div>
        <div class="menu-slider-wrapper">
            <div class="menu-style-3 menu-hover text-left bg-success">
                <nav>
                    <ul>
                        <li><a href="{{url('/home')}}">home </a>
                        </li>
                        <li><a href="#">blog  <span
                                    class="sticker-new">hot</span></a>
                        </li>
                        <li><a href="#">contact</a></li>
                        <li><a href="#">about</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

    <!--<div class="electronic-banner-area">
        <div class="custom-row-2">
            <div class="custom-col-style-2 electronic-banner-col-3 mb-30">
                <div class="electronic-banner-wrapper">
                    <img src="assets/img/banner/15.jpg" alt="">
                    <div class="electro-banner-style electro-banner-position">
                        <h1>Live 4K! </h1>
                        <h2>up to 20% off</h2>
                        <h4>Amazon exclusives</h4>
                        <a href="product-details.html">Buy Now→</a>
                    </div>
                </div>
            </div>
            <div class="custom-col-style-2 electronic-banner-col-3 mb-30">
                <div class="electronic-banner-wrapper">
                    <img src="assets/img/banner/16.jpg" alt="">
                    <div class="electro-banner-style electro-banner-position2">
                        <h1>Xoxo ssl </h1>
                        <h2>up to 15% off</h2>
                        <h4>Amazon exclusives</h4>
                        <a href="product-details.html">Buy Now→</a>
                    </div>
                </div>
            </div>
            <div class="custom-col-style-2 electronic-banner-col-3 mb-30">
                <div class="electronic-banner-wrapper">
                    <img src="assets/img/banner/17.jpg" alt="">
                    <div class="electro-banner-style electro-banner-position3">
                        <h1>BY Laptop</h1>
                        <h2>Super Discount</h2>
                        <h4>Amazon exclusives</h4>
                        <a href="product-details.html">Buy Now→</a>
                    </div>
                </div>
            </div>
        </div>
    </div>-->

    <div class="electro-product-wrapper wrapper-padding pt-95 pb-45">

        <div class="container-fluid">
            <div class="section-title-4 text-center mb-40">
                <h2>Top Products</h2>
            </div>
            <div class="top-product-style">

                <div>
                    <div id="electro1">
                        <div class="custom-row-2">

                            @foreach($allProducts as $product)

                                    <div class="col-4">
                                        <div class="card">

                                            <img src="{{asset('./img/'.$product->cover_img)}}"
                                                 alt="Card Image cap" class="card-img-top">
                                            <div class="card-body">
                                                <h6 class="card-text">{{$product->name}}</h6>
                                                <p class="card-text">{{$product->description}}</p>
                                                <h5><b>$</b>&nbsp;{{ $product->price }}</h5>
                                            </div>
                                            <div class="card-body">
                                                <a href="{{ route('cart.add', $product->id) }}" class="card-link">
                                                    Add to cart
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                            @endforeach

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>

@endsection
