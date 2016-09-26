package com.caitou.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SuccessController {

	@RequestMapping(value = "success")
	public String goToSuccess(@Param("id") int id,
			@Param("title") String title, Model model) {
		model.addAttribute("essayId", id);
		model.addAttribute("essayTitle", title);
		return "success";
	}
}
