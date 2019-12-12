<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- Tịch hợp jstl vào trong jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
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
	<!-- MAIN -->
	<div class="container " style="background-color: rgba(0, 0, 0, 0.3);">
		<div class="row">
			<div class="col-md-4">
				<h1 class="my-4"></h1>
				<div class=" float-left">
					<img id="hinhnenimg" data-toggle="tooltip"
						title="${movie.description }"
						src="${pageContext.request.contextPath}/files/img/${movie.images.get(0).name }"
						width="300" alt="The Hobbit: The Desolation of Smaug" />
				</div>
			</div>
			<div class="col-md-6 float-right"
				style="height: 500px; overflow: auto; padding: 0 10px 0 10px">
				<h1 class="my-4"></h1>
				<div class="entry-title"
					style="padding-bottom: 10px; color: #cdcdcd;">
					<h2 id="tentvh2">${movie.description}</h2>
				</div>
				<p style="padding-bottom: 5px; color: #cdcdcd;">
					<b class="textInfo">Thể loại: <span><a
							class="infor text-success" href='/f1/Adventure-Movies/?page=1'
							target='_blank'>Phiêu lưu</a> <a class="infor"
							href='/f1/Fantasy-Movies/?page=1' target='_blank'></a></span></b>
				</p>
				<p style="padding-bottom: 5px; color: #cdcdcd;">
					<b style="">Điểm IMDb:</b> <span class="badge bg-dark text-success"
						id="IMDbspan">${movie.imdb }</span>
				</p>
				<p style="padding-bottom: 5px; color: #cdcdcd;">
					<b>Series: <span><a class="infor text-success"
							href='/Movies-Series/the-lord-of-the-rings-series-376'
							target='_blank'>${movie.series }</a></span></b>
				</p>

				<p style="padding-bottom: 5px; color: #cdcdcd;">
					<b class="textInfo">Đạo diễn: <span><a
							class="infor text-success"
							href='/Movie-Director/peter-jackson-1130' target='_blank'>${movie.daoDien }
						</a></span></b>
				</p>
				<p style="padding-bottom: 5px; color: #cdcdcd;">
					<b class="textInfo">Quốc gia: <span><a
							class="infor text-success"
							href='/country/${movie.country.countryId }' target='_blank'>${movie.country.name }</a></span></b>
				</p>
				<p style="padding-bottom: 5px; color: #cdcdcd;">
					<b class="textInfo">Phát hành:</b> <span class="textInfo">${movie.ngayPhatHanh }</span>
				</p>
				<p style="padding-bottom: 5px; color: #cdcdcd;">
					<b class="textInfo">Lượt xem:</b> <span class="textInfo">3291</span>
				</p>
				<button class="btn" id="play" style="background: #77c282;">
					<i class="glyphicon glyphicon-play">&nbsp;Xem phim</i>
				</button>

				<c:choose>
					<c:when test="${ status == 'success'}">
						<a id="like1" href="javascript:Blog.addListMovie(${movie.id});"
							class="btn btn-danger"> <i
							class="glyphicon glyphicon-thumbs-up">&nbsp;Ưu Thích</i>
						</a>
					</c:when>
					<c:when test="${ status == 'failed'}">
						<a id="dislike2"
							href="javascript:Blog.deleteFavouriteMovie(${movie.id});"
							class="btn btn-danger"> <i
							class="glyphicon glyphicon-thumbs-up">&nbsp;Bỏ Thích</i>
						</a>
					</c:when>
				</c:choose>

				<a id="dislike1"
					href="javascript:Blog.deleteFavouriteMovie(${movie.id});"
					class="btn btn-danger"> <i
					class="glyphicon glyphicon-thumbs-up">&nbsp;Bỏ Thích</i>
				</a> <a id="like2" href="javascript:Blog.addListMovie(${movie.id});"
					class="btn btn-danger"> <i
					class="glyphicon glyphicon-thumbs-up">&nbsp;Ưu Thích</i>
				</a>


			</div>
		</div>
		<div style="width: 935px; color: #cdcdcd;">
			<h3 class="my-4"
				style="margin-top: 0; color: #77c282; font-weight: 700; font-size: 28px; padding-top: 30px;">Nội
				dung phim</h3>
			<p>${movie.details }</p>
		</div>
		<div class="row">
			<div class="col-md-10">
				<h1 class="my-4"></h1>

				<source type="video/mp4">

				<iframe id="video" width="935" height="484"
					src="https://www.youtube.com/embed/fnaojlfdUbs" frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
		</div>
		<!--  https://www.youtube.com/embed/fnaojlfdUbs 
		<div class="container">
			<form action="/action_page.php">
				<div class="form-group">
					<label for="comment"><h5>Bình luận</h5></label>
					<textarea class="form-control" rows="5" id="comment" name="text"
						placeholder="Gửi bình luận..."></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>-->
		
		<div id="fb-root"></div>
		<script async defer crossorigin="anonymous"
			src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v5.0"></script>
		<div class="fb-comments"
			data-href="http://localhost:8080/details/${movie.id }]"
			data-width="935" data-numposts="5"></div>
			
	</div>
	<!-- End Main -->
	<!-- F O O T E R -->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

</body>
</html>