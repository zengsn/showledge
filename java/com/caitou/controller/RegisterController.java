package com.caitou.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.User;
import com.caitou.entity.ResultDTO;
import com.caitou.service.UserService;

@Controller
public class RegisterController {

	@Resource
	UserService userService;

	@RequestMapping(value = "register")
	public String goToRegister() {
		return "register";
	}

	@ResponseBody
	@RequestMapping(value = "register.do", produces = "application/json")
	public ResultDTO register(User user) throws Exception {
		ResultDTO result = new ResultDTO();
		if (userService.isExistUserName(user.getUserName())) {
			result.setMessage("昵称已经存在");
			result.setSuccess(false);
			return result;
		} else if (userService.isExistUserEmail(user.getUserEmail())) {
			result.setMessage("邮箱已经注册");
			result.setSuccess(false);
			return result;
		} else {
			userService.insertUser(user);
			result.setSuccess(true);
			return result;
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
