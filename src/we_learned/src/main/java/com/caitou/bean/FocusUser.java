package com.caitou.bean;

public class FocusUser {

	private int id;
	private int focusUserId; // 被关注者id
	private int userId; // 关注者id

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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
}
