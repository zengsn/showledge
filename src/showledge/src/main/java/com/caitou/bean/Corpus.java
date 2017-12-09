package com.caitou.bean;

/**
 * 文集表,也就是分类,废弃调了
 * 
 * @author _wind
 *
 */

@Deprecated
public class Corpus {

	private int id;
	private int userId;
	private String userName; // 文集创建用户名
	private String corpusName; // 文集名
	private int essayNumber; // 该文集下的文章数
	private int essayWordNumber; // 该文集下所有文章字数的总和
	private int userFocusNumber; // 用户关注数
	private boolean isUserFocused; // 判断用户是否关注此文集
	private String userImagePath; // 存放创建用户头像
	private String corpusImagePath; // 存放文集封面图片
	private String corpusDiscribe; // 存放文集介绍

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCorpusName() {
		return corpusName;
	}

	public void setCorpusName(String corpusName) {
		this.corpusName = corpusName;
	}

	public int getEssayNumber() {
		return essayNumber;
	}

	public void setEssayNumber(int essayNumber) {
		this.essayNumber = essayNumber;
	}

	public int getEssayWordNumber() {
		return essayWordNumber;
	}

	public void setEssayWordNumber(int essayWordNumber) {
		this.essayWordNumber = essayWordNumber;
	}

	public int getUserFocusNumber() {
		return userFocusNumber;
	}

	public void setUserFocusNumber(int userFocusNumber) {
		this.userFocusNumber = userFocusNumber;
	}

	public boolean getIsUserFocused() {
		return isUserFocused;
	}

	public void setIsUserFocused(boolean isUserFocused) {
		this.isUserFocused = isUserFocused;
	}

	public String getUserImagePath() {
		return userImagePath;
	}

	public void setUserImagePath(String userImagePath) {
		this.userImagePath = userImagePath;
	}

	public String getCorpusImagePath() {
		return corpusImagePath;
	}

	public void setCorpusImagePath(String corpusImagePath) {
		this.corpusImagePath = corpusImagePath;
	}

	public String getCorpusDiscribe() {
		return corpusDiscribe;
	}

	public void setCorpusDiscribe(String corpusDiscribe) {
		this.corpusDiscribe = corpusDiscribe;
	}
}
