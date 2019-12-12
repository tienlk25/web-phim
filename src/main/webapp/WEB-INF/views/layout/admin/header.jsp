<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- Tịch hợp jstl vào trong jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<!-- H E A D E R --> 
	<!-- Logo https://images.cooltext.com/5351231.png -->
	<div class="container-fluid">
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #181818; font-size: 18px">
	<a href="/"><img id="logo" src="${pageContext.request.contextPath}/img/logo.png"  width="393" height="85" alt="StartMovie" /></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
			<div class="container collapse navbar-collapse">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0 ">
					<li class="nav-item"><a class="nav-link text-light"
						href="/admin/list-user"><span class="text-body">Danh sách Tài khoản</span></a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-light" href="#"
						id="dropdownId" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Quản lý nội dung</a>
						<div class="dropdown-menu bg-dark" aria-labelledby="dropdownId">
							<a class="dropdown-item text-light" href="/admin/add-movie">Thêm nội dung</a> <a
								class="dropdown-item text-light" href="/admin/list-movie">Danh sách</a> 
						</div></li>
						
				</ul>
				<a href="/logout" onclick="Blog.logout()" class="btn btn-dark my-2 my-sm-0"><i
							class="glyphicon glyphicon-off"></i></a>
			</div>
		</nav>

	
	