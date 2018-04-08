<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<div class="row">
	<div class="box-header">
		<div class="col-sm-12 col-md-12 col-lg-3"></div>
		<div class="block-wrap-search col-sm-6 col-md-6 col-lg-5">
			<div class="advanced-search box-radius">
				<form class="form-inline" action="product/search.php" method="post">
					<div class="form-group search-category">
						<select id="category-select" class="search-category-select">
							<option value="1">All Categories</option>
							<option value="2">Men</option>
							<option value="3">Women</option>
						</select>
					</div>

					<div class="form-group search-input">
						<input name="keywords" value="${param.keywords}"
							placeholder="What are you looking for?">
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
				<a href="cart/index.php" id="cart-amt"><f:formatNumber
						value="${sessionScope['scopedTarget.cart'].amount}"
						type="currency" /> <span class="total"></span> </a>
			</div>

			<div class="block-mini-cart">
				<div class="mini-cart-content">
					<h5 class="mini-cart-head">
						<span id="cart-cnt">${sessionScope['scopedTarget.cart'].count}</span>
						Items in my cart
					</h5>
					<div class="mini-cart-list">
						<ul>
							<c:forEach var="p" items="${cart.items}">
								<li class="product-info">
									<div class="p-left">
										<a href="#" class="remove_link"></a> <a> <img
											class="img-responsive" src="images/products/${p.image}"
											alt="Product">
										</a>
									</div>
									<div class="p-right">
										<p class="p-name">${p.name}</p>
										<p class="product-price">$${p.unitPrice}</p>
										<p>
											Qty: <span data-id="${p.id}">${p.quantity}</span>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="toal-cart">
						<span>Total</span> <span class="toal-price pull-right"
							id="cart-amt"><f:formatNumber
								value="${sessionScope['scopedTarget.cart'].amount}"
								type="currency" /></span>
					</div>
					<div class="cart-buttons">
						<a href="cart/index.php" class="button-radius btn-check-out">Checkout<span
							class="icon"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>