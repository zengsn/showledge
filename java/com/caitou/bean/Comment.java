package com.caitou.bean;

import java.sql.Timestamp;
import java.util.List;

import com.caitou.common.CountUtil;

public class Comment {

	private int id;
	private int essayId;
	private int commentDiscussantId;
	private String commentDiscussantName; // 评论者昵称
	private String commentDiscussantImagePath; // 评论者头像
	private Timestamp commentTime; // 评论时间
	private String commentContent; // 评论内容
	private int commentBuildingNumber; // 评论楼层
	private List<Reply> replyList;
	private String formatCommentTime; // 格式化后的评论时间

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEssayId() {
		return essayId;
	}

	public void setEssayId(int essayId) {
		this.essayId = essayId;
	}

	public int getCommentDiscussantId() {
		return commentDiscussantId;
	}

	public void setCommentDiscussantId(int commentDiscussantId) {
		this.commentDiscussantId = commentDiscussantId;
	}

	public String getCommentDiscussantName() {
		return commentDiscussantName;
	}

	public void setCommentDiscussantName(String commentDiscussantName) {
		this.commentDiscussantName = commentDiscussantName;
	}

	public String getCommentDiscussantImagePath() {
		return commentDiscussantImagePath;
	}

	public void setCommentDiscussantImagePath(String commentDiscussantImagePath) {
		this.commentDiscussantImagePath = commentDiscussantImagePath;
	}

	public Timestamp getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Timestamp commentTime) {
		setFormatCommentTime(commentTime);
		this.commentTime = commentTime;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getCommentBuildingNumber() {
		return commentBuildingNumber;
	}

	public void setCommentBuildingNumber(int commentBuildingNumber) {
		this.commentBuildingNumber = commentBuildingNumber;
	}

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

	public String getFormatCommentTime() {
		return formatCommentTime;
	}

	public void setFormatCommentTime(Timestamp formatCommentTime) {
		this.formatCommentTime = CountUtil.formatTimestamp(formatCommentTime);
	}
}
