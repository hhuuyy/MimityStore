<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<table class="table table-bordered" id="myTable">
	<thead>
		<tr>
			<th>Id</th>
			<th>Customer</th>
			<th>OrderDate</th>
			<th>Amount</th>
			<th>Receiver</th>
			<th>Info</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="o" items="${orders}">
			<tr>
				<td>${o.id}</td>
				<td>${o.customer.id}</td>
				<td>${o.orderDate}</td>
				<td>${o.amount}</td>
				<td>${o.receiver}</td>
				<td><a href="order/detail/${o.id}.php" class="btn btn-default">
						<span class="icon-info-sign">View</span>
				</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>