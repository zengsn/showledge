package com.caitou.controller;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.dto.AjaxResult;
import com.caitou.service.CommentMessageService;
import com.caitou.service.FocusMessageService;
import com.caitou.service.UserService;

@Controller
@RequestMapping("/register")
public class RegisterController {

	@Resource
	UserService userService;
	
	@Resource
	CommentMessageService commentMessageService;	
	
	@Resource
	FocusMessageService focusMessageService;


	@RequestMapping(method = RequestMethod.GET)
	public String initRegister() {
		return "register";
	}

	@RequestMapping(value = "/newUser", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> newUser(String userEmail, String userName,
			String userPassword, HttpSession session,String uCode) throws Exception {
		
		String code = (String) session
				.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		
		if (userService.isExistUserEmail(userEmail)) {
			return new AjaxResult<Object>(false, "邮箱已经注册");
		} else if (userService.isExistUserName(userName)) {
			return new AjaxResult<Object>(false, "昵称已经存在");
		} /*else if (uCode == null || !uCode.equals(code)){
			return new AjaxResult<Object>(false, "验证码错误");
		} */else {
			Timestamp userCreateTime = CountUtil.getTime();
			userService.insertUser(userEmail, userName, userPassword,
					userCreateTime);
			
			//直接登录用户
			User user = userService.getUserByUserEmail(userEmail);
			int messageNotReadNumber = commentMessageService
					.getRowCountIsNotRead(user.getId())
					+ focusMessageService.getRowCountIsNotRead(user.getId());
			session.setAttribute("userIdInSession", user.getId());
			session.setAttribute("userNameInSession", user.getUserName());
			session.setAttribute("userImagePathInSession",
					user.getUserImagePath());
			session.setAttribute("messageNotReadNumber", messageNotReadNumber);
			// 设置session有效时间为无限长
			session.setMaxInactiveInterval(0);
			
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
