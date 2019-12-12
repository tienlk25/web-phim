$(document).ready(function() {
	 $("#like2").hide();
	 $("#dislike1").hide();
    // Hàm setTimeout là của javascript, sau 3s sẽ chạy hàm.
    setTimeout(function() { 
        // $("#modalRegisterForm").modal("show");
    }, 3000);
    $('[data-toggle="tooltip"]').tooltip();
//    $('#my-summernote').summernote();
    //tìm kiếm user trong list-user
    $("#myInput").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#myTable tr").filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
      });
    $('#my-summernote').summernote();   
    // nút Xem phim
    $("#play").click(function() {    	
		$('#video').animate({scrollTop : 1000}, 800);
		//scrollTop : 0 vị trí trên đỉnh trang
		// 800 tốc độ di chuyển
	});	
    
    $(window).scroll(function (event) {
	    var scroll = $(window).scrollTop();
	    console.log(scroll);
	});
    
    //thích
    $("#like1").click(function(){
    	  $("#like1").hide();
    	  $("#dislike1").show();
    });
    $("#dislike2").click(function(){
  	  $("#like2").show();
  	  $("#dislike2").hide();
  });
});


	
var Blog = {
		signup :function(){
			alert('Bạn đã có tài khoản! Không thể đăng kí.')	
		},
		logout: function(){
		    alert('Bạn đã đăng suất thành công.')	
		},
		deleteForm : function(modalId, entityId, restApi) {
			$('#deleteOk').click(function(){
				
				var data = {};
				data["entityId"] = entityId;
				$.ajax({
					url: restApi,
					type: "post",
					contentType: "application/json", // dữ liệu gửi lên RestAPI có dạng là json.
					data: JSON.stringify(data), // object json -> string json
					
					dataType: "json", // dữ liệu từ Rest trả về là json.
					success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
						if (jsonResult.status == "success") {
							//thành công
							window.location.reload();
						}
					}
				});
			}),
			$('#'+modalId).modal('show');
		},
		
		//phân trang
		goNext(url) {
			var tech = Blog.getUrlParameter('page');
			window.location = url + "?page=" + (parseInt(tech) + 1);
		},			
		getUrlParameter : function(sParam) {
			var sPageURL = window.location.search.substring(1),
	        sURLVariables = sPageURL.split('&'),
	        sParameterName,
	        i;			
		    for (i = 0; i < sURLVariables.length; i++) {
		        sParameterName = sURLVariables[i].split('=');	
		        if (sParameterName[0] === sParam) {
		            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
		        }
		    }
		},		
		
//		addFavouriteMovie: function(movieId) {
//			var data = {};
//			
//			data["movieId"] = movieId;			
//			$.ajax({
//				url: "/rest/api/add-favourite",
//				type: "post",
//				contentType: "application/json", // dữ liệu gửi lên RestAPI có dạng là json.
//				data: JSON.stringify(data), // object json -> string json
//				
//				dataType: "json", // dữ liệu từ Rest trả về là json.
//				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
//					if (jsonResult.status == "success") {
//						alert('đã added vào danh sách ưu thích.')
//						alert(jsonResult.status)
//					}
//				}
//			});
//			
//		},		
		
		addListMovie: function(movieId) {
			var data = {};
			data["movieId"] = movieId;
			$.ajax({
				url: "/rest/api/listFavourite/add",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên RestAPI có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ Rest trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					if (jsonResult.status == "success") {
						alert('đã added vào danh sách ưu thích.')
					}
				}
			});
		},		
		
		deleteFavouriteMovie: function(movieId) {
			var data = {};
			data["movieId"] = movieId;
			$.ajax({
				url: "/rest/api/listFavourite/delete",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên RestAPI có dạng là json.
				data: JSON.stringify(data), // object json -> string json				
				dataType: "json", // dữ liệu từ Rest trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					if (jsonResult.status == "success") {
						alert('đã xoá khỏi vào danh sách ưu thích.')
					}
				}
			});
		},		
		userRegister: function() {
			var userName = $( "#name" ).val();
			var email = $( "#email" ).val();
			var password = $( "#password" ).val();		
			var mobile = $('#mobile').val();
			// đây là json: {userName: "", email: "", password: ""}
			var data = {};
			data["userName"] = userName;
			data["email"] = email;
			data["password"] = password;	
			data["mobile"] = mobile;
			$.ajax({
				url: "/rest/api/user/register",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên RestAPI có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				dataType: "json", // dữ liệu từ Rest trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
//					alert(jsonResult.status);		
//					alert(jsonResult.meta);
				 	if (jsonResult.status == "success"){
				 		alert(jsonResult.status);
						$("#divsuccess").show();
						$("#divErorr").hide();							
					} else{
						$("#divErorrMessage").html(jsonResult.message);
						$("#divsuccess").hide();
						$("#divErorr").show();
					}
				}
			});			
		}
}