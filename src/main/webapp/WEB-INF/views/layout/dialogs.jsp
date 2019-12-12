<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- D E L E T E -->
<div class="modal" tabindex="-1" role="dialog" id="modalDeleteForm">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Xoá dữ liệu</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">

					<span aria-hidden="true">&times; </span>
				</button>
			</div>
			<div class="modal-body">
				<p>Bạn có chắc chắn muốn xoá dữ liệu không?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="deleteOk">Có</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
			</div>
		</div>
	</div>
</div>
<!-- Đăng xuất đăng nhập -->
<div class="modal fade" id="modalRegisterForm" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<div id= "success" class="alert alert-success"></div>
			<div class="modal-header text-white text-center bg-secondary">
				<h4 class="modal-title font-weight-bold">Sign up</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close"
					onClick="document.getElementById('frmRegiterForm').reset();">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body mx-3">
				<form role="form" method="POST" action="/rest/api/user/register" id="frmRegiterForm">
					<input type="hidden" name="_token" value="" />
					<div class="form-group">
						<label  class="control-label">Username</label>
						<div>
							<input type="text" id="userUserName" class="form-control input-lg" name="name"/>
						</div>
					</div>
					<div class="form-group">
						<label  class="control-label">E-Mail Address</label>
						<div>
							<input id="userEmail" type="email" class="form-control input-lg" name="email"
								value="" />
						</div>
					</div>
					<div class="form-group">
						<label  class="control-label">Password</label>
						<div>
							<input id="userPassword" type="password" class="form-control input-lg"
								name="password" />
						</div>
					</div>
					<div class="form-group">
						<label  class="control-label">Confirm
							Password</label>
						<div>
							<input id="userConfirmPassword" type="password" class="form-control input-lg"
								name="password_confirmation" />
						</div>
					</div>
					<div class="modal-footer d-flex justify-content-center">
						<div class="form-group">
							<div>
								<button type="button" class="btn btn-success" onclick="Blog.userRegister()">
									<i class="glyphicon glyphicon-floppy-save"></i> Register
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="container modal-title font-weight-bold">Sign in</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body mx-3">
				<div class="md-form mb-5">
					<i class="glyphicon glyphicon-envelope prefix grey-text"></i> <input
						type="email" id="defaultForm-email" class="form-control validate"
						placeholder="Your email"> <label data-error="wrong"
						data-success="right" for="defaultForm-email"></label>
				</div>
				<div class="md-form mb-4">
					<i class="glyphicon glyphicon-lock prefix grey-text"></i> <input
						type="password" id="defaultForm-pass"
						class="form-control validate" placeholder="Your password">
					<label data-error="wrong" data-success="right"
						for="defaultForm-pass"></label>
				</div>
			</div>
			<div class="modal-footer justify-content-center">
				<button class="btn btn-success">Login</button>
			</div>
		</div>
	</div>
</div> 
