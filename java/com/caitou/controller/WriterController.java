package com.caitou.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caitou.entity.Essay;
import com.caitou.service.EssayService;

@Controller
public class WriterController {

	@Resource
	EssayService essayService;

	@RequestMapping(value = "writer")
	public String goToWriter() {
		return "writer";
	}

	@RequestMapping(value = "writer.do")
	public String addEssay(Essay essay, HttpSession session) {
		String userName = (String) session.getAttribute("userNameInSession");
		essayService.insertEssay(essay, userName);
		return "success";
	}
}
