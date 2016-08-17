package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.UserService;

@Controller
public class UserController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	CorpusService corpusService;

	@RequestMapping(value = "user")
	public String goToUser(HttpServletRequest request, HttpSession session) {
		String userName = (String) session.getAttribute("userNameInSession");
		User user = userService.selectByUserName(userName);
		List<Essay> essayList = essayService
				.selectByUserNameOrderByTime(userName);
		essayList = CountUtil.setSubTimeInEssay(essayList);
		List<Corpus> corpusList = corpusService
				.selectCorpusByUserName(userName);
		request.setAttribute("user", user);
		request.setAttribute("essayList", essayList);
		request.setAttribute("corpusList", corpusList);
		return "user";
	}

	@RequestMapping(value = "users")
	public String goToUsers(String userName, HttpServletRequest request,
			HttpSession session) {
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		if (userNameInSession.equals(userName)) {
			goToUser(request, session);
			return "user";
		} else {
			User user = userService.selectByUserName(userName);
			List<Essay> essayList = essayService
					.selectByUserNameOrderByTime(userName);
			essayList = CountUtil.setSubTimeInEssay(essayList);
			List<Corpus> corpusList = corpusService
					.selectCorpusByUserName(userName);
			request.setAttribute("user", user);
			request.setAttribute("essayList", essayList);
			request.setAttribute("corpusList", corpusList);
			return "users";
		}
	}
}
