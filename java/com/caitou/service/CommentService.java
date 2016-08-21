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

	public Comment insertComment(String essayId, String commentContent,
			String commentDiscussantName) {
		Comment comment = new Comment();
		comment.setEssayId(Integer.valueOf(essayId));
		comment.setCommentContent(commentContent);
		comment.setCommentTime(CountUtil.getTime());
		comment.setCommentDiscussantName(commentDiscussantName);
		User user = userService.selectByUserName(comment
				.getCommentDiscussantName());
		comment.setCommentDiscussantImagePath(user.getUserImagePath());
		List<Comment> commentList = iCommentDao.selectByEssayId(Integer
				.valueOf(essayId));
		if (commentList.isEmpty()) {
			comment.setCommentBuildingNumber(1);
		} else {
			int lastBuildingNumber = (commentList.get(commentList.size() - 1))
					.getCommentBuildingNumber();
			comment.setCommentBuildingNumber(lastBuildingNumber + 1);
		}
		iCommentDao.insertComment(comment);
		essayService.updateCommentNumberById(essayId, commentList.size() + 1);
		return comment;
	}

	public void deleteCommentById(String essayId, String commentId) {
		iCommentDao.deleteById(Integer.valueOf(commentId));
		List<Comment> commentList = iCommentDao.selectByEssayId(Integer
				.valueOf(essayId));
		essayService.updateCommentNumberById(essayId, commentList.size());
		replyService.deleteByCommentId(commentId);
	}

	public List<Comment> selectCommentByEssayId(String id) {
		List<Comment> commentList = iCommentDao.selectByEssayId(Integer
				.valueOf(id));
		return commentList;
	}
}
