<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<form action="account/change.php" method="post" class="form-horizontal">
	<h4>Change Password</h4>
	${message} <input type="hidden" name="id" value="${user.id}" />
	<div class="control-group">
		<label class="control-label" for="inputLnam">Current Password <sup
			style="color: red">*</sup></label>
		<div class="controls">
			<input type="password" name="password" id="myPassword"
				placeholder="Password" /> <span class="icon-eye-open"
				onmouseover="mouseoverPass();" onmouseout="mouseoutPass();"></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputLnam">New Password<sup
			style="color: red">*</sup></label>
		<div class="controls">
			<input type="password" name="password1" id="inputLnam"
				placeholder="New Password" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputLnam">Conform New
			Password <sup style="color: red">*</sup>
		</label>
		<div class="controls">
			<input type="password" name="password2" id="inputLnam"
				placeholder="New Password" />
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<button class="btn btn-primary">Change</button>
		</div>
	</div>
</form>