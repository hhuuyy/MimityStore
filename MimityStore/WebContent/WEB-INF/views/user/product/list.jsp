<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div class="category-products">
	<ul class="products row">
		<c:forEach var="pc" items="${prods}">
			<li class="product col-xs-12 col-sm-4 col-md-3">
				<div class="product-container">
					<div class="inner">
						<div class="product-left">
							<div class="product-thumb">
								<a class="product-img" href="product/detail/${pc.id}.php"><img
									src="images/products/${pc.image}" alt="Product"></a> <a
									title="Quick View" href="product/detail/${pc.id}.php"
									class="btn-quick-view">Quick View</a>
							</div>
						</div>
						<div class="product-right">
							<div class="product-name">
								<a href="product/detail/${pc.id}.php">${pc.name}</a>
							</div>
							<div class="price-box">
								<span class="product-price"><f:formatNumber
										value="${pc.unitPrice*(1-pc.discount)}" type="currency"></f:formatNumber></span>
								<span class="product-price-old"><f:formatNumber
										value="${pc.unitPrice}" type="currency"></f:formatNumber></span>
							</div>
							<div class="product-star">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-half-o"></i>
							</div>
							<div class="product-button">
								<a class="btn-add-wishlist" title="Add to Wishlist">Add
									Wishlist</a> <a class="btn-add-comparre" title="Add to Compare"
									>Add Compare</a> <a class="button-radius btn-add-cart"
									title="Add to Cart" data-cart-id="${pc.id}">Buy<span
									class="icon"></span></a>
							</div>
						</div>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>
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