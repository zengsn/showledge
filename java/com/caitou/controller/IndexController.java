package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caitou.entity.Essay;
import com.caitou.service.EssayService;

@Controller
public class IndexController {

	@Resource
	EssayService essayService;

	@RequestMapping(value = "index")
	public String goToIndex(HttpServletRequest request, HttpSession session) {
		List<Essay> essayList = essayService.selectAllEssay();
		request.setAttribute("essayList", essayList);
		return "index";
	}

	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/index.html";
	}
}
