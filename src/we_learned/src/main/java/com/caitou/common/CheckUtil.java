package com.caitou.common;

import java.io.IOException;
import java.util.ArrayList;

import jeasy.analysis.MMAnalyzer;

/**
 * 进行相关检查的工具类
 * 
 * @author caitou
 *
 */
public class CheckUtil {

	/**
	 * 判断用户所写随记是否有意义
	 * 
	 * @param essayContent
	 *            随记内容
	 * @param essayWordNumber
	 *            随记字数
	 * @return
	 */
	public static boolean checkEssayIsValuable(String essayContent,
			int essayWordNumber) {
		MMAnalyzer analyzer = new MMAnalyzer();
		String str = null;
		int count = 0;
		int index = 0;

		try {
			str = analyzer.segment(essayContent, "|");
			while ((index = str.indexOf("|", index)) != -1) {
				index = index + "|".length();
				count++;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		float a = essayWordNumber;
		float b = count;
		float result = 0;

		if (count != 0) {
			result = a / b;
		}

		System.out.println(result);

		if (result > 1.9 && result < 2.6) {
			return true;
		} else {
			return false;
		}

	}

	public static ArrayList<String> checkIfContainString(
			ArrayList<String> stringList, String keyString) {
		if (stringList.size() <= 0) {
			stringList.add(keyString);
		} else {
			boolean isExist = false;
			for (int j = 0; j < stringList.size(); j++) {
				if (keyString.equals(stringList.get(j))) {
					isExist = true;
					j = stringList.size();
				}
			}
			if (!isExist) {
				stringList.add(keyString);
			}
		}
		return stringList;
	}
}
