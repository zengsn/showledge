package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.caitou.bean.User;
import com.caitou.service.UserService;

@Controller
public class AdminController {

	@Resource
	UserService userService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String initAdmin(Model model, HttpSession session) {
		return "admin";
	}

	@RequestMapping(value = "/admin-welcome", method = RequestMethod.GET)
	public String initAdminWelcome(Model model, HttpSession session) {
		return "admin-welcome";
	}

	@RequestMapping(value = "/admin-user", method = RequestMethod.GET)
	public String initAdminUser(Model model, HttpSession session) {
		List<User> userList = userService.getAllUser();
		model.addAttribute("userList", userList);
		return "admin-user";
	}

	@RequestMapping(value = "/admin-passage", method = RequestMethod.GET)
	public String initAdminPassage(Model model, HttpSession session) {
		return "admin-passage";
	}

	@RequestMapping(value = "/admin-topic", method = RequestMethod.GET)
	public String initAdminTopic(Model model, HttpSession session) {
		return "admin-topic";
	}

	@RequestMapping(value = "/admin-good-passage", method = RequestMethod.GET)
	public String initAdminGoodPassage(Model model, HttpSession session) {
		return "admin-good-passage";
	}

	@RequestMapping(value = "/admin-good-topic", method = RequestMethod.GET)
	public String initAdminGoodTopic(Model model, HttpSession session) {
		return "admin-good-topic";
	}
}
