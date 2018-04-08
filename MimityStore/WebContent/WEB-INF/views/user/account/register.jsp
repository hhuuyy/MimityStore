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
							<form:form action="account/register.php" modelAttribute="user"
								enctype="multipart/form-data" class="form-horizontal"
								method="post">
								<h4>Create an account</h4>
								<small>${message}</small>
								<p>
									<label>Username</label>
									<form:input path="id" id="inputFname1" placeholder="User Name" />
								</p>
								<p>
									<label>Password</label>
									<form:input type="password" path="password" id="inputFname1"
										placeholder="Password" />
								</p>
								<p>
									<label>Fullname</label>
									<form:input path="fullname" placeholder="FullName" />
								</p>
								<p>
									<label>Email address</label>
									<form:input path="email" placeholder="Email Address" />
								</p>
								<p>
									<label>Photo</label> <input name="upphoto" type="file" />
								</p>
								<p>
									<input name="activated" value="false" type="hidden">
								</p>
								<p>
									<button type="submit" class="button">
										<i class="fa fa-user"></i> Create an accout
									</button>
								</p>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>