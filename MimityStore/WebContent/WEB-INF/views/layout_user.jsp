<!DOCTYPE html>
<%@page import="mimity.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="mimity.controller.HomeController"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<base href="${pageContext.request.contextPath}/">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="assets\css\reset.css">
<link rel="stylesheet" type="text/css"
	href="assets\lib\bootstrap\css\bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets\lib\font-awesome\css\font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="assets\lib\owl.carousel\owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="assets\lib\jquery-ui\jquery-ui.css">
<link rel="stylesheet" type="text/css" href="assets\css\animate.css">
<link rel="stylesheet" type="text/css" href="assets\css\global.css">
<link rel="stylesheet" type="text/css" href="assets\css\style.css">
<link rel="stylesheet" type="text/css" href="assets\css\responsive.css">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="assets\lib\jquery\jquery.min.js"></script>
<script type="text/javascript"
	src="assets\lib\jquery\jquery-1.11.2.min.js"></script>
<title>Edo - Home</title>
</head>
<body>
	<!-- header -->
	<header id="header">
		<!-- Top bar -->
		<jsp:include page="user/layout/top-bar.jsp" />
		<!-- Top bar -->
		<div class="container">
			<!-- box header -->
			<jsp:include page="user/layout/box-header.jsp" />
			<!-- ./box header -->

			<!-- main header -->
			<jsp:include page="user/layout/main-header.jsp" />
			<!-- ./main header -->
		</div>
		<!-- main menu-->
		<jsp:include page="user/layout/main-menu.jsp" />
		<!-- ./main menu-->
	</header>
	<!-- ./header -->
	<div class="container">
		<div class="row">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-9">
					<!-- Home slide -->
					<jsp:include page="user/layout/home-slide.jsp" />
					<!-- ./Home slide -->
				</div>
				<div class="col-sm-4 col-md-4 col-lg-3">
					<!-- block category -->
					<jsp:include page="user/layout/block-category.jsp" />
					<!-- ./block category -->
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<!-- block  host deals -->
			<%-- <jsp:include page="user/layout/hot-deals.jsp"/> --%>
			<jsp:include page="${param.view}" />
			<!-- ./block hot deals -->
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="user/layout/footer.jsp" />
	<!-- ./footer -->

	<a href="#" class="scroll_top" title="Scroll to Top"
		style="display: inline;">Scroll</a>

	<script type="text/javascript"
		src="assets\lib\bootstrap\js\bootstrap.min.js"></script>
	<script type="text/javascript"
		src="assets\lib\jquery.bxslider\jquery.bxslider.min.js"></script>
	<script type="text/javascript"
		src="assets\lib\owl.carousel\owl.carousel.min.js"></script>
	<script type="text/javascript"
		src="assets\lib\jquery-ui\jquery-ui.min.js"></script>
	<!-- COUNTDOWN -->
	<script type="text/javascript"
		src="assets\lib\countdown\jquery.plugin.js"></script>
	<script type="text/javascript"
		src="assets\lib\countdown\jquery.countdown.js"></script>
	<!-- ./COUNTDOWN -->
	<script type="text/javascript" src="assets\js\jquery.actual.min.js"></script>
	<script type="text/javascript" src="assets\js\script.js"></script>
	<script>
		$(function() {
			$("[data-cart-id]").click(function() {
				id = $(this).attr("data-cart-id");
				$.ajax({
					url : "cart/add/" + id + ".php",
					dataType : "json",
					success : function(response) {
						$("#cart-cnt").html(response.count);
						$("#cart-amt").html("$" + response.amount);
					}
				});

			});
		})
	</script>
</body>
</html>