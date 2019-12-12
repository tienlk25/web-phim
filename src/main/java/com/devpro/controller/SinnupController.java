package com.devpro.controller;




import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.entities.User;
import com.devpro.reponsitories.CategoriesReponsitory;
import com.devpro.reponsitories.SignupReponsitory;

@Controller
public class SinnupController {
    @Autowired CategoriesReponsitory categoriesReponsitory;
	@Autowired SignupReponsitory signupReponsitory;
	@RequestMapping(value = {"/signup"},method = { RequestMethod.GET})
	public String signUp(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		//từ end-point
		User user = new User();
		model.addAttribute("_categories", categoriesReponsitory.findAll());
		model.addAttribute("signup",user);
		return "signup";
	}
	
	@RequestMapping(value = {"/signup-bind-data"},method = { RequestMethod.POST})
	public String saveContact(@ModelAttribute("signup") User user,final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		user.setNgaytao(new Date());
		// lưu dữ liệu vào database
		try {
			signupReponsitory.save(user);	
			model.addAttribute("status", "success");
		} catch (Exception e) {
			model.addAttribute("status", "failed");
		}	
		// Trả về thông báo cho người dùng.
		
		return "signup";
	}
}
