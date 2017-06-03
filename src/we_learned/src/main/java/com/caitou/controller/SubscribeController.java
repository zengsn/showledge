package com.caitou.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.caitou.service.CorpusService;
import com.caitou.service.FocusCorpusService;
import com.caitou.service.FocusUserService;
import com.caitou.service.UserService;

@Controller
public class SubscribeController {

	@Resource
	UserService userService;

	@Resource
	CorpusService corpusService;

	@Resource
	FocusUserService focusUserService;

	@Resource
	FocusCorpusService focusCorpusService;

	/*@ResponseBody
	@RequestMapping(value = "getUserFocus.do", produces = "application/json")
	public Result getUserFocus(String userName, HttpSession session) {
		Result result = new Result();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		int userIdInSession = (int) session.getAttribute("userIdInSession");
		List<Integer> intList = focusUserService
				.getFocusUserIdByUserId(userIdInSession);
		List<User> userList = new ArrayList<>();
		for (int i = 0; i < intList.size(); i++) {
			User user = userService.getUserByUserId(intList.get(i));
			if (user != null) {
				if (userNameInSession != null) {
					user.setIsFocused(focusUserService.isFocusUsered(
							user.getId(), userIdInSession));
				}
				userList.add(user);
			}
		}
		result.setUserList(userList);
		result.setSuccess(true);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "getUserFans.do", produces = "application/json")
	public Result getUserFans(String userName, HttpSession session) {
		Result result = new Result();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		int userIdInSession = (int) session.getAttribute("userIdInSession");
		User user = userService.getUserByUserName(userName);
		List<Integer> intList = focusUserService.getUserIdByFocusUserId(user
				.getId());
		List<User> userList = new ArrayList<>();
		for (int i = 0; i < intList.size(); i++) {
			user = userService.getUserByUserId(intList.get(i));
			if (user != null) {
				if (userNameInSession != null) {
					user.setIsFocused(focusUserService.isFocusUsered(
							user.getId(), userIdInSession));
				}
				userList.add(user);
			}
		}
		result.setUserList(userList);
		result.setSuccess(true);
		return result;
	}*/
}
