<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- Tịch hợp jstl vào trong jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div id="footer" class="container-fluid text-white"
	style="background-color: #000000;">
	<h1 class="my-4"></h1>
	<div class="container text-center text-md-left">
		<div class="row">
			<div class="col-md-4 mx-auto">
				<h5 class="font-weight-bold text-uppercase mt-3 mb-4"></h5>
				<p style="color: #666666;">
					<b ><a href="/" style="color: #cdcdcd;">Xem phim online</a></b > miễn phí chất lượng cao với
					phụ đề tiếng việt - thuyết minh - lồng tiếng.Web phim có nhiều thể
					loại phim phong phú, đặc sắc, nhiều bộ phim hay nhất - mới nhất.
				</p>
				
<sec:authorize access="hasRole('ADMIN')">
    <button class="btn btn-danger">
			<a href="/admin/list-user" class="text-light">Go to admin 
	</button>
</sec:authorize>

				
			</div>
			  	<div class="col-md-2 mx-auto">
				<h5 class="font-weight-bold text-uppercase mt-3 mb-4" style="color: #cdcdcd;">Quy Định</h5>
				<ul class="list-unstyled" >
					<li><a style="color: #666666;" href="#!">Điều khoản chung</a></li>
					<li><a style="color: #666666;" href="#!">Chính sách bảo mật</a></li>
				</ul>
			</div>
			<div class="col-md-2 mx-auto">
				<h5 class="font-weight-bold text-uppercase mt-3 mb-4" style="color: #cdcdcd;">Giới
					thiệu</h5>
				<ul class="list-unstyled">
					<li><a style="color: #666666;" href="#!">Trang chủ</a></li>
					<li><a style="color: #666666;" href="#!">Facebook</a></li>
				</ul>
			</div>
			<div class="col-md-2 mx-auto">
				<h5 class="font-weight-bold text-uppercase mt-3 mb-4">
					<a style="color: #cdcdcd;" href="/signup">Liên hệ </a>
				</h5>
				<ul class="list-unstyled">
					<li><a style="color: #666666;" href="#!">Email:
							tienlk25@gmail.com</a></li>
					<li><a style="color: #666666;" href="#!">Phone: 0378935xxx </a></li>
				</ul>
			</div>
		</div>
	</div>

		<hr>
	<ul class="list-unstyled list-inline text-center py-2">
		<li class="list-inline-item">
			<h5 class="mb-1">Register for free</h5>
		</li>
		<sec:authorize access="hasRole('USER')" var="isUser" />
				<sec:authorize access="hasRole('ADMIN')" var="isAdmin" />

				<c:choose>
					<c:when test="${isUser }">
						<li class="list-inline-item"><a href="" onclick="Blog.signup()"
			                   class="btn btn-danger btn-rounded" 
			              >Sign up!</a></li>
					</c:when>
					<c:when test="${isAdmin }">
						<li class="list-inline-item"><a href="" onclick="Blog.signup()"
			                   class="btn btn-danger btn-rounded" 
			              >Sign up!</a></li>
					</c:when>
					<c:otherwise>
						<li class="list-inline-item"><a href="/signup"
			                   class="btn btn-danger btn-rounded" 
			              >Sign up!</a></li>
					</c:otherwise>
				</c:choose>
		
	</ul>              
	   <!-- 
	<hr>
	<ul class="list-unstyled list-inline text-center">
		<li class="list-inline-item"><a class="btn-floating btn-fb mx-1">
				<i class="fab fa-facebook-f"> </i>
		</a></li>
		<li class="list-inline-item"><a class="btn-floating btn-tw mx-1">
				<i class="fab fa-twitter"> </i>
		</a></li>
		<li class="list-inline-item"><a
			class="btn-floating btn-gplus mx-1"> <i
				class="fab fa-google-plus-g"> </i>
		</a></li>
		<li class="list-inline-item"><a class="btn-floating btn-li mx-1">
				<i class="fab fa-linkedin-in"> </i>
		</a></li>
		<li class="list-inline-item"><a
			class="btn-floating btn-dribbble mx-1"> <i	
				class="fab fa-dribbble"> </i>
		</a></li>
	</ul>        -->
	<!-- -->
	<div class="footer-copyright text-center py-3" >
		© 2019 Copyright: <a style="color: #666666;"
			href="https://mdbootstrap.com/education/bootstrap/">
			StartMovie.com. All Rights Reserved.</a>
	</div>
</div>

<!-- M O D A L : REGISTER -->







