package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caitou.entity.Essay;
import com.caitou.entity.User;
import com.caitou.service.EssayService;
import com.caitou.service.UserService;

@Controller
public class IndexController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@RequestMapping(value = "index")
	public String goToIndex(HttpServletRequest request, HttpSession session) {
		List<Essay> essayList = essayService.selectAllEssay();
		String userName = (String) session.getAttribute("userNameInSession");
		if (!userName.isEmpty()) {
			User user = userService.getUser(userName);
			request.setAttribute("user", user);
		}
		request.setAttribute("essayList", essayList);
		return "index";
	}

	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("userNameInSession");
		return "redirect:/index.html";
	}
}
