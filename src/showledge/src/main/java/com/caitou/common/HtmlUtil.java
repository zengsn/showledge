package com.caitou.common;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

	
	/**
	 * 取出html中img标签的src值,即图片路径
	 * 
	 * @param htmlStr
	 * @return
	 */
	public static List<String> getImgSrc(String htmlStr) {
		String img = "";
		Pattern p_image;
		Matcher m_image;
		List<String> pics = new ArrayList<String>();
		// String regEx_img = "<img.*src=(.*?)[^>]*?>"; //图片链接地址
		String regEx_img = "<img.*src\\s*=\\s*(.*?)[^>]*?>";
		p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
		m_image = p_image.matcher(htmlStr);
		while (m_image.find()) {
			img = img + "," + m_image.group();
			// Matcher m =
			// Pattern.compile("src=\"?(.*?)(\"|>|\\s+)").matcher(img); //匹配src
			Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)")
					.matcher(img);
			while (m.find()) {
				pics.add(m.group(1));
			}
		}
		return pics;
	}
}