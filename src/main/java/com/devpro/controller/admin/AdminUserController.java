package com.devpro.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.entities.User;
import com.devpro.reponsitories.SignupReponsitory;

@Controller
public class AdminUserController {
	
    @Autowired SignupReponsitory signupReponsitory;       
	@RequestMapping(value = { "/admin/list-user" }, method = { RequestMethod.GET })
	public String listUser(final ModelMap model,final HttpServletRequest request, final HttpServletResponse response) {
		List<User> lisUsers = signupReponsitory.findAll();
		
		model.addAttribute("listUsers", lisUsers);
		return "admin/list-user";
	}
	
	@RequestMapping(value = { "/admin/edit-user/{userId}" }, method = { RequestMethod.GET })
	public String editUser(@PathVariable int userId,final ModelMap model,final HttpServletRequest request, final HttpServletResponse response) {
		User user = signupReponsitory.getOne(userId);
		
		model.addAttribute("user", user);
		return "admin/edit-user";
	}
	
	
	@RequestMapping(value = { "/admin/edit-user" }, method = { RequestMethod.POST })
	public String saveContactViaBindData(@ModelAttribute("contact") User user
			,final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		// lưu dữ liệu vào database.
		signupReponsitory.save(user);
		
		// trả về thông báo cho người dùng.
		model.addAttribute("status", "success");
		
		// trả về tên view.
		return listUser(model, request, response);
	}
	
}
