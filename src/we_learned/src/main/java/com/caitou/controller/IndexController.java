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

import com.caitou.bean.Essay;
import com.caitou.dto.AjaxResult;
import com.caitou.dto.PageParam;
import com.caitou.service.CommentMessageService;
import com.caitou.service.EssayService;
import com.caitou.service.FamousService;
import com.caitou.service.FocusMessageService;
import com.caitou.service.UserService;

@Controller
public class IndexController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	FamousService famousService;

	@Resource
	CommentMessageService commentMessageService;

	@Resource
	FocusMessageService focusMessageService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String initIndex(Model model, HttpSession session)
			throws UnsupportedEncodingException {
		PageParam<List<Essay>> pageParam = new PageParam<List<Essay>>();
		int rowCount = famousService.getRowCount();
		pageParam.setRowCount(rowCount);
		pageParam.setCurrentPage(0);
		pageParam = famousService.getFamousEssayByOffect(pageParam);
		if (session.getAttribute("userIdInSession") != null) {
			int userId = (int) session.getAttribute("userIdInSession");
			int messageNotReadNumber = commentMessageService
					.getRowCountIsNotRead(userId)
					+ focusMessageService.getRowCountIsNotRead(userId);
			session.setAttribute("messageNotReadNumber", messageNotReadNumber);
		}

		model.addAttribute("pageParam", pageParam);
		return "index";
	}

	@RequestMapping(value = "/lookMoreEssay", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<PageParam<List<Essay>>> lookMoreEssay(int currentPage)
			throws UnsupportedEncodingException {
		PageParam<List<Essay>> pageParam = new PageParam<List<Essay>>();
		int rowCount = famousService.getRowCount();
		pageParam.setRowCount(rowCount);
		currentPage += 1;
		if (currentPage > pageParam.getTotalPage() - 1) {
			return new AjaxResult<PageParam<List<Essay>>>(false);
		}
		pageParam.setCurrentPage(currentPage);
		pageParam = famousService.getFamousEssayByOffect(pageParam);
		return new AjaxResult<PageParam<List<Essay>>>(true, pageParam);
	}
}
