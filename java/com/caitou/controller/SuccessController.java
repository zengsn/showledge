package com.caitou.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SuccessController {

	@RequestMapping(value = "success")
	public String goToSuccess(String id, String essayTitle,
			HttpServletRequest request) {
		request.setAttribute("essayId", id);
		request.setAttribute("essayTitle", essayTitle);
		return "success";
	}
}
