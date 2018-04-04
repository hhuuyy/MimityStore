<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@page import="mimity.entity.SubCategory"%>
<%@page import="mimity.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="mimity.controller.HomeController"%>

<div class="main-menu">
	<div class="container">
		<div class="row">
			<nav class="navbar" id="main-menu">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<i class="fa fa-bars"></i>
						</button>
						<a class="navbar-brand" href="#">MENU</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a href="index.htm">Home</a></li>

							<!-- Menu Category và Sub Category -->
							<%
								HomeController homeC = new HomeController();
								List<Category> listCate = homeC.showCate();
							%>
							<%
								for (Category cate : listCate) {
							%>
							<li class="dropdown"><a
								href="product/list-by-category/<%=cate.getId()%>.php"
								class="dropdown-toggle" data-toggle="dropdown"><%=cate.getName()%></a>
								<ul class="dropdown-menu mega_dropdown container-fluid">
									<li class="block-container">
										<ul class="block-megamenu-link">
											<%
												List<SubCategory> listSub = homeC.showSubCateByCate(cate.getId());
													for (SubCategory subCate : listSub) {
											%>
											<li class="link_container"><a href="product/list-by-subcategory/<%=subCate.getId()%>.php"><%=subCate.getName()%></a></li>
											<%
												}
											%>
										</ul>
									</li>
								</ul></li>
							<%
								}
							%>

							<li><a href="blog.htm">Blog</a></li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</nav>
		</div>
	</div>
</div>