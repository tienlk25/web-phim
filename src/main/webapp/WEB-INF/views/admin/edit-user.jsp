<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!-- Tịch hợp jstl vào trong jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />

<meta name="description" content="Demo using bootstrap." />
<meta name="keywords"
	content="HTML, CSS, JavaScript, Java, Spring, MySql, Maven, Bootstrap, JQuery." />
<meta name="author" content="dainguyen">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- C S S -->
<!-- ${pageContext.request.contextPath} <-> localhost:8080 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-4.0.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/glyphicons/css/bootstrap-glyphicons.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/glyphicons/maps/glyphicons-fontawesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/blog.css">

<!-- J A V A S C R I P T -->
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-4.0.js"></script>
<script src="${pageContext.request.contextPath}/js/startmovie.js"></script>


<title>Web phim</title>
</head>
<body  style="font-family: Verdana, sans-serif; font-size: 13px; line-height: 1.5; background-color: #101010;">

	<!-- H E A D E R -->
	<%@ include file="/WEB-INF/views/layout/admin/header.jsp"%>
	<!-- end menu -->
	<!-- MAIN -->
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-3 col-sm-6 col-xs-12 row-container">

				<form:form modelAttribute="user" action="/admin/edit-user"
					class="text-center  p-5"
					style="background-color: rgba(255,255,255,.02); color: #cdcdcd;">
					<form:hidden path="id"/> 
					<c:choose>
						<c:when test="$(status == 'success')">
							<div class=" alert alert-success">
								<Strong>Success</Strong> Indicates a successful or positive
								action.
							</div>
						</c:when>
						<c:when test="$(status == 'faliled')">
							<div class=" alert alert-success">
								<Strong>Failed</Strong> Indicates a successful or positive
								action.
							</div>
						</c:when>
					</c:choose>
					<p class="h4 mb-4">Chỉnh sửa tài khoản</p>

					<!-- Name -->
					<form:input path="name" type="text" class="form-control input-lg mb-4"
						value="" placeholder="Name" />

					<!-- Mobile -->
					<form:input path="mobile" class="form-control mb-4"
						placeholder="Mobile" />
					<!-- Email -->
					<form:input type="email" class="form-control input-lg mb-4" path="email"
						placeholder="E-mail" />

					<!-- Password -->
					<form:input id="userPassword" type="password"
						class="form-control input-lg mb-4" path="password"
						placeholder="Password" />


					<!-- Sign in button -->
					
					<div class="text-center">
					<button type="submit" class="btn btn btn-secondary  "><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;Update</button>
					<a href="/admin/list-user" class="btn btn-secondary my-4"><i class="glyphicon glyphicon-hand-left"></i>&nbsp;Back</a>
				</div>
					<!-- Register -->
				</form:form>
				<!-- Default form login -->

			</div>
		</div>
	</div>


		<!-- End Main -->
		<!-- F O O T E R -->
		
</body>
</html>