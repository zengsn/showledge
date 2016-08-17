package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.entity.ResultDTO;
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
		List<Essay> essayList = essayService.selectEssayLimit("0");
		String userName = (String) session.getAttribute("userNameInSession");
		if (userName != null) {
			User user = userService.selectByUserName(userName);
			request.setAttribute("limitNumber", 5);
			session.setAttribute("user", user);
		}
		essayList = CountUtil.setSubTimeInEssay(essayList);
		request.setAttribute("essayList", essayList);
		return "index";
	}

	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("userNameInSession");
		return "redirect:/index.html";
	}

	@ResponseBody
	@RequestMapping(value = "lookMoreEssay.do", produces = "application/json")
	public ResultDTO lookMoreEssay(String limitNumber,
			HttpServletRequest request) {
		ResultDTO result = new ResultDTO();
		if (limitNumber != null) {
			List<Essay> essayList = essayService.selectEssayLimit(limitNumber);
			essayList = CountUtil.setSubTimeInEssay(essayList);
			result.setEssayList(essayList);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}
}
