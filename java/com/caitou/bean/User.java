package com.caitou.bean;

public class User {

	private int id;
	private String userName; // 用户名
	private String userPassword; // 用户密码
	private String userEmail; // 用户邮箱
	private String userImagePath; // 用户头像存放路径
	private String userIntroduce; // 用户个人简介
	private int userFocusNumber; // 用户关注数
	private Boolean isFocused; // 判断用户是否已经被关注

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserImagePath() {
		return userImagePath;
	}

	public void setUserImagePath(String userImagePath) {
		this.userImagePath = userImagePath;
	}

	public String getUserIntroduce() {
		return userIntroduce;
	}

	public void setUserIntroduce(String userIntroduce) {
		this.userIntroduce = userIntroduce;
	}

	public int getUserFocusNumber() {
		return userFocusNumber;
	}

	public void setUserFocusNumber(int userFocusNumber) {
		this.userFocusNumber = userFocusNumber;
	}

	public Boolean getIsFocused() {
		return isFocused;
	}

	public void setIsFocused(Boolean isFocused) {
		this.isFocused = isFocused;
	}
}
