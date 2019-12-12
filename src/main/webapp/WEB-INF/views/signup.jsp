<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!-- Tịch hợp jstl vào trong jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-4.0.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/glyphicons/css/bootstrap-glyphicons.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/glyphicons/maps/glyphicons-fontawesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/blog.css">

<!-- J A V A S C R I P T -->
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-4.0.js"></script>
<script src="${pageContext.request.contextPath}/js/startmovie.js"></script>


<title>Web phim</title>
</head>
<body
	style="font-family: Verdana, sans-serif; font-size: 13px; line-height: 1.5; background-color: #0a0a0a;">

	<!-- H E A D E R -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!-- end menu -->
	<!-- MAIN -->

	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-3 col-sm-6 col-xs-12 row-container">

				<form:form modelAttribute="signup" action="/signup-bind-data"
					class="text-center  p-5"
					style="background-color: rgba(255,255,255,.02); color: #cdcdcd;">
					<c:choose>
						<c:when test="${ status == 'success'}">
							<div class="alert alert-success" >
								<Strong>Success</Strong> Bạn đã đăng kí thành công.
							</div>
						</c:when>
						<c:when test="${ status == 'failed'}">
							<div class=" alert alert-success" >
								<Strong>Failed</Strong> Đăng kí thất bại
							</div>
						</c:when>
					</c:choose>
					<p class="h4 mb-4">Đăng kí</p>

					<!-- Name -->
					<form:input id="name" path="name" type="text" class="form-control input-lg mb-4"
						value="" placeholder="Name" />

					<!-- Mobile -->
					<form:input id="mobile" path="mobile" class="form-control mb-4"
						placeholder="Mobile" />
					<!-- Email -->
					<form:input id="email" type="email" class="form-control input-lg mb-4" path="email"
						placeholder="E-mail" />

					<!-- Password -->
					<form:input id="password" type="password"
						class="form-control input-lg mb-4" path="password"
						placeholder="Password" />


					<!-- Sign in button -->
					<button class="btn btn-secondary btn-block my-4" type="submit"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;Submit</button>

					<!-- Register -->
					<p>
						Đã có tài khoản? <a href="/login" style="color: #77c282;">Đăng
							nhập</a>
					</p>
				</form:form>
				<!-- Default form login -->
			</div>
		</div>
	</div>


	<!-- End Main -->
	<!-- F O O T E R -->	
</body>
</html>