package com.caitou.bean;

import com.caitou.dto.LabelData;

public class Label {

	private int id; // 标签id
	private int userId; // 标签的所属用户id
	private int essayId; // 标签所属的文章id
	private String firstLabel; // 一级标签名
	private String secondLabel; // 二级标签名
	private String thirdLabel; // 三级标签名
	private int labelGoodNumber; // 标签下所有文章的点赞数和
	private int labelReadingNumber; // 标签下所有文章的阅读数和
	private LabelData labelData;

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

	public String getFirstLabel() {
		return firstLabel;
	}

	public void setFirstLabel(String firstLabel) {
		this.firstLabel = firstLabel;
	}

	public String getSecondLabel() {
		return secondLabel;
	}

	public void setSecondLabel(String secondLabel) {
		this.secondLabel = secondLabel;
	}

	public String getThirdLabel() {
		return thirdLabel;
	}

	public void setThirdLabel(String thirdLabel) {
		this.thirdLabel = thirdLabel;
	}

	public int getLabelGoodNumber() {
		return labelGoodNumber;
	}

	public void setLabelGoodNumber(int labelGoodNumber) {
		this.labelGoodNumber = labelGoodNumber;
	}

	public int getLabelReadingNumber() {
		return labelReadingNumber;
	}

	public void setLabelReadingNumber(int labelReadingNumber) {
		this.labelReadingNumber = labelReadingNumber;
	}

	public LabelData getLabelData() {
		return labelData;
	}

	public void setLabelData(LabelData labelData) {
		this.labelData = labelData;
	}
}
