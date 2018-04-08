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
	<jsp:include page="${param.view}" />
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js\tether.min.js"></script>
	<script src="js\bootstrap.min.js"></script>
	<script src="js\jquery.cookie.js"></script>
	<script src="js\grasp_mobile_progress_circle-1.0.0.min.js"></script>
	<script src="js\jquery.nicescroll.min.js"></script>
	<script src="js\jquery.validate.min.js"></script>
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