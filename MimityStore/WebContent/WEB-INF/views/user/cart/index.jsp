<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:choose>
	<c:when test="${cart.count == 0}">
		<h1>Your shopping is empty !</h1>
	</c:when>
	<c:otherwise>
		<h2>Shopping Cart</h2>
		<table class="table table-bordered" id="myTables">
			<thead>
				<tr>
					<th>Product</th>
					<th>Name</th>
					<th>Unit Price</th>
					<th>Quantity</th>
					<th>Discount</th>
					<th>Amount</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${cart.items}">
					<tr>
						<td>
								<img src="images/products/${p.image}" width="70" height="50" />
							</td>
						<td>${p.name}</td>
						<td><f:formatNumber value="${p.unitPrice}" type="currency" />
						</td>
						<td><input value="${p.quantity}" class="cart-qty"
							data-id="${p.id}" style="width: 50px;" type="number" min="0"></td>
						<td>${p.discount}</td>
						<td>${p.unitPrice*p.quantity*(1-p.discount)}</td>
						<td><button class="btn btn-default btn-sm"
								remove-cart-id="${p.id}">
								<span class="icon-trash">Delete</span>
							</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<center>
			<div class="text-center">
				<a href="javascript:history.back()" class="btn btn-default"> <span
					class="icon-circle-arrow-left"></span> Continue Shopping
				</a> <a href="cart/clear.php" class="btn btn-default"> <span
					class="icon-remove-sign"></span> Clear Cart
				</a> <a href="order/checkout.php" class="btn btn-default"> <span
					class="icon-circle-arrow-right"></span> Checkout
				</a>
			</div>
		</center>
	</c:otherwise>
</c:choose>

<script>
	$(function() {
		$("[remove-cart-id]").click(function() {
			id = $(this).attr("remove-cart-id");
			$.ajax({
				url : "cart/remove/" + id + ".php",
				dataType : "json",
				success : function(response) {
					$("#cart-cnt").html(response.count);
					$("#cart-amt").html("$" + response.amount);
				}
			});
			$(this).parents("tr").hide(500);
		});

		$(".cart-qty").change(function() {
			qty = $(this).val();
			id = $(this).attr("data-id");
			$.ajax({
				url : "cart/update.php?" + Math.random(),
				data : {
					id : id,
					qty : qty
				},
				dataType : "json",
				success : function(response) {
					$("#cart-cnt").html(response.count);
					$("#cart-amt").html("$" + response.amount);
				}
			});

			tr = $(this).parents("tr");
			price = tr.find("td:eq(1)").html();
			discount = tr.find("td:eq(3)").html();
			tr.find("td:eq(4)").html(qty * price * (1 - discount));
		});
	})
</script>