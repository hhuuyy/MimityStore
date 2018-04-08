<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

${message}
<table class="table table-bordered" id="myTable">
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
		<c:forEach var="p" items="${cart.items}">
			<tr>
				<td><center>
						<img src="images/products/${p.image}" width="70" height="50" />
					</center></td>
				<td>${p.name}</td>
				<td><f:formatNumber value="${p.unitPrice}" type="currency" />
				</td>
				<td>${p.quantity}</td>
				<td>${p.discount}</td>
				<td>${p.unitPrice*p.quantity*(1-p.discount)}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

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
			<form:input id="datepicker" path="requireDate"
				cssClass="form-control" />
		</div>
		<div class="controls">
			<label>Receiver</label>
			<form:input path="receiver" cssClass="form-control" />
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<label>Address</label>
			<form:input path="address" cssClass="form-control" />
		</div>
		<div class="controls">
			<label>Amount</label>
			<form:input path="amount" cssClass="form-control" readonly="true" />
		</div>
		<div class="controls">
			<label>Description</label>
			<form:textarea path="description" cssClass="form-control" rows="3" />
		</div>
		<div class="controls">
			<button class="btn btn-primary">Purchase</button>
		</div>
	</div>
</form:form>