<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<script type="text/javascript" src="js/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Hàng hóa', 'Doanh số'], 
				<c:forEach var="item" items="${items}">
		          ["${item[0]}",    ${item[1]}],
		         </c:forEach>
			]);

		var options = {
			title : 'Doanh số bán hàng từng sản phẩm',
			curveType : 'function',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart'));

		chart.draw(data, options);
	}
</script>

<h2>Revenue by ${group}</h2>

<div id="curve_chart" style="width: 900px; height: 500px"></div>

<table class="table table-hovered" id="myTable">
	<thead>
		<tr>
			<th>${group}</th>
			<th>Số lượng bán</th>
			<th>Doanh Thu</th>
			<th>Giá thấp nhất</th>
			<th>Giá cao nhất</th>
			<th>Giá trung bình</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${items}">
			<tr>
				<td>${item[0]}</td>
				<td>${item[1]}</td>
				<td><f:formatNumber value="${item[2]}" type="currency" /></td>
				<td><f:formatNumber value="${item[3]}" type="currency" /></td>
				<td><f:formatNumber value="${item[4]}" type="currency" /></td>
				<td><f:formatNumber value="${item[5]}" type="currency" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>