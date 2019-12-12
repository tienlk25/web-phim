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
	style="font-family: Verdana, sans-serif; font-size: 13px; line-height: 1.5; background-color: #101010;">

	<!-- H E A D E R -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!-- end menu -->
	<!-- MAIN -->	
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-3 col-sm-6 col-xs-12 row-container">
			
			<form class="text-center mt-5  p-5" action="/perform_login" method="post" style="background-color: rgba(255,255,255,.02); color: #cdcdcd;">
				<p class="h4 mb-4">Sign in</p>
				<!-- Email type="email"-->
				<input name="uname" id="defaultLoginFormEmail"
					class="form-control mb-4" placeholder="E-mail">
				
				<!-- Password -->
				<input name="psw" type="password" id="defaultLoginFormPassword"
					class="form-control mb-4" placeholder="Password">

				<div class="d-flex justify-content-around">
					<div>
						<!-- Remember me -->
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input"
								id="defaultLoginFormRemember"> <label
								class="custom-control-label" for="defaultLoginFormRemember">Nhớ mật khẩu</label>
						</div>
					</div>
					<div>
						<!-- Forgot password -->
						<a href="#" style="color: #77c282;">Quên mật khẩu?</a>
					</div>
				</div>

				<!-- Sign in button -->
				<button  class="btn btn-secondary btn-block my-4" name="submit" type="submit">Sign
					in</button>

				<!-- Register -->
				<p>
					Chưa có tài khoản? <a href="/signup" style="color: #77c282;">Đăng kí</a>
				</p>
				<!-- Social login 
				<p>or sign in with:</p>

				<a href="#" class="mx-2" role="button"><i
					class="fab fa-facebook-f light-blue-text"></i></a> <a href="#"
					class="mx-2" role="button"><i
					class="fab fa-twitter light-blue-text"></i></a> <a href="#"
					class="mx-2" role="button"><i
					class="fab fa-linkedin-in light-blue-text"></i></a> <a href="#"
					class="mx-2" role="button"><i
					class="fab fa-github light-blue-text"></i></a>-->
				

			</form>
			<!-- Default form login -->

		</div>
	</div>
	</div>
    <!-- End Main -->
	<!-- F O O T E R -->
</body>
</html>