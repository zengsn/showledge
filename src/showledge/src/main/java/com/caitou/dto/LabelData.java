package com.caitou.dto;

public class LabelData {

	private int labelGoodNumber; // 标签下总的点赞数
	private int labelReadingNumber; // 标签下总的阅读数
	private double labelSkillPercentage; // 标签技能熟练度

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

	public double getLabelSkillPercentage() {
		return labelSkillPercentage;
	}

	public void setLabelSkillPercentage(double labelSkillPercentage) {
		this.labelSkillPercentage = labelSkillPercentage;
	}

}
