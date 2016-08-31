package com.caitou.bean;

public class Focus {

	private int id;
	private int focusUserId;
	private String userName; // 关注人昵称

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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
