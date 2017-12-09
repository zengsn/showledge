package com.caitou.bean;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="t_focus_user")
public class FocusUser {
	
	@Id
	@GeneratedValue(generator="JDBC")
	private int focusUserId; // 被关注者id
	@Id
	@GeneratedValue(generator="JDBC")
	private int userId; // 关注者id
	
	
	
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
	@Override
	public String toString() {
		return "FocusUser [focusUserId=" + focusUserId + ", userId=" + userId + "]";
	}
	public FocusUser(int focusUserId, int userId) {
		super();
		this.focusUserId = focusUserId;
		this.userId = userId;
	}
	public FocusUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
