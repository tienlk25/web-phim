package com.devpro.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
/* định nghĩa một bean thường */
@Component
public class Employee {
	@Autowired
	public Address address; // dùng autowired để inject một bean vào trong 1 bean khác 
	public String name = "Tienlk25";
	
}
