<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container">
<div class="row">
	<!-- page header-->
	<div class="col-lg-12">
		<h1 class="page-header">PRODUCT MANAGER</h1>
	</div>
	<!-- end page header-->
</div>
<div class="panel panel-default">
	<div class="panel-heading">Edition </div>
	<div class="panel-body">
		<div class="row">
			<form:form action="admin/product/index.php" modelAttribute="model"
					 enctype="multipart/form-data">
					<div class="row">
						<div class="form-group col-sm-4">
							<label>Id</label>
							<form:input path="id" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Name</label>
							<form:input path="name" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Unit Price</label>
							<form:input path="unitPrice" cssClass="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-4">
							<label>Discount Level (<span id="discount"></span>)
							</label>
							<form:input path="discount" cssClass="form-control" type="range"
								min="0" max="1" step="0.01" />
						</div>
						<div class="form-group col-sm-4">
							<label>Quantity</label>
							<form:input path="quantity" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Unit Brief</label>
							<form:input path="unitBrief" cssClass="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-4">
							<label>Product Date</label>
							<form:input id="datepicker" path="productDate" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>View Count</label>
							<form:input path="views" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Features?</label>
							<div class="form-control">
								<form:checkbox path="special" value="true" label="Special?" />
								<form:checkbox path="available" value="true" label="Available?" />
								<form:checkbox path="latest" value="true" label="Latest?" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-12">
							<label>Image</label>
							<form:hidden path="image"/>
							<input name="upimage" type="file">
						</div>
						<div class="form-group col-sm-12">
							<label>Category</label>
							<form:select path="category.id" cssClass="form-control"
								items="${categories}" itemValue="id" itemLabel="nameVN" />
						</div>
						<div class="form-group col-sm-12">
							<label>Supplier</label>
							<form:select path="supplier.id" cssClass="form-control"
								items="${suppliers}" itemValue="id" itemLabel="name" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-12">
							<label>Description</label>
							<form:textarea path="description" cssClass="form-control"
								rows="5" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-12">
							<button class="btn btn-default"
								formaction="admin/product/insert.php">Insert</button>
							<button class="btn btn-default"
								formaction="admin/product/update.php">Update</button>
							<button class="btn btn-default"
								formaction="admin/product/delete.php">Delete</button>
							<button class="btn btn-default"
								formaction="admin/product/index.php">Reset</button>
						</div>
					</div>

				</form:form>

		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<!-- Advanced Tables -->
		<div class="panel panel-default">
			<div class="panel-heading">List</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hovered" id="myTable">
					<thead>
						<tr>
							<th>Id</th>
							<th>Image</th>
							<th>Name</th>
							<th>Unit Price</th>
							<th>Unit Brief</th>
							<th>Quantity</th>
							<th>Category</th>
							<th>Supplier</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${items}">
							<tr>
								<td>${item.id}</td>
								<td><img src="images/products/${item.image}" height="50"
									width="50"></td>
								<td>${item.name}</td>
								<td>${item.unitPrice}</td>
								<td>${item.unitBrief}</td>
								<td>${item.quantity}</td>
								<td>${item.category.nameVN}</td>
								<td>${item.supplier.name}</td>
								<td><a href="admin/product/edit/${item.id}.php"
									class="btn btn-default btn-sm"> <span
										class="glyphicon glyphicon-edit"></span> Edit
								</a></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
				</div>

			</div>
		</div>
		<!--End Advanced Tables -->
	</div>
</div>
</div>
<!-- Type = range % = JQuery -->
<script>
	$(function() {
		$("input[type=range]").change(function() {
			$("#discount").html((100 * $(this).val()) + "%");
		});
	})
</script>