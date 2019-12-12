<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
	<head>
		<meta charset="UTF-8" />
		<meta name="description" content="Demo using bootstrap." />
		<meta name="keywords" content="HTML, CSS, JavaScript, Java, Spring, MySql, Maven, Bootstrap, JQuery." />
		<meta name="author" content="dainguyen">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<%@ include file="/WEB-INF/views/layout/includer.jsp"%>
		
		<title>Start Movie</title>
	</head>
	
	<body style="font-family: Verdana, sans-serif; font-size: 13px; line-height: 1.5; background-color: #101010;">
		<!--  H E A D E R -->
		<%@ include file="/WEB-INF/views/layout/admin/header.jsp"%>
		
		<!--  M A I N -->
		<div id="main" class="container">
			<h1 class="mt-2"></h1>			
			<div class="row">
				<div class="col-md-12 " style="padding: 5px; ">

					<div class="card" style="background-color: rgba(255,255,255,.02); color: #cdcdcd;">
						<div class="card-header bg-dark">Add Movie</div>
						<div class="card-body">
							<div class="panel-body">
								<!-- đây là cách dùng bind-data của spring. -->
								<form:form modelAttribute="movie" action="/admin/add-movie" enctype="multipart/form-data">
									<form:hidden path="id"/>
									<div class="form-group">
										<label for="txtInput">Thể loại</label>
										<form:select class="form-control" path="category.theloaiID">
											<form:options items="${categories}" itemValue="theloaiID" itemLabel="name"/>
										</form:select>
									</div>
									<div class="form-group">
										<label for="txtInput">Quốc gia</label>
										<form:select class="form-control" path="country.countryId">
											<form:options items="${country}" itemValue="countryId" itemLabel="name"/> 
										</form:select>
									</div>
									<div class="form-group">
										<label for="txtInput">Hình thức</label>
										<form:select class="form-control" path="hinhThuc.hinhThucId">
											<form:options items="${hinhthuc}" itemValue="hinhThucId" itemLabel="name"/> <!-- itemLabel="name" trỏ đến collum name của table hinhthuc -->
										</form:select>
									</div>
									<div class="form-group">
										<label class="required">Tên Phim</label> 
										<form:input path="ten" class="form-control" /> 
									</div>
									<div class="form-group">
										<label class="required">Title</label> 
										<form:input path="title" class="form-control" /> 
									</div>
									<div class="form-group">
										<label class="required">Đạo diễn</label> 
										<form:input path="daoDien" class="form-control" /> 
									</div>
									<div class="form-group">
										<label class="required">Series</label> 
										<form:input path="series" class="form-control" /> 
									</div>
									<div class="form-group">
										<label class="required">Ngày phát hành</label> 
										<form:input path="ngayPhatHanh" class="form-control" /> 
									</div>
									<div class="form-group">
										<label class="required">imdb</label> 
										<form:input path="imdb" class="form-control" /> 
									</div>
									<div class="form-group">
										<label class="required">Description</label> 
										<form:textarea path="description" class="form-control" rows="5"/> 
									</div>
									<div class="form-group">
										<label class="required">Details</label> <br>
										<form:textarea path="details" class="form-control" rows="5"   cssClass="my-summernote" id="my-summernote"></form:textarea> 
									</div> <!-- style="width: 1087px;" -->
									<div class="form-group">
										<label>Image</label>
										<input type="file" name="postImage"/>
									</div>
									<div class="form-group">
										<label>video</label>
										<input type="file" name="postVideo"/>
									</div>
									<button type="submit" class="btn btn-secondary"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;Save</button>
								</form:form>
						  	</div>
						</div>
					</div>

					
				</div>
				
			</div>
		
			<h1 class="my-2"></h1>
		</div>	
	</body>
</html>