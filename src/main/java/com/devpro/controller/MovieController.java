package com.devpro.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller /* bean đặc biệt */
public class MovieController {
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void test(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
		response.getOutputStream().print("Hello, world");
	}	
}
