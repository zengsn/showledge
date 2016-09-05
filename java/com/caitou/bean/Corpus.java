package com.caitou.bean;

public class Corpus {

	private int id;
	private String corpusName; // 文集名
	private String userName; // 作者名
	private int essayNumber; // 该文集下的文章数
	private int essayWordNumber; // 该文集下所有文章字数的总和
	private int userFocusNumber; // 用户关注数
	private boolean isUserFocused; // 判断用户是否关注此文集

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCorpusName() {
		return corpusName;
	}

	public void setCorpusName(String corpusName) {
		this.corpusName = corpusName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
}
