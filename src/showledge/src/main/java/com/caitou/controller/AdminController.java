package com.caitou.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.dto.AjaxResult;
import com.caitou.dto.PageParam;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.FamousService;
import com.caitou.service.UserService;

@Controller
public class AdminController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	CorpusService corpusService;

	@Resource
	FamousService famousService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String initAdmin(Model model, HttpSession session) {
		if ((int) session.getAttribute("userIdInSession") == 1) {
			return "admin";
		} else {
			return "404";
		}
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
		List<Essay> essayList = essayService.getAllEssay();
		model.addAttribute("essayList", essayList);
		return "admin-passage";
	}

	@RequestMapping(value = "/admin-topic", method = RequestMethod.GET)
	public String initAdminTopic(Model model, HttpSession session) {
		List<Corpus> corpusList = corpusService.getAllCorpus();
		model.addAttribute("corpusList", corpusList);
		return "admin-topic";
	}

	@RequestMapping(value = "/admin-good-passage", method = RequestMethod.GET)
	public String initAdminGoodPassage(Model model, HttpSession session)
			throws UnsupportedEncodingException {
		PageParam<List<Essay>> pageParam = new PageParam<List<Essay>>();
		int rowCount = famousService.getRowCount();
		pageParam.setRowCount(rowCount);
		pageParam.setCurrentPage(0);
		pageParam = famousService.getFamousEssayByOffect(pageParam);
		model.addAttribute("pageParam", pageParam);
		return "admin-good-passage";
	}

	@RequestMapping(value = "/admin/getUserDetail", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> getUserDetail(int userId) {
		User user = userService.getUserByUserId(userId);
		return new AjaxResult<Object>(true, user);
	}
}
