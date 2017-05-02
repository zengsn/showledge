package com.caitou.service;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.CommentMessage;
import com.caitou.common.CountUtil;
import com.caitou.dao.ICommentMessageDao;

@Service
public class CommentMessageService {

	@Resource
	ICommentMessageDao iCollectMessageDao;

	public void insertCommentMessage(int focusUserId, int essayId,
			String essayTitle, int replyUserId, String replyUserName,
			String cotent, Timestamp updateTime) {
		CommentMessage commentMessage = new CommentMessage();
		commentMessage.setFocusUserId(focusUserId);
		commentMessage.setEssayId(essayId);
		commentMessage.setEssayTitle(essayTitle);
		commentMessage.setReplyUserId(replyUserId);
		commentMessage.setReplyUserName(replyUserName);
		commentMessage.setCotent(cotent);
		commentMessage.setUpdateTime(updateTime);
		iCollectMessageDao.insertCommentMessage(commentMessage);
	}

	public void setIsRead(int id) {
		iCollectMessageDao.setIsRead(id);
	}

	public int getRowCountIsNotRead(int focusUserId) {
		return iCollectMessageDao.getRowCountIsNotRead(focusUserId);
	}

	public List<CommentMessage> getCommentMessage(int focusUserId) {
		List<CommentMessage> commentMessageList = iCollectMessageDao
				.queryCommentMessage(focusUserId);
		if (null == commentMessageList || commentMessageList.isEmpty()) {
			return null;
		} else {
			for (int i = 0; i < commentMessageList.size(); i++) {
				CommentMessage commentMessage = commentMessageList.get(i);
				Timestamp startTimestamp = commentMessage.getUpdateTime();
				if (startTimestamp != null) {
					String subUpdateTime = CountUtil
							.getTimeByNow(startTimestamp);
					commentMessage.setSubUpdateTime(subUpdateTime);
				} else {
					commentMessage.setSubUpdateTime("未知时间");
				}
			}
			return commentMessageList;
		}
	}
}
