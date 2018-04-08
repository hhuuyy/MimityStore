<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Bootstrap Dashboard</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<base href="${pageContext.request.contextPath}/">
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="css\bootstrap.min.css">
<!-- Google fonts - Roboto -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
<!-- theme stylesheet-->
<link rel="stylesheet" href="css\style.default.css"
	id="theme-stylesheet">
<!-- jQuery Circle-->
<link rel="stylesheet"
	href="css\grasp_mobile_progress_circle-1.0.0.min.css">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="css\custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="img\favicon.ico">
<!-- Font Awesome CDN-->
<!-- you can replace it by local Font Awesome-->
<script src="assets\js\jquery.min.js"></script>
<script src="jui\jquery-ui.min.js"></script>

<script type="text/javascript" src="dataTable/jquery.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="dataTable/jquery.dataTables.min.css" />
<script type="text/javascript" src="dataTable/jquery.dataTables.min.js"></script>
<script type="text/jscript">
	
			$(document).ready(function(e){
				$("#myTable").DataTable();
			});

</script>
<script type="text/javascript" src="js/loader.js"></script>


<link rel="stylesheet" href="jui\jquery-ui.min.css">
<script src="https://use.fontawesome.com/99347ac47f.js"></script>
<!-- Font Icons CSS-->
<link rel="stylesheet"
	href="https://file.myfontastic.com/da58YPMQ7U5HY8Rb6UxkNf/icons.css">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
	<!-- Side Navbar -->
	<nav class="side-navbar">
		<div class="side-navbar-wrapper">
			<div
				class="sidenav-header d-flex align-items-center justify-content-center">
				<div class="sidenav-header-inner text-center">
					<img src="img\avatar-1.jpg" alt="person"
						class="img-fluid rounded-circle">
					<h2 class="h5 text-uppercase">${master.fullName}</h2>
					<span class="text-uppercase">Web Developer</span>
				</div>
				<div class="sidenav-header-logo">
					<a href="admin/home/index.php" class="brand-small text-center"> <strong>B</strong><strong
						class="text-primary">D</strong></a>
				</div>
			</div>
			<div class="main-menu">
				<ul id="side-main-menu" class="side-menu list-unstyled">
					<li class="active"><a href="admin/home/index.php"> <i
							class="icon-home"></i><span>Home</span></a></li>
				</ul>
			</div>
			<div class="admin-menu">
				<ul id="side-admin-menu" class="side-menu list-unstyled">
					<!-- Quan Ly -->
					<li><a href="#pages-nav-list" data-toggle="collapse"
						aria-expanded="false"><i class="icon-interface-windows"></i><span>Quan Li</span>
							<div class="arrow pull-right">
								<i class="fa fa-angle-down"></i>
							</div></a>
						<ul id="pages-nav-list" class="collapse list-unstyled">
							<li><a href="admin/master/index.php">Quan li tai khoan</a></li>
							<li><a href="admin/role/index.php">Quan li vai tro</a></li>
							<li><a href="admin/web-action/index.php">Quan li chuc nang</a></li>
						</ul></li>
					<!-- Phan quyen -->	
					<li><a href="#pages-nav-list2" data-toggle="collapse"
						aria-expanded="false"><i class="icon-picture"></i><span>Phan Quyen</span>
							<div class="arrow pull-right">
								<i class="fa fa-angle-down"></i>
							</div></a>
						<ul id="pages-nav-list2" class="collapse list-unstyled">
							<li><a href="admin/master-role/index.php">Phan vai tro</a></li>
							<li><a href="admin/action-role/index.php">Phan quyen su dung</a></li>
						</ul></li>	
					<!-- Bao cao -->
					<li><a href="#pages-nav-list3" data-toggle="collapse"
						aria-expanded="false"><i class="icon-flask"></i><span>Bao cao</span>
							<div class="arrow pull-right">
								<i class="fa fa-angle-down"></i>
							</div></a>
						<ul id="pages-nav-list3" class="collapse list-unstyled">
							<li><a href="admin/category/index.php">Theo loai</a></li>
							<li><a href="admin/supplier/index.php">Theo hang</a></li>
							<li><a href="admin/customer/index.php">Theo khach hang</a></li>
							<li><a href="admin/order/index.php">Theo hoa don</a></li>
							<li><a href="admin/product/index.php">Theo hang hoa</a></li>
							<li><a href="admin/order-detail/index.php">Theo chi tiet hoa don</a></li>
						</ul></li>
					
					<!-- Thong ke -->
					<li><a href="#pages-nav-list4" data-toggle="collapse"
						aria-expanded="false"><i class="icon-screen"></i><span>Thong ke</span>
							<div class="arrow pull-right">
								<i class="fa fa-angle-down"></i>
							</div></a>
						<ul id="pages-nav-list4" class="collapse list-unstyled">
							<li><a href="admin/inventory/bycategory2.php">Loai ton kho</a></li>
							<li><a href="admin/inventory/bysupplier2.php">Hang ton kho</a></li>
							<li><a href="admin/revenue/byproduct.php">Tung mat hang</a></li>
							<li><a href="admin/revenue/bycategory.php">Tung loai hang</a></li>
							<li><a href="admin/revenue/bysupplier.php">Tung hang</a></li>
							<li><a href="admin/revenue/bycustomer.php">Tung khach hang</a></li>
							<li><a href="admin/revenue/byyear.php">Tung nam</a></li>
							<li><a href="admin/revenue/byquarter.php">Tung quy</a></li>
							<li><a href="admin/revenue/bymonth.php">Tung thang</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="page home-page">
		<!-- navbar-->
		<header class="header">
			<nav class="navbar">
				<div class="container-fluid">
					<div
						class="navbar-holder d-flex align-items-center justify-content-between">
						<div class="navbar-header">
							<a id="toggle-btn" href="#" class="menu-btn"><i
								class="icon-bars"> </i></a><a href="admin/home/index.php" class="navbar-brand">
								<div class="brand-text hidden-sm-down">
									<span>Bootstrap </span><strong class="text-primary">Dashboard</strong>
								</div>
							</a>
						</div>
						<ul
							class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
							<li class="nav-item dropdown"><a id="notifications"
								rel="nofollow" data-target="#" href="#" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false" class="nav-link"><i
									class="fa fa-bell"></i><span class="badge badge-warning">12</span></a>
								<ul aria-labelledby="notifications" class="dropdown-menu">
									<li><a rel="nofollow" href="#" class="dropdown-item">
											<div class="notification d-flex justify-content-between">
												<div class="notification-content">
													<i class="fa fa-envelope"></i>You have 6 new messages
												</div>
												<div class="notification-time">
													<small>4 minutes ago</small>
												</div>
											</div>
									</a></li>
									<li><a rel="nofollow" href="#" class="dropdown-item">
											<div class="notification d-flex justify-content-between">
												<div class="notification-content">
													<i class="fa fa-twitter"></i>You have 2 followers
												</div>
												<div class="notification-time">
													<small>4 minutes ago</small>
												</div>
											</div>
									</a></li>
									<li><a rel="nofollow" href="#" class="dropdown-item">
											<div class="notification d-flex justify-content-between">
												<div class="notification-content">
													<i class="fa fa-upload"></i>Server Rebooted
												</div>
												<div class="notification-time">
													<small>4 minutes ago</small>
												</div>
											</div>
									</a></li>
									<li><a rel="nofollow" href="#" class="dropdown-item">
											<div class="notification d-flex justify-content-between">
												<div class="notification-content">
													<i class="fa fa-twitter"></i>You have 2 followers
												</div>
												<div class="notification-time">
													<small>10 minutes ago</small>
												</div>
											</div>
									</a></li>
									<li><a rel="nofollow" href="#"
										class="dropdown-item all-notifications text-center"> <strong>
												<i class="fa fa-bell"></i>view all notifications
										</strong></a></li>
								</ul></li>
							<li class="nav-item dropdown"><a id="messages"
								rel="nofollow" data-target="#" href="#" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false" class="nav-link"><i
									class="fa fa-envelope"></i><span class="badge badge-info">10</span></a>
								<ul aria-labelledby="notifications" class="dropdown-menu">
									<li><a rel="nofollow" href="#"
										class="dropdown-item d-flex">
											<div class="msg-profile">
												<img src="img\avatar-1.jpg" alt="..."
													class="img-fluid rounded-circle">
											</div>
											<div class="msg-body">
												<h3 class="h5">Jason Doe</h3>
												<span>sent you a direct message</span><small>3 days
													ago at 7:58 pm - 10.06.2014</small>
											</div>
									</a></li>
									<li><a rel="nofollow" href="#"
										class="dropdown-item d-flex">
											<div class="msg-profile">
												<img src="img\avatar-2.jpg" alt="..."
													class="img-fluid rounded-circle">
											</div>
											<div class="msg-body">
												<h3 class="h5">Frank Williams</h3>
												<span>sent you a direct message</span><small>3 days
													ago at 7:58 pm - 10.06.2014</small>
											</div>
									</a></li>
									<li><a rel="nofollow" href="#"
										class="dropdown-item d-flex">
											<div class="msg-profile">
												<img src="img\avatar-3.jpg" alt="..."
													class="img-fluid rounded-circle">
											</div>
											<div class="msg-body">
												<h3 class="h5">Ashley Wood</h3>
												<span>sent you a direct message</span><small>3 days
													ago at 7:58 pm - 10.06.2014</small>
											</div>
									</a></li>
									<li><a rel="nofollow" href="#"
										class="dropdown-item all-notifications text-center"> <strong>
												<i class="fa fa-envelope"></i>Read all messages
										</strong></a></li>
								</ul></li>
							<li class="nav-item"><a href="role/login/logoff.php"
								class="nav-link logout">Logout<i class="fa fa-sign-out"></i></a></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<!-- Counts Section -->
		<section class="dashboard-counts section-padding">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-2 col-md-4 col-6">
						<div class="wrapper count-title d-flex">
							<div class="icon">
								<i class="icon-user"></i>
							</div>
							<div class="name">
								<strong class="text-uppercase">New Clients</strong><span>Last
									7 days</span>
								<div class="count-number">25</div>
							</div>
						</div>
					</div>
					<div class="col-xl-2 col-md-4 col-6">
						<div class="wrapper count-title d-flex">
							<div class="icon">
								<i class="icon-padnote"></i>
							</div>
							<div class="name">
								<strong class="text-uppercase">Work Orders</strong><span>Last
									5 days</span>
								<div class="count-number">400</div>
							</div>
						</div>
					</div>
					<div class="col-xl-2 col-md-4 col-6">
						<div class="wrapper count-title d-flex">
							<div class="icon">
								<i class="icon-check"></i>
							</div>
							<div class="name">
								<strong class="text-uppercase">New Quotes</strong><span>Last
									2 months</span>
								<div class="count-number">342</div>
							</div>
						</div>
					</div>
					<div class="col-xl-2 col-md-4 col-6">
						<div class="wrapper count-title d-flex">
							<div class="icon">
								<i class="icon-bill"></i>
							</div>
							<div class="name">
								<strong class="text-uppercase">New Invoices</strong><span>Last
									2 days</span>
								<div class="count-number">123</div>
							</div>
						</div>
					</div>
					<div class="col-xl-2 col-md-4 col-6">
						<div class="wrapper count-title d-flex">
							<div class="icon">
								<i class="icon-list"></i>
							</div>
							<div class="name">
								<strong class="text-uppercase">Open Cases</strong><span>Last
									3 months</span>
								<div class="count-number">92</div>
							</div>
						</div>
					</div>
					<div class="col-xl-2 col-md-4 col-6">
						<div class="wrapper count-title d-flex">
							<div class="icon">
								<i class="icon-list-1"></i>
							</div>
							<div class="name">
								<strong class="text-uppercase">New Cases</strong><span>Last
									7 days</span>
								<div class="count-number">70</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Header Section-->

		<!-- Statistics Section-->
		<!-- Main Content -->
		<jsp:include page="${param.view}" />
		<!-- /Main Content -->

		<footer class="main-footer">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<p>Your company &copy; 2017-2019</p>
					</div>
					<div class="col-sm-6 text-right">
						<p>
							Design by <a href="https://bootstrapious.com" class="external">Bootstrapious</a>
						</p>
						<!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
					</div>
				</div>
			</div>
		</footer>
	</div>
	<button type="button" data-toggle="collapse"
		data-target="#style-switch" id="style-switch-button"
		class="btn btn-primary btn-sm hidden-xs hidden-sm">
		<i class="fa fa-cog fa-2x"></i>
	</button>
	<div id="style-switch" class="collapse">
		<h4 class="mb-3">Select theme colour</h4>
		<form class="mb-3">
			<select name="colour" id="colour" class="form-control">
				<option value="">select colour variant
				<option value="default">green
				<option value="pink">pink
				<option value="red">red
				<option value="violet">violet
				<option value="sea">sea
				<option value="blue">blue
			</select>
		</form>
		<p>
			<img src="img\template-mac.png" alt="" class="img-fluid">
		</p>
		<p class="text-muted text-small">
			<small>Stylesheet switching is done via JavaScript and can
				cause a blink while page loads. This will not happen in your
				production code.</small>
		</p>
	</div>
	<!-- Javascript files-->
	<script src="js\tether.min.js"></script>
	<script src="js\bootstrap.min.js"></script>
	<script src="js\jquery.cookie.js">
		
	</script>
	<script src="js\grasp_mobile_progress_circle-1.0.0.min.js"></script>
	<script src="js\jquery.nicescroll.min.js"></script>
	<script src="js\jquery.validate.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script src="js\charts-home.js"></script>
	<script src="js\front.js"></script>
	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID.-->
	<!---->
	<script>
		(function(b, o, i, l, e, r) {
			b.GoogleAnalyticsObject = l;
			b[l] || (b[l] = function() {
				(b[l].q = b[l].q || []).push(arguments)
			});
			b[l].l = +new Date;
			e = o.createElement(i);
			r = o.getElementsByTagName(i)[0];
			e.src = '//www.google-analytics.com/analytics.js';
			r.parentNode.insertBefore(e, r)
		}(window, document, 'script', 'ga'));
		ga('create', 'UA-XXXXX-X');
		ga('send', 'pageview');
	</script>
</body>
</html>