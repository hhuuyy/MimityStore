<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<h2>Thông tin đơn hàng</h2>
<form:form action="order/checkout.php" modelAttribute="order">
	<div class="control-group">
		<div class="controls">
			<label>Customer</label>
			<form:input path="customer.id" cssClass="form-control"
				readonly="true" />
		</div>
		<div class="controls">
			<label>Order Date</label>
			<form:input path="orderDate" cssClass="form-control" readonly="true" />
		</div>
		<div class="controls">
			<label>Require Date</label>
			<form:input path="requireDate" cssClass="form-control"
				readonly="true" />
		</div>
		<div class="controls">
			<label>Receiver</label>
			<form:input path="receiver" cssClass="form-control" readonly="true" />
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<label>Address</label>
			<form:input path="address" cssClass="form-control" readonly="true" />
		</div>
		<div class="controls">
			<label>Amount</label>
			<form:input path="amount" cssClass="form-control" readonly="true" />
		</div>
		<div class="controls">
			<label>Description</label>
			<form:textarea path="description" cssClass="form-control" rows="3"
				readonly="true" />
		</div>
	</div>
</form:form>
<hr>

<h2>Chi tiết đơn hàng</h2>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>Product</th>
			<th>Name</th>
			<th>Unit Price</th>
			<th>Quantity</th>
			<th>Discount</th>
			<th>Amount</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="d" items="${order.orderDetails}">
			<tr>
				<td><center>
						<img src="images/products/${d.product.image}" width="70"
							height="50" />
					</center></td>
				<td>${d.product.name}</td>
				<td>${d.unitPrice}</td>
				<td>${d.quantity}</td>
				<td>${d.discount}</td>
				<td>${d.unitPrice*d.quantity*(1-d.discount)}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>