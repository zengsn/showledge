package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Comment;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.dao.ICommentDao;

@Service
public class CommentService {

	@Resource
	ICommentDao iCommentDao;

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	ReplyService replyService;

	public Comment insertComment(int essayId, int commentDiscussantId,
			String commentDiscussantName, String commentContent) {
		Comment comment = new Comment();
		comment.setEssayId(essayId);
		comment.setCommentDiscussantId(commentDiscussantId);
		comment.setCommentDiscussantName(commentDiscussantName);
		comment.setCommentContent(commentContent);
		comment.setCommentTime(CountUtil.getTime());
		User user = userService.getUserByUserName(comment
				.getCommentDiscussantName());
		comment.setCommentDiscussantImagePath(user.getUserImagePath());
		List<Comment> commentList = iCommentDao.queryByEssayId(essayId);
		if (commentList.isEmpty()) {
			comment.setCommentBuildingNumber(1);
		} else {
			int lastBuildingNumber = (commentList.get(commentList.size() - 1))
					.getCommentBuildingNumber();
			comment.setCommentBuildingNumber(lastBuildingNumber + 1);
		}
		iCommentDao.insertComment(comment);
		return comment;
	}

	public void deleteCommentById(int commentId) {
		iCommentDao.deleteById(commentId);
		replyService.deleteByCommentId(commentId);
	}

	public List<Comment> getCommentByEssayId(int essayId) {
		return iCommentDao.queryByEssayId(essayId);
	}
}
