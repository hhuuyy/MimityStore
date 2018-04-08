<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

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
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
	          ['Nhom', 'SoLuong'],
	          <c:forEach var="item" items="${items}">
	          ["${item[0]}",    ${item[1]}],
	          </c:forEach>
	    ]);

		var options = {
			title : 'Hàng tồn kho',
			is3D : true,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart_3d'));
		console.log(chart);
		chart.draw(data, options);
	}
</script>
<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
<table class="table table-hovered" id="myTable" border="1">
	<thead>
		<tr>
			<th>${group}</th>
			<th>So luong</th>
			<th>Gia tri</th>
			<th>Gia thap nhat</th>
			<th>Gia cao nhat</th>
			<th>Gia trung binh</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${items}">
			<tr>
				<td>${item[0]}</td>
				<td>${item[1]}</td>
				<td><f:formatNumber value="${item[2]}" type="currency"></f:formatNumber></td>
				<td><f:formatNumber value="${item[3]}" type="currency"></f:formatNumber></td>
				<td><f:formatNumber value="${item[4]}" type="currency"></f:formatNumber></td>
				<td><f:formatNumber value="${item[5]}" type="currency"></f:formatNumber></td>

			</tr>
		</c:forEach>
	</tbody>
</table>