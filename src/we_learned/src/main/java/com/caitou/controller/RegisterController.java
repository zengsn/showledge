package com.caitou.controller;

import java.sql.Timestamp;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.common.CountUtil;
import com.caitou.dto.AjaxResult;
import com.caitou.service.UserService;

@Controller
@RequestMapping("/register")
public class RegisterController {

	@Resource
	UserService userService;

	@RequestMapping(method = RequestMethod.GET)
	public String initRegister() {
		return "register";
	}

	@RequestMapping(value = "/newUser", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> newUser(String userEmail, String userName,
			String userPassword) throws Exception {
		if (userService.isExistUserEmail(userEmail)) {
			return new AjaxResult<Object>(false, "邮箱已经注册");
		} else if (userService.isExistUserName(userName)) {
			return new AjaxResult<Object>(false, "昵称已经存在");
		} else {
			Timestamp userCreateTime = CountUtil.getTime();
			userService.insertUser(userEmail, userName, userPassword,
					userCreateTime);
			return new AjaxResult<Object>(true, 1);
		}
	}

	@RequestMapping(value = "/isEmailExist", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> isEmailExist(String userEmail) {
		boolean success = userService.isExistUserEmail(userEmail);
		return new AjaxResult<Object>(success);
	}

	@RequestMapping(value = "/isNameExist", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> isNameExist(String userName) {
		boolean success = userService.isExistUserName(userName);
		return new AjaxResult<Object>(success);
	}
}
