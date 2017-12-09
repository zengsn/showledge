package com.caitou.bean;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="t_famous")
public class Famous {

	@Id
	@GeneratedValue(generator="JDBC")
	private int essayId;
	private int grade; // 通过计算得出文章的权重分数

	public int getEssayId() {
		return essayId;
	}

	public void setEssayId(int essayId) {
		this.essayId = essayId;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Famous [essayId=" + essayId + ", grade=" + grade + "]";
	}

	public Famous(int essayId, int grade) {
		super();
		this.essayId = essayId;
		this.grade = grade;
	}

	public Famous() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
