package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Comment;
import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.bean.EssayType;
import com.caitou.bean.Reply;
import com.caitou.bean.User;
import com.caitou.dto.AjaxResult;
import com.caitou.service.CollectService;
import com.caitou.service.CommentMessageService;
import com.caitou.service.CommentService;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.FavouriteService;
import com.caitou.service.FocusUserService;
import com.caitou.service.ReplyService;
import com.caitou.service.UserService;
import com.caitou.service.inter.EssayTypeService;

@Controller
@RequestMapping("/essay")
public class EssayController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	CorpusService corpusService;

	@Resource
	CommentService commentService;

	@Resource
	ReplyService replyService;

	@Resource
	CollectService collectService;

	@Resource
	FavouriteService favouriteService;

	@Resource
	FocusUserService focusUserService;

	@Resource
	CommentMessageService commentMessageService;

	@Autowired
	private EssayTypeService essayTypeService; 
	
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/{essayId}", method = RequestMethod.GET)
	public String getEssay(@PathVariable("essayId") int essayId, Model model,
			HttpSession session) {
		
		Essay essay = essayService.getEssayById(essayId);
		//Corpus corpus = corpusService.getCorpusById(essay.getCorpusId());
		//essay.setCorpusName(corpus.getCorpusName());
		User user = userService.getUserByUserId(essay.getUserId());
		
		if (essay != null) {
			int userIdInSession = 0;
			if (session.getAttribute("userIdInSession") != null) {
				userIdInSession = (int) session.getAttribute("userIdInSession");
			}
			
			//如果不是同一个自己查看自己的文章就增加文章阅读量
			if (userIdInSession == 0 || userIdInSession != essay.getUserId()) {
				essayService.increaseReadingNumberById(essayId);
			}
			
			if (userIdInSession != 0) {
				essay.setIsCollected(collectService.isCollected(essayId,
						userIdInSession));
				essay.setIsFavourited(favouriteService.isFavourited(essayId,
						userIdInSession));
				user.setIsFocused(focusUserService.isFocusUsered(
						essay.getUserId(), userIdInSession));
			} else {
				user.setIsFocused(false);
				essay.setIsCollected(false);
				essay.setIsFavourited(false);
			}

			List<Comment> commentList = commentService
					.getCommentByEssayId(essayId);
			for (int i = 0; i < commentList.size(); i++) {
				Comment comment = commentList.get(i);
				List<Reply> replyList = replyService
						.getReplyByCommentId(comment.getId());
				comment.setReplyList(replyList);
			}

			EssayType type = essayTypeService.selectByPrimaryKey(essay.getType());
			
			model.addAttribute("user", user);
			model.addAttribute("essay", essay);
			model.addAttribute("commentList", commentList);
			model.addAttribute("essayUserImage", user.getUserImagePath());
			model.addAttribute("type", type);
			
			return "essay";
		} else {
			return "404";
		}
	}

	@RequestMapping(value = "/addComment", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Comment> addComment(int essayId, String commentContent,
			HttpSession session) throws Exception {
		String commentDiscussantName = (String) session
				.getAttribute("userNameInSession");
		if (commentDiscussantName != null) {
			int commentDiscussantId = (int) session
					.getAttribute("userIdInSession");
			essayService.increaseCommentNumberById(essayId);
			Comment comment = commentService.insertComment(essayId,
					commentDiscussantId, commentDiscussantName, commentContent);
			return new AjaxResult<Comment>(true, comment);
		} else {
			return new AjaxResult<Comment>(false);
		}
	}

	@RequestMapping(value = "/addReply", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Reply> addReply(int commentDiscussantId, int essayId,
			String essayTitle, int commentId, String replyContent,
			HttpSession session) throws Exception {
		String replyUserName = (String) session
				.getAttribute("userNameInSession");
		if (replyUserName != null) {
			int replyUserId = (int) session.getAttribute("userIdInSession");
			essayService.increaseCommentNumberById(essayId);
			Reply reply = replyService.insertReply(replyUserId, replyUserName,
					replyContent, commentId);
			if (commentDiscussantId == replyUserId) {
				List<Reply> replyList = replyService
						.getReplyByCommentId(commentId);
				commentMessageService.insertCommentMessage(
						replyList.get(replyList.size() - 2).getReplyUserId(),
						essayId, essayTitle, replyUserId, replyUserName,
						replyContent, reply.getReplyTime());
			} else {
				commentMessageService.insertCommentMessage(commentDiscussantId,
						essayId, essayTitle, replyUserId, replyUserName,
						replyContent, reply.getReplyTime());
			}
			return new AjaxResult<Reply>(true, reply);
		} else {
			return new AjaxResult<Reply>(false);
		}
	}

	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	@Transactional
	public AjaxResult<Object> deleteComment(int essayId, int commentId)
			throws Exception {
		essayService.reduceCommentNumberById(essayId);
		commentService.deleteCommentById(commentId);
		return new AjaxResult<Object>(true);
	}

	@RequestMapping(value = "/deleteReply", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> deleteReply(int essayId, int replyId)
			throws Exception {
		essayService.reduceCommentNumberById(essayId);
		replyService.deleteReplyById(replyId);
		return new AjaxResult<Object>(true);
	}

	@RequestMapping(value = "/addCollect", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> addCollect(int essayId, HttpSession session)
			throws Exception {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		if (userIdInSession != 0) {
			collectService.insertCollect(essayId, userIdInSession);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}

	@RequestMapping(value = "/removeCollect", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> removeCollect(int essayId, HttpSession session)
			throws Exception {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		if (userIdInSession != 0) {
			collectService.deleteByEssayId(essayId, userIdInSession);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}

	@RequestMapping(value = "/addFavourite", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	@Transactional
	public AjaxResult<Object> addFavourite(int essayUserId, int essayId,
			HttpSession session) throws Exception {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		if (userIdInSession != 0) {
			userService.increaseUserLikesNumber(essayUserId);
			essayService.increaseGoodNumberById(essayId);
			favouriteService.insertFavourite(essayId, userIdInSession);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}

	@RequestMapping(value = "/removeFavourite", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	@Transactional
	public AjaxResult<Object> removeFavourite(int essayUserId, int essayId,
			HttpSession session) throws Exception {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		if (userIdInSession != 0) {
			userService.reduceUserLikesNumber(essayUserId);
			essayService.reduceGoodNumberById(essayId);
			favouriteService.deleteByEssayId(essayId, userIdInSession);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}
	
	
	@RequestMapping("changeFavourite")
	public @ResponseBody AjaxResult<Object> changeFavourite(Integer essayId){
		favouriteService.changeFavourite(essayId);
		
		return new AjaxResult<>(true);
	}
	
	@RequestMapping("changeCollection")
	public @ResponseBody AjaxResult<Object> changeCollection(Integer essayId){
		collectService.changeCollection(essayId);
		
		return new AjaxResult<>(true);
	}
	
	
}



























