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

@Table(name="t_famous_kmap")
public class FamousKmap {

	@Id
	@GeneratedValue(generator="JDBC")
	private int kmapId;
	private int grade; // 通过计算得出文章的权重分数
	public int getKmapId() {
		return kmapId;
	}
	public void setKmapId(int kmapId) {
		this.kmapId = kmapId;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "FamousKmap [kmapId=" + kmapId + ", grade=" + grade + "]";
	}
	public FamousKmap(int kmapId, int grade) {
		super();
		this.kmapId = kmapId;
		this.grade = grade;
	}
	public FamousKmap() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}










