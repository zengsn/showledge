package com.caitou.entity;

import java.sql.Timestamp;

public class Comment {

	private int id;
	private int essayId;
	private String commentDiscussantName;
	private Timestamp commentTime;
	private String commentContent;
	private int commentBuildingNumber;
	private int commentId;
	private String commentReplyName;
	private Timestamp commentReplyTime;
	private String commentReplyContent;

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

	public String getCommentDiscussantName() {
		return commentDiscussantName;
	}

	public void setCommentDiscussantName(String commentDiscussantName) {
		this.commentDiscussantName = commentDiscussantName;
	}

	public Timestamp getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Timestamp commentTime) {
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

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getCommentReplyName() {
		return commentReplyName;
	}

	public void setCommentReplyName(String commentReplyName) {
		this.commentReplyName = commentReplyName;
	}

	public Timestamp getCommentReplyTime() {
		return commentReplyTime;
	}

	public void setCommentReplyTime(Timestamp commentReplyTime) {
		this.commentReplyTime = commentReplyTime;
	}

	public String getCommentReplyContent() {
		return commentReplyContent;
	}

	public void setCommentReplyContent(String commentReplyContent) {
		this.commentReplyContent = commentReplyContent;
	}
}
