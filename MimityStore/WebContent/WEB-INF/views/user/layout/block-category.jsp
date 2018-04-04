<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@page import="mimity.entity.SubCategory"%>
<%@page import="mimity.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="mimity.controller.HomeController"%>

<div class="block block-category">
	<div class="block-head">
		<ul class="nav-tab">
			<li class="active"><a data-toggle="tab" href="#tab-categories">categories</a></li>
			<li><a data-toggle="tab" href="#tab-guarantee">GUARANTEE</a></li>
		</ul>
	</div>
	<div class="block-inner">
		<div class="tab-container">
			<div id="tab-categories" class="tab-panel active">
				<ul class="categories">
					<%
						HomeController homeC = new HomeController();
						List<Category> listCate = homeC.showCate();
					%>
					<%
						for (Category cate : listCate) {
					%>
					<li><a href="#" title="Perfume &amp; Cologne"> <span
							class="text"><%=cate.getName()%></span> <span class="count"></span>
					</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<div id="tab-guarantee" class="tab-panel">
				<div class="block-guarantee">
					<h5>
						<span>THE OFFICIAL FAMISHOP® SHOP GUARANTEE</span>
					</h5>
					<ul>
						<li><a href="#">Free Shipping Every Day</a></li>
						<li><a href="#">Earn VIP Rewards</a></li>
						<li><a href="#">Dedicated FamiShop Experts</a></li>
						<li><a href="#">Order Missing Pieces</a></li>
					</ul>
					<a href="#" class="button-radius">Learn more<span class="icon"></span></a>
				</div>
			</div>
		</div>
	</div>
</div>