<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

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

			<c:forEach var="product" items="${product}" begin="0" end="9">
				<li class="product">
					<div class="product-container">
						<div class="product-left">
							<div class="product-thumb">
								<a class="product-img" href="#"><img
									src="data\option1\p6.jpg" alt="Product"></a> <a
									title="Quick View" href="#" class="btn-quick-view">Quick
									View</a>
							</div>
							<div class="product-status">
								<span class="new">New</span>
							</div>
						</div>
						<div class="product-right">
							<div class="product-name">
								<a href="#">${product.name}</a>
							</div>
							<div class="price-box">
								<span class="product-price">$${product.unitPrice}</span> <span
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
			</c:forEach>
		</ul>
	</div>
</div>