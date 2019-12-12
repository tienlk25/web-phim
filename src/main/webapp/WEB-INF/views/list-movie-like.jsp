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

<body style="font-family: Verdana, sans-serif; font-size: 13px; line-height: 1.5; background-color: #101010;">
	<!-- H E A D E R -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!-- end menu -->
	<!-- M A I N-->
	<div class="container">
		<h2 class="list-product-title" style="color: #cdcdcd;">Phim Ưu
			thích</h2>
	
	</div>
	<div class="container-fluid align-center my-2" style="width: 71%; margin-right: 184px; ">
	 
	
			<div class=" list-item">
				<c:forEach var="movie" items="${listMovie }" varStatus="theCount">
					<a href="${pageContext.request.contextPath}/details/${movie.movieId}" data-toggle="tooltip"
									title="${movie.description}"
									class="item text-center ca_shadow"><img
						src="${pageContext.request.contextPath}/files/img/${movie.images.get(0).name }"
						class=" card-img-top" alt="...">
						<div class="card-title" >
							<b  style="color: #cdcdcd;">${movie.name}</b>
							
							</div></a>
					
				</c:forEach>
			</div>
		</div>		

	<!-- F O O T E R -->

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>

</html>