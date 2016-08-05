package com.caitou.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.dao.ICommentDao;
import com.caitou.entity.Comment;

@Service
public class CommentService {

	@Resource
	ICommentDao iCommentDao;

	public void insertComment(Comment comment, String id,
			String commentDiscussantName) {
		comment.setEssayId(Integer.valueOf(id));
		Date date = new Date();
		Timestamp currentTime = new Timestamp(date.getTime());
		comment.setCommentTime(currentTime);
		comment.setCommentDiscussantName(commentDiscussantName);
		List<Comment> commentList = iCommentDao.selectCommentByEssayId(id);
		if (commentList.isEmpty()) {
			comment.setCommentBuildingNumber(1);
		} else {
			int lastBuildingNumber = (commentList.get(commentList.size() - 1))
					.getCommentBuildingNumber();
			comment.setCommentBuildingNumber(lastBuildingNumber + 1);
		}
		iCommentDao.insertComment(comment);
	}

	public List<Comment> selectCommentByEssayId(String id) {
		List<Comment> commentList = iCommentDao.selectCommentByEssayId(id);
		return commentList;
	}
}
