package com.caitou.bean;

import java.sql.Timestamp;

public class Timeline {

	private int id;
	private int userId;
	private int essayId;
	private Timestamp createTime; // 记录时间
	private String formatCreateTime; // 格式化记录时间
	private Essay essay; // 该用户动态下所有文章

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

	public int getEssayId() {
		return essayId;
	}

	public void setEssayId(int essayId) {
		this.essayId = essayId;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getFormatCreateTime() {
		return formatCreateTime;
	}

	public void setFormatCreateTime(String formatCreateTime) {
		this.formatCreateTime = formatCreateTime;
	}

	public Essay getEssay() {
		return essay;
	}

	public void setEssay(Essay essay) {
		this.essay = essay;
	}

}
