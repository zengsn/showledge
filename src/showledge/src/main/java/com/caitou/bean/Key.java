package com.caitou.bean;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * it行业关键词
 * 
 * @author _wind
 *
 */

@Table(name="t_keys")
public class Key implements Serializable {

	@Id
	@GeneratedValue(generator="JDBC")
	private String keyCode;
	private int count;
	public String getKeyCode() {
		return keyCode;
	}
	public void setKeyCode(String keyCode) {
		this.keyCode = keyCode;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Key [keyCode=" + keyCode + ", count=" + count + "]";
	}
	public Key(String keyCode, int count) {
		super();
		this.keyCode = keyCode;
		this.count = count;
	}
	public Key() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}













