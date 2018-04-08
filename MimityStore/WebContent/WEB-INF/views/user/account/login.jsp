<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container">
	<div class="row">
		<div class="main-page">
			<h1 class="page-title">Authentication</h1>
			<div class="page-content">
				<div class="row">
					<div class="col-sm-6">
						<div class="box-border">
							<form action="account/login.php" method="post">
								<h4>Already registered?</h4>
								${message}
								<p>
									<label>Username</label> <input type="text" name="id"
										placeholder="Username" value="${cookie.uid.value}">
								</p>
								<p>
									<label>Password</label> <input name="password"
										placeholder="Password" type="password"
										value="${cookie.pwd.value}">
								</p>
								<p>
									<label> <input name="remember" type="checkbox"
										value="true" /> Remember me?
									</label>
								</p>
								<p>
									<a href="account/forgot.php">Forgot your password?</a>
								</p>
								<p>
									<button type="submit" class="button">
										<i class="fa fa-lock"></i> Sign in
									</button>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>