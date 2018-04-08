<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="block block-top-sellers">
	<div class="block-head">
		<div class="block-title">
			<div class="block-icon">
				<img src="data\top-seller-icon.png" alt="store icon">
			</div>
			<div class="block-title-text text-sm">top</div>
			<div class="block-title-text text-lg">SELLERS</div>
		</div>
	</div>
	<div class="block-inner">
		<ul class="products kt-owl-carousel" data-items="1"
			data-autoplay="true" data-loop="true" data-nav="true">
			<li class="product">
				<div class="product-container">
					<div class="product-left">
						<div class="product-thumb">
							<a class="product-img" href="#"><img
								src="data\option1\p1.jpg" alt="Product"></a> <a
								title="Quick View" href="#" class="btn-quick-view">Quick
								View</a>
						</div>
					</div>
					<div class="product-right">
						<div class="product-name">
							<a href="#">Cotton Lycra Leggings</a>
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
								href="#">Add Compare</a> <a class="button-radius btn-add-cart"
								title="Add to Cart" href="#">Buy<span class="icon"></span></a>
						</div>
					</div>
				</div>
			</li>
			<li class="product">
				<div class="product-container">
					<div class="product-left">
						<div class="product-thumb">
							<a class="product-img" href="#"><img
								src="data\option1\p2.jpg" alt="Product"></a> <a
								title="Quick View" href="#" class="btn-quick-view">Quick
								View</a>
						</div>
					</div>
					<div class="product-right">
						<div class="product-name">
							<a href="#">Cotton Lycra Leggings</a>
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
								href="#">Add Compare</a> <a class="button-radius btn-add-cart"
								title="Add to Cart" >Buy<span class="icon"></span></a>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
</div>