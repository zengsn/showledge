package com.caitou.common;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

/**
 * 对html代码进行处理的工具类
 * 
 * @author caitou
 *
 */
public class HtmlUtil {

	/**
	 * 去掉输入字符串中的html标签
	 * 
	 * @param htmlStr
	 *            需要去掉html标签的字符串
	 * @return
	 */
	public static String getTextFromTHML(String htmlStr) {
		Document doc = Jsoup.parse(htmlStr);
		String text = doc.text();
		// 去掉多余的空格
		StringBuilder builder = new StringBuilder(text);
		int index = 0;
		while (builder.length() > index) {
			char tmp = builder.charAt(index);
			if (Character.isSpaceChar(tmp) || Character.isWhitespace(tmp)) {
				builder.setCharAt(index, ' ');
			}
			index++;
		}
		text = builder.toString().replaceAll(" +", " ").trim();
		return text;
	}
}