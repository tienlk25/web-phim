<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- Tịch hợp jstl vào trong jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- H E A D E R  <a href="/"><img class="ml-5 mr-4"
			src="https://images.cooltext.com/5349375.png" width="280" height="50"
			alt="Startmovie" /></a> -->
<div class="container-fluid" >
	<nav class="navbar navbar-expand-lg navbar-light"
		style="background-color: #181818;">
		<a href="/"><img id="logo"
			src="${pageContext.request.contextPath}/img/logo.png" width="393" height="85"
			alt="StartMovie" /></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent" style="font-size: 18px;">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle text-light" href="#"
					id="dropdownId" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Thể Loại</a>
					<div class="dropdown-menu bg-dark" aria-labelledby="dropdownId">
						<c:forEach var="category" items="${_categories }">
							<a class="dropdown-item text-light"
								href="/category/${category.theloaiID}">${category.name }</a>
						</c:forEach>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle text-light" href="#"
					id="dropdownId" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Quốc Gia</a>
					<div class="dropdown-menu bg-dark " aria-labelledby="dropdownId">

						<c:forEach var="country" items="${country }">
							<a class="dropdown-item text-light"
								href="/country/${country.countryId}">${country.name }</a>
						</c:forEach>

					</div></li>
				<c:forEach var="hinhthuc" items="${hinhthuc }">
					<li class="nav-item"><a class="nav-link text-light"
						href="/hinhthuc/${hinhthuc.hinhThucId }"><span
							class="text-body">${hinhthuc.name }</span></a></li>
				</c:forEach>

				<li class="nav-item"><a class="nav-link text-light" href="#"><span
						class="text-body">Phim Thuyết Minh</span></a></li>
				<li class="nav-item"><a class="nav-link text-light" href="#"><span
						class="text-body">Phim Chiếu Rạp</span></a></li>
			</ul>

			<form class="form-inline my-2 my-lg-0" action="/rest/api/search" method="get">
				<input class="form-control mr-sm-2" type="search" name="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-dark my-2 my-sm-0" type="submit">
					<i class="glyphicon glyphicon-search"></i>
				</button>
			</form>

			<div class="box-menu ml-1">
				<sec:authorize access="hasRole('USER')" var="isUser" />
				<sec:authorize access="hasRole('ADMIN')" var="isAdmin" />

				<c:choose>
					<c:when test="${isUser }">
						<a href="/logout" onclick="Blog.logout()" class="btn btn-dark my-2 my-sm-0"><i
							class="glyphicon glyphicon-off"></i></a>
					</c:when>
					<c:when test="${isAdmin }">
						<a href="/logout" onclick="Blog.logout()" class="btn btn-dark my-2 my-sm-0"><i
							class="glyphicon glyphicon-off"></i></a>
					</c:when>
					<c:otherwise>
						<a href="/login" class="btn btn-dark my-2 my-sm-0"><i
							class="glyphicon glyphicon-user"></i></a>
					</c:otherwise>
				</c:choose>
				<a href="/favourite-movie" class="btn btn-dark my-2 my-sm-0"><i
					class="glyphicon glyphicon-heart text-danger"> </i> </a>
			</div>
		</div>
	</nav>
</div>
<!-- ----------------------------------------- test data-target="#modalLoginForm" data-toggle="modal"-->