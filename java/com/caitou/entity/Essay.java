package com.caitou.entity;

import java.sql.Timestamp;

public class Essay {

	private int id;
	private int userId;
	private String userName;
	private String essayTitle;
	private String essayContent;
	private Timestamp essayTime;
	private int essayReadingNumber;
	private int essayCommentNumber;
	private int essayGoodNumber;
	private int essayWordNumber;
	private int corpusId;

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

	public String getEssayTitle() {
		return essayTitle;
	}

	public void setEssayTitle(String essayTitle) {
		this.essayTitle = essayTitle;
	}

	public String getEssayContent() {
		return essayContent;
	}

	public void setEssayContent(String essayContent) {
		this.essayContent = essayContent;
	}

	public Timestamp getEssayTime() {
		return essayTime;
	}

	public void setEssayTime(Timestamp essayTime) {
		this.essayTime = essayTime;
	}

	public int getEssayReadingNumber() {
		return essayReadingNumber;
	}

	public void setEssayReadingNumber(int essayReadingNumber) {
		this.essayReadingNumber = essayReadingNumber;
	}

	public int getEssayCommentNumber() {
		return essayCommentNumber;
	}

	public void setEssayCommentNumber(int essayCommentNumber) {
		this.essayCommentNumber = essayCommentNumber;
	}

	public int getEssayGoodNumber() {
		return essayGoodNumber;
	}

	public void setEssayGoodNumber(int essayGoodNumber) {
		this.essayGoodNumber = essayGoodNumber;
	}

	public int getEssayWordNumber() {
		return essayWordNumber;
	}

	public void setEssayWordNumber(int essayWordNumber) {
		this.essayWordNumber = essayWordNumber;
	}

	public int getCorpusId() {
		return corpusId;
	}

	public void setCorpusId(int corpusId) {
		this.corpusId = corpusId;
	}
}