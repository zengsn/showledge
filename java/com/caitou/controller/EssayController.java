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
import com.caitou.service.CollectService;
import com.caitou.service.CommentService;
import com.caitou.service.EssayService;
import com.caitou.service.FavouriteService;
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

	@Resource
	CollectService collectService;

	@Resource
	FavouriteService favouriteService;

	@RequestMapping(value = "essay")
	public String getEssay(String id, HttpServletRequest request,
			HttpSession session) {
		Essay essay = essayService.selectEssayById(id);
		if (essay != null) {
			String userName = (String) session
					.getAttribute("userNameInSession");
			if (userName != null && !userName.isEmpty()) {
				essay.setIsCollected(collectService.isCollected(id, userName));
				essay.setIsFavourited(favouriteService.isFavourited(id,
						userName));
			} else {
				essay.setIsCollected(false);
				essay.setIsFavourited(false);
			}
			essay.setEssayGoodNumber(favouriteService
					.countFavouriteByEssayId(id));
			User user = userService.selectByUserName(essay.getUserName());
			List<Comment> commentList = commentService
					.selectCommentByEssayId(id);
			for (int i = 0; i < commentList.size(); i++) {
				Comment comment = commentList.get(i);
				List<Reply> replyList = replyService
						.selectReplyByCommentId(comment.getId());
				comment.setReplyList(replyList);
			}
			request.setAttribute("essay", essay);
			request.setAttribute("commentList", commentList);
			request.setAttribute("essayId", id);
			request.setAttribute("essayUserImage", user.getUserImagePath());
			return "essay";
		} else {
			return "404";
		}
	}

	@ResponseBody
	@RequestMapping(value = "addComment.do", produces = "application/json")
	public ResultDTO addComment(String essayId, String commentContent,
			HttpSession session) throws Exception {
		ResultDTO result = new ResultDTO();
		String commentDiscussantName = (String) session
				.getAttribute("userNameInSession");
		if (commentDiscussantName != null && !commentDiscussantName.isEmpty()) {
			Comment comment = commentService.insertComment(essayId,
					commentContent, commentDiscussantName);
			result.setComment(comment);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "addReply.do", produces = "application/json")
	public ResultDTO addReply(String commentId, String replyContent,
			HttpSession session) throws Exception {
		ResultDTO result = new ResultDTO();
		String replyUserName = (String) session
				.getAttribute("userNameInSession");
		if (replyUserName != null && !replyUserName.isEmpty()) {
			Reply reply = replyService.insertReply(commentId, replyContent,
					replyUserName);
			result.setSuccess(true);
			result.setReply(reply);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "deleteComment.do", produces = "application/json")
	public ResultDTO deleteComment(String essayId, String commentId)
			throws Exception {
		ResultDTO result = new ResultDTO();
		commentService.deleteCommentById(essayId, commentId);
		result.setSuccess(true);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "deleteReply.do", produces = "application/json")
	public ResultDTO deleteReply(String replyId) throws Exception {
		ResultDTO result = new ResultDTO();
		replyService.deleteReplyById(replyId);
		result.setSuccess(true);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "addCollect.do", produces = "application/json")
	public ResultDTO addCollect(String essayId, HttpSession session)
			throws Exception {
		ResultDTO result = new ResultDTO();
		String userName = (String) session.getAttribute("userNameInSession");
		if (userName != null && essayId != null) {
			collectService.insertCollect(essayId, userName);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "removeCollect.do", produces = "application/json")
	public ResultDTO removeCollect(String essayId, HttpSession session)
			throws Exception {
		ResultDTO result = new ResultDTO();
		String userName = (String) session.getAttribute("userNameInSession");
		collectService.deleteByEssayId(essayId, userName);
		result.setSuccess(true);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "addFavourite.do", produces = "application/json")
	public ResultDTO addFavourite(String essayId, HttpSession session)
			throws Exception {
		ResultDTO result = new ResultDTO();
		String userName = (String) session.getAttribute("userNameInSession");
		if (userName != null && essayId != null) {
			userService.addUserLikesNumber(userName);
			favouriteService.insertFavourite(essayId, userName);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "removeFavourite.do", produces = "application/json")
	public ResultDTO removeFavourite(String essayId, HttpSession session)
			throws Exception {
		ResultDTO result = new ResultDTO();
		String userName = (String) session.getAttribute("userNameInSession");
		userService.subUserLikesNumber(userName);
		favouriteService.deleteByEssayId(essayId, userName);
		result.setSuccess(true);
		return result;
	}
}
