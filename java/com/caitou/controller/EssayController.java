package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caitou.entity.Comment;
import com.caitou.entity.Essay;
import com.caitou.service.CommentService;
import com.caitou.service.EssayService;

@Controller
public class EssayController {

	@Resource
	EssayService essayService;

	@Resource
	CommentService commentService;

	@RequestMapping(value = "essay")
	public String getEssay(HttpServletRequest request) {
		String id = request.getParameter("id");
		Essay essay = essayService.selectEssayById(id);
		List<Comment> commentList = commentService.selectCommentByEssayId(id);
		request.setAttribute("essay", essay);
		request.setAttribute("commentList", commentList);
		request.setAttribute("essayId", id);
		return "essay";
	}

	@RequestMapping(value = "addComment.do")
	public String addComment(Comment comment, HttpServletRequest request,
			HttpSession session) {
		String id = request.getParameter("essayId");
		String commentDiscussantName = (String) session.getAttribute("user");
		commentService.insertComment(comment, id, commentDiscussantName);
		return "redirect:/essay.html?id=" + id;
	}
}
