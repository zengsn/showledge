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

	public Reply insertReply(String commentId, String replyContent,
			String replyUserName) {
		Reply reply = new Reply();
		reply.setReplyUserName(replyUserName);
		reply.setReplyTime(CountUtil.getTime());
		reply.setReplyContent(replyContent);
		reply.setCommentId(Integer.valueOf(commentId));
		iReplyDao.insertReply(reply);
		return reply;
	}

	public List<Reply> selectReplyByCommentId(int commentId) {
		List<Reply> replyList = iReplyDao.selectByCommentId(commentId);
		return replyList;
	}
}
