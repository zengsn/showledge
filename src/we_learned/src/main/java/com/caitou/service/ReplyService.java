package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Reply;
import com.caitou.common.CountUtil;
import com.caitou.dao.IReplyDao;

@Service
public class ReplyService {

	@Resource
	IReplyDao iReplyDao;

	public Reply insertReply(int replyUserId, String replyUserName,
			String replyContent, int commentId) {
		Reply reply = new Reply();
		reply.setReplyUserId(replyUserId);
		reply.setReplyUserName(replyUserName);
		reply.setReplyTime(CountUtil.getTime());
		reply.setReplyContent(replyContent);
		reply.setCommentId(commentId);
		iReplyDao.insertReply(reply);
		return reply;
	}

	public void deleteReplyById(int replyId) {
		iReplyDao.deleteById(replyId);
	}

	public void deleteByCommentId(int commentId) {
		iReplyDao.deleteByCommentId(commentId);
	}

	public List<Reply> getReplyByCommentId(int commentId) {
		return iReplyDao.queryByCommentId(commentId);
	}
}
