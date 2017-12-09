package com.caitou.bean;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Table(name="t_essay_type")
public class EssayType implements Serializable {

	@Id
	@GeneratedValue(generator="JDBC")
	private int id;
	
	private String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "EssayType [id=" + id + ", name=" + name + "]";
	}

	public EssayType(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public EssayType() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
