<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="top-bar">
	<div class="container">
		<div class="row">
			<ul class="top-bar-link top-bar-link-left">
				<li><i class="fa fa-phone"></i> Call us: 086 826 3717</li>
				<li><i class="fa fa-exchange"></i> ${user.fullname}</li>
			</ul>
			<ul class="top-bar-link top-bar-link-right dot">
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<li><a href="account/login.php">Login</a></li>
						<li><a href="account/register.php">Register</a></li>
						<li><a href="account/forgot.php">Forgot Password</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="account/edit.php">Edit Account</a></li>
						<li><a href="account/change.php">Change Password</a></li>
						<li><a href="account/logoff.php">Log off</a></li>
						<li><a href="order/list.php">Order</a></li>
						<li><a href="order/items.php">Items</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>