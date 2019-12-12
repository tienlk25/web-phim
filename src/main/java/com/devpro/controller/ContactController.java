package com.devpro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.Email;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.entities.User;

//@Controller
//public class ContactController {
//	@RequestMapping(value = {"/contact"},method = { RequestMethod.GET})
//	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
//		//từ end-point
//		Signup contact = new Signup();
//		contact.setFullName("Trương Hữu Tiến");
//		contact.setMobile("0378935817");
//		contact.setEmail("tienlk25@gmail.com");
//		contact.setContent("Tập trung code đi, làm bài đi cho tương lai ..");
//		
//		model.addAttribute("contact",contact);
//		return "contact";
//	}
//	@RequestMapping(value = {"/contact-blind-data"},method = { RequestMethod.POST})
//	public String saveContactViaBindData(@ModelAttribute("contact") Signup contact,final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
//		// lưu dữ liệu vào database
//		
////		 Trả về thông báo cho người dùng.
//		System.out.println(contact.getEmail());
//		model.addAttribute("status", "failed");
//		return "contact";
//	}
//	
//	@RequestMapping(value = {"/contact"},method = { RequestMethod.POST})
//	public String saveContact(@ModelAttribute("contact") Contact contact,final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
//		
//		
//		// lưu dữ liệu vào database
//		// Trả về thông báo cho người dùng.
//		model.addAttribute("status", "failed");
//		return "contact";
//	}
//	@RequestMapping(value = {"/contact"},method = { RequestMethod.POST})
//	public String saveContactViaNormar(@ModelAttribute("contact") Contact contact,final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
//		String fullName = request.getParameter("fullName");
//		String email = request.getParameter("email");
//		
//		
//		Contact contact1 = new Contact();
//		contact1.setFullName(fullName);
//		contact1.setEmail(email);
//		System.out.println();
//		model.addAttribute("status","failed");
//		model.addAttribute("contact", contact1);
//		return "contact";
//	}
	
	
//}
