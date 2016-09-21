package com.caitou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SuccessController {

	@RequestMapping(value = "success")
	public String goToSuccess(int id, String essayTitle,
			Model model) {
		model.addAttribute("essayId", id);
		model.addAttribute("essayTitle", essayTitle);
		return "success";
	}
}
