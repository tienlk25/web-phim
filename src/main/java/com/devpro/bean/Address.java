package com.devpro.bean;

import org.springframework.stereotype.Component;
/* đinh nghĩa một bean thường */
@Component

/*  */
//@Service

/* dung cho MVC */
//@Controller  


/* Dùng  cho module: spring-boot-starter-data-jpa */
//@Repository  
public class Address {
	public String address1;
	public String address2;

	public Address() {
		this.address1 = "Thanh Trì";
		this.address2 = "Hà Nội";
	}
}
