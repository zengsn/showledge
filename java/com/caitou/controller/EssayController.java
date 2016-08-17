package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Comment;
import com.caitou.bean.Essay;
import com.caitou.bean.Reply;
import com.caitou.bean.User;
import com.caitou.entity.ResultDTO;
import com.caitou.service.CommentService;
import com.caitou.service.EssayService;
import com.caitou.service.ReplyService;
import com.caitou.service.UserService;

@Controller
public class EssayController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	CommentService commentService;

	@Resource
	ReplyService replyService;

	@RequestMapping(value = "essay")
	public String getEssay(String id, HttpServletRequest request) {
		Essay essay = essayService.selectEssayById(id);
		User user = userService.selectByUserName(essay.getUserName());
		List<Comment> commentList = commentService.selectCommentByEssayId(id);
		for (int i = 0; i < commentList.size(); i++) {
			Comment comment = commentList.get(i);
			List<Reply> replyList = replyService.selectReplyByCommentId(comment
					.getId());
			comment.setReplyList(replyList);
		}
		request.setAttribute("essay", essay);
		request.setAttribute("commentList", commentList);
		request.setAttribute("essayId", id);
		request.setAttribute("essayUserImage", user.getUserImagePath());
		return "essay";
	}

	@ResponseBody
	@RequestMapping(value = "addComment.do", produces = "application/json")
	public ResultDTO addComment(String essayId, String commentContent,
			HttpSession session) throws Exception {
		ResultDTO result = new ResultDTO();
		String commentDiscussantName = (String) session
				.getAttribute("userNameInSession");
		Comment comment = commentService.insertComment(essayId, commentContent,
				commentDiscussantName);
		result.setComment(comment);
		result.setSuccess(true);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "addReply.do", produces = "application/json")
	public ResultDTO addReply(String commentId, String replyContent,
			HttpSession session) throws Exception {
		ResultDTO result = new ResultDTO();
		String replyUserName = (String) session
				.getAttribute("userNameInSession");
		Reply reply = replyService.insertReply(commentId, replyContent,
				replyUserName);
		result.setSuccess(true);
		result.setReply(reply);
		return result;
	}
}
