<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<script>
	$(function() {
		$("[data-cart-id]").click(function() {
			id = $(this).attr("data-cart-id");
			$.ajax({
				url : "cart/add/" + id + ".php",
				dataType : "json",
				success : function(response) {
					$("#cart-cnt").html(response.count);
					$("#cart-amt").html("$" + response.amount);
				}
			});

		});
	})
</script>

<div class="container product-page">
	<div class="row">
		<div class="block block-breadcrumbs">
			<ul>
				<li class="home"><a href="#"><i class="fa fa-home"></i></a> <span></span>
				</li>
				<li><a href="#">Beauty & Perfumes</a><span></span></li>
				<li>Men</li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="row">
			<div class="col-sm-5">
				<div class="block block-product-image">
					<div
						class="product-image easyzoom easyzoom--overlay easyzoom--with-thumbnails">
						<img src="images/products/${prod.image}" alt="Product" width="300"
							height="300" />

					</div>
					<!-- <div class="text">Hover on the image to zoom</div> -->
					<div class="product-list-thumb">
						<ul class="thumbnails kt-owl-carousel" data-margin="10"
							data-nav="true"
							data-responsive='{"0":{"items":2},"600":{"items":2},"1000":{"items":3}}'>
							<li><img src="images/products/${prod.image}" alt="" /></li>
							<li><img src="images/products/${prod.image}" alt="" /></li>
							<li><img src="images/products/${prod.image}" alt="" /></li>
							<li><img src="images/products/${prod.image}" alt="" /></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-sm-7">
				<div class="row">

					<div class="col-sm-12 col-md-7">
						<div class="block-product-info">
							<h2 class="product-name">${prod.name}</h2>
							<div class="price-box">
								<span class="product-price"><f:formatNumber
										value="${prod.unitPrice}" type="currency"></f:formatNumber></span> <span
									class="product-price-old"><f:formatNumber
										value="${prod.unitPrice*(1-prod.discount)}" type="currency"></f:formatNumber></span>
							</div>
							<div class="product-star">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-half-o"></i>
							</div>
							<div class="desc">${fn:substring(prod.description, 0,150)}...</div>
							<div class="variations-box">
								<table class="variations-table">
									<tr>
										<td class="table-label">Color</td>
										<td class="table-value">
											<ul class="list-check-box color">
												<li><a class="selected" href="#"><span
														style="background: #4d6dbd;">Blue</span></a></li>
												<li><a href="#"><span style="background: #fb5d5d;">Blue</span></a></li>
												<li><a href="#"><span style="background: #2fbcda;">Blue</span></a></li>
												<li><a href="#"><span style="background: #ffe00c;">Blue</span></a></li>
												<li><a href="#"><span style="background: #72b226;">Blue</span></a></li>
											</ul>
										</td>
									</tr>
									<tr>
										<td class="table-label">Size</td>
										<td class="table-value">
											<ul class="list-check-box">
												<li><a href="#">XL</a></li>
												<li><a href="#">X</a></li>
												<li><a href="#">S</a></li>
												<li><a href="#">XS</a></li>
											</ul>
										</td>
									</tr>
									<tr>
										<td class="table-label">Qty</td>
										<td class="table-value">
											<div class="box-qty">
												<a href="#" class="quantity-minus">-</a> <input type="text"
													class="quantity" value="1"> <a href="#"
													class="quantity-plus">+</a>
											</div> <a class="button-radius btn-add-cart"
											data-cart-id="${prod.id}">Buy<span class="icon"></span></a>
										</td>
									</tr>
								</table>
							</div>
							<div class="box-control-button">
								<a class="link-wishlist" href="#">wishlist</a> <a
									class="link-compare" href="#">Compare</a> <a
									class="link-sendmail" href="#">Email to a Friend</a> <a
									class="link-print" href="#">Print</a>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-5">
						<!-- block  top sellers -->
						<div class="block block-top-sellers">
							<div class="block-head">
								<div class="block-title">
									<div class="block-icon">
										<img src="data/top-seller-icon.png" alt="store icon">
									</div>
									<div class="block-title-text text-sm">top</div>
									<div class="block-title-text text-lg">SELLERS</div>
								</div>
							</div>
							<div class="block-inner">
								<ul class="products kt-owl-carousel" data-margin="10"
									data-items="1" data-autoplay="true" data-loop="true"
									data-nav="true"
									data-responsive='{"0":{"items":1},"600":{"items":2},"1000":{"items":1}}'>
									<li class="product">
										<div class="product-container">
											<div class="product-left">
												<div class="product-thumb">
													<a class="product-img" href="#"><img
														src="data/option1/p1.jpg" alt=""></a> <a
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
													<a class="btn-add-wishlist" title="Add to Wishlist"
														href="#">Add Wishlist</a> <a class="btn-add-comparre"
														title="Add to Compare" href="#">Add Compare</a> <a
														class="button-radius btn-add-cart" title="Add to Cart"
														href="#">Buy<span class="icon"></span></a>
												</div>
											</div>
										</div>
									</li>
									<li class="product">
										<div class="product-container">
											<div class="product-left">
												<div class="product-thumb">
													<a class="product-img" href="#"><img
														src="data/option1/p2.jpg" alt=""></a> <a
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
													<a class="btn-add-wishlist" title="Add to Wishlist"
														href="#">Add Wishlist</a> <a class="btn-add-comparre"
														title="Add to Compare" href="#">Add Compare</a> <a
														class="button-radius btn-add-cart" title="Add to Cart"
														href="#">Buy<span class="icon"></span></a>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<!-- block  top sellers -->
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-12 col-md-12">
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade active in" id="home">
				<h4>Product Information</h4>
				<table class="table table-bordered">
					<tbody>
						<tr class="techSpecRow">
							<th colspan="2">Product Details</th>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Id:</td>
							<td class="techSpecTD2">${prod.id}</td>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Name:</td>
							<td class="techSpecTD2">${prod.name}</td>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Date of production:</td>
							<td class="techSpecTD2">${prod.productDate}</td>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Category:</td>
							<td class="techSpecTD2">${prod.category.nameVN}</td>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Supplier:</td>
							<td class="techSpecTD2">${prod.supplier.name}</td>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Quantity:</td>
							<td class="techSpecTD2">${prod.quantity}</td>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Views:</td>
							<td class="techSpecTD2">${prod.views}</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<!-- upsell Products -->
	<div class="block block-products-owl">
		<div class="block-head">
			<div class="block-title">
				<div class="block-title-text text-lg">Upsell Products</div>
			</div>
		</div>
		<div class="block-inner">
			<ul class="products kt-owl-carousel" data-margin="20"
				data-loop="true" data-nav="true"
				data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":5}}'>
				<c:forEach var="ps" items="${prod.supplier.products}">
					<li class="product">
						<div class="product-container">
							<div class="product-left">
								<div class="product-thumb">
									<a class="product-img" href="product/detail/${ps.id}.php"><img
										src="images/products/${ps.image}" alt=""></a> <a
										title="Quick View" href="product/detail/${ps.id}.php"
										class="btn-quick-view">Quick View</a>
								</div>
							</div>
							<div class="product-right">
								<div class="product-name">
									<a href="product/detail/${ps.id}.php">${ps.name}</a>
								</div>
								<div class="price-box">
									<span class="product-price"><f:formatNumber
											value="${ps.unitPrice}"></f:formatNumber></span> <span
										class="product-price-old"><f:formatNumber
											value="${ps.unitPrice*(1-ps.discount)}" type="currency"></f:formatNumber></span>
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
										title="Add to Cart" data-cart-id="${ps.id}">Buy<span class="icon"></span></a>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- ./upsell Products -->
</div>
