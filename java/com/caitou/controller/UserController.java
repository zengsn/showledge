package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.entity.ResultDTO;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.FocusService;
import com.caitou.service.UserService;

@Controller
public class UserController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	CorpusService corpusService;

	@Resource
	FocusService focusService;

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
		if (userNameInSession != null && userNameInSession.equals(userName)) {
			// 如果判断是自己查看自己的主页则将网页重定向
			return "redirect:/user";
		} else {
			User user = userService.selectByUserName(userName);
			if (user != null) {
				System.out.println(user.getUserFocusNumber());
				user.setIsFocused(focusService.isFocused(user.getId(),
						userNameInSession));
				List<Essay> essayList = essayService
						.selectByUserNameOrderByTime(userName);
				essayList = CountUtil.setSubTimeInEssay(essayList);
				List<Corpus> corpusList = corpusService
						.selectCorpusByUserName(userName);
				request.setAttribute("user", user);
				request.setAttribute("essayList", essayList);
				request.setAttribute("corpusList", corpusList);
				return "users";
			} else {
				return "404";
			}
		}
	}

	@ResponseBody
	@RequestMapping(value = "updateUser.do", produces = "application/json")
	public ResultDTO updateUser(String userName, String userIntroduce,
			HttpSession session) {
		ResultDTO result = new ResultDTO();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		if (!userNameInSession.equals(userName)) {
			boolean success = userService.isExistUserName(userName);
			if (success) {
				result.setMessage("昵称已经存在");
				result.setSuccess(false);
				return result;
			} else {
				userService.updateUserName(userNameInSession, userName);
				session.setAttribute("userNameInSession", userName);
			}
		}
		userService.updateUserIntroduce(userName, userIntroduce);
		User user = userService.selectByUserName(userNameInSession);
		user.setUserName(userName);
		user.setUserIntroduce(userIntroduce);
		result.setUser(user);
		result.setSuccess(true);
		return result;
	}
}
