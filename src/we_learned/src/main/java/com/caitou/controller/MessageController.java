package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.CommentMessage;
import com.caitou.bean.FocusMessage;
import com.caitou.dto.AjaxResult;
import com.caitou.service.CommentMessageService;
import com.caitou.service.FocusMessageService;

@Controller
public class MessageController {

	@Resource
	CommentMessageService commentMessageService;

	@Resource
	FocusMessageService focusMessageService;

	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String initMessage(Model model, HttpSession session) {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
			List<CommentMessage> commentMessageList = commentMessageService
					.getCommentMessage(userIdInSession);
			List<FocusMessage> focusMessageList = focusMessageService
					.getFocusMessage(userIdInSession);

			int commentMessageNoReadingNumber = commentMessageService
					.getRowCountIsNotRead(userIdInSession);
			int focusMessageNoReadingNumber = focusMessageService
					.getRowCountIsNotRead(userIdInSession);

			model.addAttribute("commentMessageList", commentMessageList);
			model.addAttribute("focusMessageList", focusMessageList);
			model.addAttribute("commentMessageNoReadingNumber",
					commentMessageNoReadingNumber);
			model.addAttribute("focusMessageNoReadingNumber",
					focusMessageNoReadingNumber);
			return "message";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/message/clearCommentMessage", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> clearCommentMessage(HttpSession session)
			throws Exception {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		if (userIdInSession != 0) {
			int messageNotReadNumber = (int) session
					.getAttribute("messageNotReadNumber");
			if (messageNotReadNumber > commentMessageService
					.getRowCountIsNotRead(userIdInSession)) {
				messageNotReadNumber = messageNotReadNumber
						- commentMessageService
								.getRowCountIsNotRead(userIdInSession);
			} else {
				messageNotReadNumber = 0;
			}
			session.setAttribute("messageNotReadNumber", messageNotReadNumber);
			List<CommentMessage> commentMessageList = commentMessageService
					.getCommentMessage(userIdInSession);
			if (null != commentMessageList) {
				for (int i = 0; i < commentMessageList.size(); i++) {
					CommentMessage commentMessage = commentMessageList.get(i);
					commentMessageService.setIsRead(commentMessage.getId());
				}
			}
			return new AjaxResult<Object>(true, messageNotReadNumber);
		} else {
			return new AjaxResult<Object>(false);
		}
	}

	@RequestMapping(value = "/message/clearFocusMessage", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> clearFocusMessage(HttpSession session)
			throws Exception {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		if (userIdInSession != 0) {
			int messageNotReadNumber = (int) session
					.getAttribute("messageNotReadNumber");
			if (messageNotReadNumber > focusMessageService
					.getRowCountIsNotRead(userIdInSession)) {
				messageNotReadNumber = messageNotReadNumber
						- focusMessageService
								.getRowCountIsNotRead(userIdInSession);
			} else {
				messageNotReadNumber = 0;
			}
			session.setAttribute("messageNotReadNumber", messageNotReadNumber);
			List<FocusMessage> focusMessageList = focusMessageService
					.getFocusMessage(userIdInSession);
			if (null != focusMessageList) {
				for (int i = 0; i < focusMessageList.size(); i++) {
					FocusMessage focusMessage = focusMessageList.get(i);
					focusMessageService.setIsRead(focusMessage.getId());
				}
			}
			return new AjaxResult<Object>(true, messageNotReadNumber);
		} else {
			return new AjaxResult<Object>(false);
		}
	}
}
