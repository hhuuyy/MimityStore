<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="page login-page">
		<div class="container">
			<div class="form-outer text-center d-flex align-items-center">
				<div class="form-inner">
					<div class="logo text-uppercase">
						<span>Dash</span><strong class="text-primary">Express</strong>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
					<p style="color:blue">${message}</p>
					<form action="role/login/login.php" method="post">
						<div class="form-group">
							<label for="login-username" class="label-custom">User
								Name</label> <input id="login-username" type="text" name="id"
								required="">
						</div>
						<div class="form-group">
							<label for="login-password" class="label-custom">Password</label>
							<input id="login-password" type="password" name="password"
								required="">
						</div>
						<button type="submit" id="login" class="btn btn-primary">Login</button>
						<!-- This should be submit button but I replaced it with <a> for demo purposes-->
					</form>
				</div>
				<div class="copyrights text-center">
					<p>
						Design by <a href="https://bootstrapious.com" class="external">Bootstrapious</a>
					</p>
					<!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
				</div>
			</div>
		</div>
	</div>
