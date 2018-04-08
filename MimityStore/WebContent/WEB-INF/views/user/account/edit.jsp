<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<form:form action="account/edit.php" modelAttribute="user"
	enctype="multipart/form-data" class="form-horizontal">
	<h4>Edit Profile</h4>
	<font color="blue">${message}</font>
	<form:hidden path="id" />
	<form:hidden path="password" />
	<div class="control-group">
		<label class="control-label" for="input_email">Fullname <sup
			style="color: red">*</sup></label>
		<div class="controls">
			<form:input path="fullname" id="input_email" placeholder="Full Name" />
			<font color="red"><form:errors path="fullname" /></font>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputPassword1">Email
			Address <sup style="color: red">*</sup>
		</label>
		<div class="controls">
			<form:input type="text" path="email" id="inputPassword1"
				placeholder="Email Address" required="true" />
			<font color="red"><form:errors path="email" /></font>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">Photo</label> <br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
			src="images/customers/${user.photo}" width="200" height="100"><br>
		<div class="controls">
			<input type="file" name="upphoto">
			<form:hidden path="photo" />
		</div>
	</div>
	<form:hidden path="activated" />
	<div class="control-group">
		<div class="controls">
			<button class="btn btn-primary">Update</button>
		</div>
	</div>
</form:form>