package com.devpro.entities;
/*
 * Class biểu diễn json trả về nguoiwf dùng từ RestApi.
 * {
 *     status: ["success", "failed"],
 *     message: ""
 * }
 * */
public class RestResponse {
	private String status;
	private String message;
	
	private RestResponse() {}
	
	
	public static RestResponse success(String message) {
		RestResponse response = new RestResponse();
		response.setStatus("success");
		response.setMessage(message);
		
		return response;
	}
	// thông báo dăng kí không thành công
	
	public static RestResponse failed(String message) {
		RestResponse response = new RestResponse();
		response.setStatus("failed");
		response.setMessage(message);
		return response;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
