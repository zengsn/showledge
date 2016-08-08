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
		String chinese = "[\u0391-\uFFE5]";
		int count = 0;
		for (int i = 0; i < content.length(); i++) {
			/* 获取一个字符 */
			String temp = content.substring(i, i + 1);
			/* 判断是否为中文字符 */
			if (temp.matches(chinese)) {
				/* 中文字符长度为2 */
				count += 1;
			}
		}
		return count;
	}
}
