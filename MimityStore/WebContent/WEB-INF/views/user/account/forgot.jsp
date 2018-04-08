<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container">
	<div class="row">
		<div class="main-page">
			<h1 class="page-title">Forgot Password</h1>
			<div class="page-content">
				<div class="row">
					<div class="col-sm-6">
						<div class="box-border">
							<form action="account/forgot.php" method="post">
								<h4>Already registered?</h4>
								${message}
								<p>
									<label>Username</label> <input type="text" name="id"
										placeholder="Username">
								</p>
								<p>
									<label>Email</label> <input type="text" name="email"
										placeholder="Email">
								</p>
								<p>
									<button type="submit" class="button">
										<i class="fa fa-lock"></i> Submit
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