package com.caitou.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.entity.ResultDTO;
import com.caitou.entity.User;
import com.caitou.service.UserService;

@Controller
public class RegisterController {

	@Resource
	UserService userService;

	@RequestMapping(value = "register")
	public String goToRegister() {
		return "register";
	}

	@RequestMapping("register.do")
	public String register(User user) throws Exception {
		Boolean result = userService.insertUser(user);
		if (result) {
			return "redirect:/login.html";
		} else {
			return "redirect:/register.html";
		}
	}

	@ResponseBody
	@RequestMapping(value = "isNameExist.do", produces = "application/json")
	public ResultDTO isNameExist(String userName) {
		ResultDTO result = new ResultDTO();
		boolean success = userService.isExistUserName(userName);
		result.setSuccess(success);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "isEmailExist.do", produces = "application/json")
	public ResultDTO isEmailExist(String userEmail) {
		ResultDTO result = new ResultDTO();
		boolean success = userService.isExistUserEmail(userEmail);
		result.setSuccess(success);
		return result;
	}
}
