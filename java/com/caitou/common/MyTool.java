package com.caitou.common;

import java.sql.Timestamp;
import java.util.Date;

public class MyTool {

	/*
	 * 返回当前时间,格式如 ‘2016-08-02 20:12:06’
	 */
	public Timestamp getTime() {
		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		return timestamp;
	}

	/**
	 * 计算传入的字符串字数
	 */
	public int countWordNumber(String content) {
		char[] t1 = content.toCharArray();
		int t0 = t1.length;
		int count = 0;
		for (int i = 0; i < t0; i++) {
			if (Character.toString(t1[i]).matches("[\\u4E00-\\u9FA5]+")) {
				count++;
			}
		}
		return count;
	}
}
