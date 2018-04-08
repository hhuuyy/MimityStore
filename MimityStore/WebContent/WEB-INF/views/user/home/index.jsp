<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<style>
.ima {
	width: 42px;
	height: 42px;
}
</style>
<div class="row">
	<div class="col-md-12 col-lg-4">
		<!-- block-shop-features -->
		<div class="block block-shop-features">
			<div class="block-head">
				<div class="block-title">
					<div class="block-icon">
						<img src="data\shop-features-icon.png" alt="store icon">
					</div>
					<div class="block-title-text text-sm">shop</div>
					<div class="block-title-text text-lg">features</div>
				</div>
			</div>
			<div class="block-inner">
				<ul class="list-banner">
					<li class="banner-hover"><a href="#"><img
							src="data\option1\banner1.jpg" alt="Banner"></a></li>
					<li class="banner-hover"><a href="#"><img
							src="data\option1\banner2.jpg" alt="Banner"></a></li>
					<li class="banner-hover"><a href="#"><img
							src="data\option1\banner3.jpg" alt="Banner"></a></li>
				</ul>
			</div>
		</div>
		<!-- ./block-shop-features-->
	</div>
	<div class="col-md-12 col-lg-8">
		<!-- block-offers -->
		<div class="block block-offers">
			<div class="block-head">
				<div class="block-title">
					<div class="block-icon">
						<img src="data\offers-icon.png" alt="store icon">
					</div>
					<div class="block-title-text text-sm">today's</div>
					<div class="block-title-text text-lg">offers</div>
				</div>
			</div>
			<div class="block-inner">
				<ul class="products kt-owl-carousel" data-margin="0"
					data-loop="true" data-nav="true"
					data-responsive='{"0":{"items":3},"600":{"items":3},"1000":{"items":3}}'>
					<c:forEach var="p" items="${prods}" begin="5" end="20">
						<li class="product">
							<div class="product-container">
								<div class="product-left">
									<div class="product-thumb">
										<a class="product-img" href="product/detail/${p.id}.php"><img
											src="images/products/${p.image}" alt=""></a> <a
											title="Quick View" href="product/detail/${p.id}.php"
											class="btn-quick-view">Quick View</a>
									</div>
									<div class="product-status">
										<span class="new">New</span> <span class="sale">Sale</span>
									</div>
								</div>
								<div class="product-right">
									<div class="product-name">
										<a href="#">${p.name}</a>
									</div>
									<div class="price-box">
										<span class="product-price">$139.98</span> <span
											class="product-price-old">$169.00</span>
									</div>
									<div class="product-star">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star-half-o"></i>
									</div>
									<div class="product-button">
										<a class="btn-add-wishlist" title="Add to Wishlist" href="#">Add
											Wishlist</a> <a class="btn-add-comparre" title="Add to Compare"
											href="#">Add Compare</a> <a data-cart-id="${p.id}"
											class="button-radius btn-add-cart" title="Add to Cart">Buy<span
											class="icon"></span></a>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- block-offers -->
	</div>
</div>

<div class="block block-hot-deals">
	<div class="block-head">
		<div class="block-title">
			<div class="block-icon">
				<img src="data\offers-icon.png" alt="store icon">
			</div>
			<div class="block-title-text text-sm">hot</div>
			<div class="block-title-text text-lg">deals</div>
		</div>
		<div class="block-countdownt">
			<span class="countdown-lastest" data-y="2016" data-m="10" data-d="1"
				data-h="00" data-i="00" data-s="00"></span>
		</div>
	</div>

	<div class="block-inner">
		<ul class="products kt-owl-carousel" data-margin="20" data-loop="true"
			data-nav="true"
			data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":5}}'>

			<c:forEach var="product" items="${prods}" begin="0" end="10">
				<li class="product">
					<div class="product-container">
						<div class="product-left">
							<div class="product-thumb">
								<a class="product-img" href="product/detail/${product.id}.php"><img
									src="images/products/${product.image}"
									alt="product/detail/${product.id}.php"></a> <a
									title="Quick View" href="#" class="btn-quick-view">Quick
									View</a>
							</div>
							<div class="product-status">
								<span class="new">New</span>
							</div>
						</div>
						<div class="product-right">
							<div class="product-name">
								<a href="product/detail/${product.id}.php">${product.name}</a>
							</div>
							<div class="price-box">
								<span class="product-price">${product.unitPrice}</span> <span
									class="product-price-old">$169.00</span>
							</div>
							<div class="product-star">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-half-o"></i>
							</div>
							<div class="product-button">
								<a class="btn-add-wishlist" title="Add to Wishlist">Add
									Wishlist</a> <a class="btn-add-comparre" title="Add to Compare">Add
									Compare</a> <a class="button-radius btn-add-cart"
									title="Add to Cart" data-cart-id="${product.id}">Buy<span
									class="icon"></span></a>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>