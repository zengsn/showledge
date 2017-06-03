package com.caitou.bean;

import java.sql.Timestamp;

import com.caitou.common.CountUtil;

public class Reply {

	private int id;
	private int replyUserId;
	private String replyUserName;// 回复者昵称
	private Timestamp replyTime; // 回复时间
	private String replyContent;// 回复内容
	private int commentId;
	private String formatReplyTime; // 格式化后的回复时间

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getReplyUserId() {
		return replyUserId;
	}

	public void setReplyUserId(int replyUserId) {
		this.replyUserId = replyUserId;
	}

	public String getReplyUserName() {
		return replyUserName;
	}

	public void setReplyUserName(String replyUserName) {
		this.replyUserName = replyUserName;
	}

	public Timestamp getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(Timestamp replyTime) {
		setFormatReplyTime(replyTime);
		this.replyTime = replyTime;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getFormatReplyTime() {
		return formatReplyTime;
	}

	public void setFormatReplyTime(Timestamp formatReplyTime) {
		this.formatReplyTime = CountUtil.formatTimestamp(formatReplyTime);
	}
}
