package com.caitou.common;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.caitou.bean.Essay;

/**
 * 进行计算相关的工具类
 * 
 * @author caitou
 *
 */
public class CountUtil {

	/**
	 * 返回当前时间,格式如 '2016-08-02 20:12:06'
	 * 
	 * @return
	 */
	public static Timestamp getTime() {
		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		return timestamp;
	}

	/**
	 * 计算传入的字符串中包含的中文字数
	 * 
	 * @param content
	 *            需要统计其中中文字数的字符串
	 * @return
	 */
	public static int countWordNumber(String content) {
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

	/**
	 * 根据传入时间与现在时间进行计算,得出时间差
	 * 
	 * @param startTimestamp
	 *            传入时间
	 * @return
	 */
	public static String getTimeByNow(Timestamp startTimestamp) {
		Timestamp endTimestamp = getTime();
		int subTime = (int) ((endTimestamp.getTime() - startTimestamp.getTime()) / (1000 * 60));
		if (subTime <= 1) {
			return "不到1分钟之前";
		} else if (subTime < 60) {
			return "大约" + subTime + "分钟之前";
		}
		subTime = subTime / 60;
		if (subTime < 24) {
			return "大约" + subTime + "小时之前";
		}
		subTime = subTime / 24;
		if (subTime < 30) {
			return subTime + "天之前";
		}
		subTime = subTime / 30;
		if (subTime < 12) {
			return subTime + "个月之前";
		}
		subTime = subTime / 12;
		return subTime + "年之前";
	}

	/**
	 * 对传入的List<Essay>中每个essay对象设置与当前的时间差
	 * 
	 * @param essayList
	 *
	 * @return
	 */
	public static List<Essay> setSubTimeInEssay(List<Essay> essayList) {
		for (int i = 0; i < essayList.size(); i++) {
			Essay essay = essayList.get(i);
			Timestamp startTimestamp = essay.getEssayTime();
			if (startTimestamp != null) {
				String subEssayTime = getTimeByNow(essay.getEssayTime());
				essay.setSubEssayTime(subEssayTime);
			} else {
				essay.setSubEssayTime("目前尚无时间");
			}
		}
		return essayList;
	}

	public static String formatTimestamp(Timestamp timestamp) {
		Calendar c = Calendar.getInstance();
		c.setTime(timestamp);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(c.getTime());
	}

	public static String formatEssayTimestampInTimeLine(Timestamp timestamp) {
		Calendar c = Calendar.getInstance();
		c.setTime(timestamp);
		SimpleDateFormat sdf = new SimpleDateFormat("M月d日    HH:mm");
		return sdf.format(c.getTime());
	}

	public static String formatUserTimestampInTimeLine(Timestamp timestamp) {
		Calendar c = Calendar.getInstance();
		c.setTime(timestamp);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return sdf.format(c.getTime());
	}
}
