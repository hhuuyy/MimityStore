<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<h2>OrderDetail Manager</h2>

<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#edit">Edition</a></li>
	<li><a data-toggle="tab" href="#list">List of Items</a></li>
</ul>

<div class="tab-content">
	<div id="edit" class="tab-pane fade in active">
		<!-- FORM -->
		<div class="panel panel-default">
			<div class="panel-heading">OrderDetail Edition</div>
			<div class="panel-body">
				${message}
				<form:form action="admin/order-detail/index.php" modelAttribute="model">
					<div class="row">
						<div class="form-group col-sm-3">
							<label>Id</label>
							<form:input path="id" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-3">
							<label>OrderId</label>
							<form:input path="order.id" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-3">
							<label>ProductId</label>
							<form:input path="product.id" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-3">
							<label>UnitPrice</label>
							<form:input path="unitPrice" cssClass="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-3">
							<label>Quantity</label>
							<form:input path="quantity" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-3">
							<label>Discount Level (<span id="discount"></span>)
							</label>
							<form:input path="discount" cssClass="form-control" type="range"
								min="0" max="1" step="0.01" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-12">
							<button class="btn btn-default"
								formaction="admin/order-detail/insert.php">Insert</button>
							<button class="btn btn-default"
								formaction="admin/order-detail/update.php">Update</button>
							<button class="btn btn-default"
								formaction="admin/order-detail/delete.php">Delete</button>
							<button class="btn btn-default"
								formaction="admin/order-detail/index.php">Reset</button>
						</div>
					</div>
				</form:form>
			</div>
			<div class="panel-footer"></div>
		</div>
		<br/><br/><br/><br/>
	</div>
	<div id="list" class="tab-pane fade">
		<!-- BẢNG -->
		<div class="panel panel-default">
			<div class="panel-heading">List of OrderDetails</div>
			<div class="panel-body">
				<table class="table table-hovered" id="myTable">
					<thead>
						<tr>
							<th>Id</th>
							<th>OrderId</th>
							<th>ProductId</th>
							<th>UnitPrice</th>
							<th>Quantity</th>
							<th>Discount</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${items}">
							<tr>
								<td>${item.id}</td>
								<td>${item.order.id}</td>
								<td>${item.product.id}</td>
								<td>${item.unitPrice}</td>
								<td>${item.quantity}</td>
								<td>${item.discount}</td>
								<td><a href="admin/order-detail/edit/${item.id}.php"
									class="btn btn-default btn-sm"> <span
										class="glyphicon glyphicon-edit"></span> Edit
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>
</div>