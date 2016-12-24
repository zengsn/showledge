package com.caitou.bean;

public class User {

	private int id;
	private String userName; // 用户名
	private String userPassword; // 用户密码
	private String userEmail; // 用户邮箱
	private String userImagePath; // 用户头像存放路径
	private String userIntroduce; // 用户个人简介
	private int userFocusNumber; // 用户关注数
	private int userFocusUserNumber; // 用户关注其他用户数
	private int userFocusCorpusNumber; // 用户关注文集数
	private int userFansNumber; // 用户粉丝数
	private int userEssayNumber; // 用户所写文章数
	private int userWordsNumber; // 用户所写字数
	private int userLikesNumber; // 用户收获喜欢数
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

	public int getUserFocusUserNumber() {
		return userFocusUserNumber;
	}

	public void setUserFocusUserNumber(int userFocusUserNumber) {
		this.userFocusUserNumber = userFocusUserNumber;
	}

	public int getUserFocusCorpusNumber() {
		return userFocusCorpusNumber;
	}

	public void setUserFocusCorpusNumber(int userFocusCorpusNumber) {
		this.userFocusCorpusNumber = userFocusCorpusNumber;
	}

	public int getUserFansNumber() {
		return userFansNumber;
	}

	public void setUserFansNumber(int userFansNumber) {
		this.userFansNumber = userFansNumber;
	}

	public int getUserEssayNumber() {
		return userEssayNumber;
	}

	public void setUserEssayNumber(int userEssayNumber) {
		this.userEssayNumber = userEssayNumber;
	}

	public int getUserWordsNumber() {
		return userWordsNumber;
	}

	public void setUserWordsNumber(int userWordsNumber) {
		this.userWordsNumber = userWordsNumber;
	}

	public int getUserLikesNumber() {
		return userLikesNumber;
	}

	public void setUserLikesNumber(int userLikesNumber) {
		this.userLikesNumber = userLikesNumber;
	}

	public Boolean getIsFocused() {
		return isFocused;
	}

	public void setIsFocused(Boolean isFocused) {
		this.isFocused = isFocused;
	}
}
