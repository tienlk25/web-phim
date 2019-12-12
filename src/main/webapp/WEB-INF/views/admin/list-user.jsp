<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="description" content="Demo using bootstrap." />
<meta name="keywords"
	content="HTML, CSS, JavaScript, Java, Spring, MySql, Maven, Bootstrap, JQuery." />
<meta name="author" content="dainguyen">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@ include file="/WEB-INF/views/layout/includer.jsp"%>

<title>Start movie</title>
</head>
<body style="font-family: Verdana, sans-serif; font-size: 13px; line-height: 1.5; background-color: #101010;">
	<!--  H E A D E R #0a0a0a-->
	<%@ include file="/WEB-INF/views/layout/admin/header.jsp"%>

	<!--  M A I N -->
	<div id="main" class="container ">
		<h1 class="mt-2"></h1>

		<div class="row">
			<div class="col-md-12" style="padding: 5px;">
				<h2 class="text-light">Tìm kiếm</h2>
				
				<input class="form-control" id="myInput" type="text"
					placeholder="Search.."> <br>
				<div class="card " style="background-color: rgba(255,255,255,.02);">

					<div class="card-header bg-dark text-white">User List</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered table-dark table-condensed">
								<thead class="thead-dark">
									<tr>
										<th>FullName</th>
										<th>Email</th>
										<th>Mobile</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="myTable" style="color: #b7b2b2;">

									<c:forEach var="user" items="${listUsers }">
										<tr>
											<td>${user.name }</td>
											<td>${user.email }</td>
											<td>${user.mobile }</td>
											<td style="text-align: center;"><a
												href="/admin/edit-user/${user.id }"
												class="btn btn-success btn-sm"> <span
													class="glyphicon glyphicon-edit"></span> Edit
											</a> &nbsp; <a href="javascript:void(0);" onclick="Blog.deleteForm('modalDeleteForm', ${user.id},'/rest/api/user/delete')" class="btn btn-danger btn-sm"> <span
													class="glyphicon glyphicon-remove"></span> Delete
											</a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>

					</div>
				</div>


			</div>

		</div>

		<h1 class="my-2"></h1>
	</div>

	<!--  F O O T E R -->

	<!-- M O D A L -->
	<%@ include file="/WEB-INF/views/layout/dialogs.jsp"%>
</body>
</html>