package com.caitou.bean;

import java.sql.Timestamp;
import java.util.Date;

public class FocusMessage {

	private int id;
	private int focusUserId; // 关注者id
	private int userId; // 被关注者id
	private String userName; // 被关注者昵称
	private int corpusId; // 关注文集id
	private String corpusName; // 关注文集名
	private int essayId; // 更新的文章id
	private String essayTitle; // 更新的文章题目
	private int kmapId; // 更新的知识地图id
	private Date updateTime; // 更新时间
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

	public int getCorpusId() {
		return corpusId;
	}

	public void setCorpusId(int corpusId) {
		this.corpusId = corpusId;
	}

	public String getCorpusName() {
		return corpusName;
	}

	public void setCorpusName(String corpusName) {
		this.corpusName = corpusName;
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

	public int getKmapId() {
		return kmapId;
	}

	public void setKmapId(int kmapId) {
		this.kmapId = kmapId;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
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