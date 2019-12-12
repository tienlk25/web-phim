package com.devpro;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

import com.devpro.bean.Employee;
import com.devpro.config.WebMVC;

// staterServer để bên ngoài để gọi tất cả các ..
@SpringBootApplication // điểm cào của spring boot.

public class StartServer implements CommandLineRunner{
	@Autowired private Employee employee;
	
	@Override
	public void run(String... args) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("------------------- C O D E X E C U T E -------------------");
		System.out.println("Name: "+ employee.name);
		System.out.println("Address: "+ employee.address.address1 +" "+employee.address.address2);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(StartServer.class, args);
		System.out.println("xin chao");
	}
}
