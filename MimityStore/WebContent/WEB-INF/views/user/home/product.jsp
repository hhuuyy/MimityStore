<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>



<div class="row">
	<!-- page header-->
	<div class="col-lg-12">
		<h1 class="page-header">PRODUCT MANAGER</h1>
	</div>
	<!-- end page header-->
</div>

<div class="row">
	<div class="col-lg-12">
		<!-- Advanced Tables -->
		<div class="panel panel-default">
			<div class="panel-heading">List</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
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
								<td>${item.name}</td>
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
