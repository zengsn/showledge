package com.caitou.bean;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 热门地图
 * 
 * @author _wind
 *
 */

@Table(name="t_famous_dyn")
public class FamoustDyn {

	@Id
	@GeneratedValue(generator="JDBC")
	private int dynId;
	private int grade; // 通过计算得出文章的权重分数
	
	
	public int getDynId() {
		return dynId;
	}
	public void setDynId(int dynId) {
		this.dynId = dynId;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "FamousKmap [dynId=" + dynId + ", grade=" + grade + "]";
	}
	public FamoustDyn(int dynId, int grade) {
		super();
		this.dynId = dynId;
		this.grade = grade;
	}
	public FamoustDyn() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
