<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="row">
	<div class="box-header">
		<div class="col-sm-12 col-md-12 col-lg-3"></div>
		<div class="block-wrap-search col-sm-6 col-md-6 col-lg-5">
			<div class="advanced-search box-radius">
				<form class="form-inline">
					<div class="form-group search-category">
						<select id="category-select" class="search-category-select">
							<option value="1">All Categories</option>
							<option value="2">Men</option>
							<option value="3">Women</option>
						</select>
					</div>
					<div class="form-group search-input">
						<input type="text" placeholder="What are you looking for?">
					</div>
					<button type="submit" class="btn-search">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
		</div>
		<div class="wrap-block-cl col-sm-3 col-md-3 col-lg-2">
			<div class="inner-cl box-radius">
				<div class="dropdown language">
					<a data-toggle="dropdown" role="button"><img src="data\en.jpg"
						alt="languae1"></a>
					<ul class="dropdown-menu">
						<li><a href="#"><img src="data\en.jpg" alt="languae2">English</a></li>
						<li><a href="#"><img src="data\fr.jpg" alt="languae3">French</a></li>
					</ul>
				</div>
				<div class="dropdown currency">
					<a data-toggle="dropdown" role="button">USD</a>
					<ul class="dropdown-menu">
						<li><a href="#">$ USD</a></li>
						<li><a href="#">€ EUR</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="block-wrap-cart col-sm-3 col-md-3 col-lg-2">
			<div class="iner-block-cart box-radius">
				<a href="cart.htm"> <span class="total">$459.00</span>
				</a>
			</div>
			<div class="block-mini-cart">
				<div class="mini-cart-content">
					<h5 class="mini-cart-head">2 Items in my cart</h5>
					<div class="mini-cart-list">
						<ul>
							<li class="product-info">
								<div class="p-left">
									<a href="#" class="remove_link"></a> <a href="#"> <img
										class="img-responsive" src="data\p1.jpg" alt="Product">
									</a>
								</div>
								<div class="p-right">
									<p class="p-name">Donec Ac Tempus</p>
									<p class="product-price">$139.98</p>
									<p>Qty: 1</p>
								</div>
							</li>
							<li class="product-info">
								<div class="p-left">
									<a href="#" class="remove_link"></a> <a href="#"> <img
										class="img-responsive" src="data\p2.jpg" alt="Product">
									</a>
								</div>
								<div class="p-right">
									<p class="p-name">Donec Ac Tempus</p>
									<p class="product-price">$139.98</p>
									<p>Qty: 1</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="toal-cart">
						<span>Total</span> <span class="toal-price pull-right">$279.96</span>
					</div>
					<div class="cart-buttons">
						<a href="checkout.htm" class="button-radius btn-check-out">Checkout<span
							class="icon"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>