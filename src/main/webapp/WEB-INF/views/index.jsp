<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>

<!-- Tịch hợp jstl vào trong jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
<meta charset="UTF-8" />

<meta name="description" content="Demo using bootstrap." />
<meta name="keywords"
	content="HTML, CSS, JavaScript, Java, Spring, MySql, Maven, Bootstrap, JQuery." />
<meta name="author" content="dainguyen">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@ include file="/WEB-INF/views/layout/includer.jsp"%>

<title>Web phim</title>
</head>

<body
	style="font-family: Verdana, sans-serif; font-size: 13px; line-height: 1.5; background-color: #101010;">
	<!-- H E A D E R -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!-- end menu -->
	<!-- slide -->
	<div id="container carouselExampleIndicators"
		class="carousel slide mt-1" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<!-- <img class="d-block w-100" src="img/anh-top.jpg" alt="First slide"> -->
				<img class="d-block w-100"
					ng-src="https://s3img.vcdn.vn/123phim/2019/10/joker-15701565726725.png"
					src="https://s3img.vcdn.vn/123phim/2019/10/joker-15701565726725.png">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="${pageContext.request.contextPath}/img/anh-top-2.jpg">
			</div>
			<div class="carousel-item">
				<!-- <img class="d-block w-100" src="https://s3img.vcdn.vn/123phim/2019/10/willllllllll-15712817015353.jpg" alt="Third slide"> -->
				<img class="d-block w-100"
					ng-src="https://s3img.vcdn.vn/123phim/2019/10/willllllllll-15712817015353.jpg"
					src="https://s3img.vcdn.vn/123phim/2019/10/willllllllll-15712817015353.jpg">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<!-- end slide -->
	<!-- M A I N-->


	<div class="container">
	
		<h2 class="list-product-title text-light">Phim Chiếu Rạp</h2>
	</div>
	 <div class="container-fluid align-center my-2" style="width: 71%; margin-right: 184px; ">
	 
	
			<div class=" list-item">
				<c:forEach var="post" items="${_posts }" varStatus="theCount">
					<a href="${pageContext.request.contextPath}/details/${post.id}" data-toggle="tooltip"
									title="${post.description}"
									class="item text-center ca_shadow"><img
						src="${pageContext.request.contextPath}/files/img/${post.images.get(0).name }"
						class=" card-img-top" alt="...">
						<div class="card-title" >
							<b  style="color: #cdcdcd;">${post.ten}</b>
							
							</div></a>
					
				</c:forEach>
			</div>
		</div>		
					
					</div>



	<!-- F O O T E R -->

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>

</html>