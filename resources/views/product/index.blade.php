@extends('layouts.front')

@section('content')
@if(session()->has('success_msg'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{ session()->get('success_msg') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
        </button>
    </div>
@endif
<div class="container">
    <a href="{{url('/home')}}" class="btn btn-success">Return to categories</a><br><br>
    <div class="custom-row-2">
        @forelse ($products as $product)
            @include('product._single_product')
        @empty
            <hr>
            <br><br><br><br><br><br />
            <h1></h1>
            <h2><strong>No {{ $categoryName ?? null }} Products</strong> </h2>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        @endforelse
    </div>


</div>

@endsection
