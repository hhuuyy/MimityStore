<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<div class="row">
	<!-- page header-->
	<div class="col-lg-12">
		<h1 class="page-header">SUPPLIER MANAGER</h1>
	</div>
	<!-- end page header-->
</div>
<div class="panel panel-default">
	<div class="panel-heading">Edition</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-lg-12">
				<form:form action="admin/supplier/index.php" modelAttribute="model"
					enctype="multipart/form-data">
					<span>${message} </span>
					<div class="form-group">
						<label>Id</label>
						<form:input path="id" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Name</label>
						<form:input path="name" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Email</label>
						<form:input path="email" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Phone Number</label>
						<form:input path="phone" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Logo</label><br> <img
							src="images/suppliers/${model.logo}" width="100" height="100" /><br>
						<br>
						<form:hidden path="logo" cssClass="form-control" />
						<input name="uplogo" type="file" />
					</div>
					<div class="form-group">
						<button class="btn btn-primary"
							formaction="admin/supplier/insert.php">Insert</button>
						<button class="btn btn-primary"
							formaction="admin/supplier/update.php">Update</button>
						<button class="btn btn-primary"
							formaction="admin/supplier/delete.php">Delete</button>
						<button class="btn btn-primary"
							formaction="admin/supplier/index.php">Reset</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
.
<div class="row">
	<div class="col-lg-12">
		<!-- Advanced Tables -->
		<div class="panel panel-default">
			<div class="panel-heading">List</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover"
						id="myTable">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Email</th>
								<th>Phone</th>							
								<th>Logo</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${items}">
								<tr>
									<td>${item.id}</td>
									<td>${item.name}</td>
									<td>${item.email}</td>
									<td>${item.phone}</td>
									<td><img src="images/suppliers/${item.logo}" height="50"
										width="50"></td>
									<td><a href="admin/supplier/edit/${item.id}.php"
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