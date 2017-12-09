package com.caitou.bean;

import java.sql.Timestamp;

public class CommentMessage {

	private int id;
	private int focusUserId;
	private int essayId;
	private String essayTitle; // 回复区域(文章标题)
	private int replyUserId;
	private String replyUserName; // 回复者昵称
	private String cotent; // 回复内容
	private Timestamp updateTime; // 回复时间
	private int isRead; // 是否已经阅读
	private String subUpdateTime; // 与当前时间的时间差

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFocusUserId() {
		return focusUserId;
	}

	public void setFocusUserId(int focusUserId) {
		this.focusUserId = focusUserId;
	}

	public int getEssayId() {
		return essayId;
	}

	public void setEssayId(int essayId) {
		this.essayId = essayId;
	}

	public String getEssayTitle() {
		return essayTitle;
	}

	public void setEssayTitle(String essayTitle) {
		this.essayTitle = essayTitle;
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

	public String getCotent() {
		return cotent;
	}

	public void setCotent(String cotent) {
		this.cotent = cotent;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public int getIsRead() {
		return isRead;
	}

	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}

	public String getSubUpdateTime() {
		return subUpdateTime;
	}

	public void setSubUpdateTime(String subUpdateTime) {
		this.subUpdateTime = subUpdateTime;
	}
}
