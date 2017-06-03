package com.caitou.bean;

import java.sql.Timestamp;

import com.caitou.common.CountUtil;

public class Essay {

	private int id;
	private int userId;
	private String userName; // 作者名
	private String userImagePath; // 作者头像
	private String essayTitle; // 随记题目
	private String essayContent; // 随记内容
	private String essayImagePath; // 随机封面图片
	private Timestamp essayTime; // 随记编写时间
	private int essayReadingNumber; // 随记阅读数
	private int essayCommentNumber; // 随记评论数
	private int essayGoodNumber; // 随记喜欢数
	private int essayWordNumber; // 随记字数
	private int corpusId;
	private int isHot; // 判断该文章是否已经进入热门 0：表示未进入 1：表示已进入
	private String corpusName; // 该文章文集名
	private String subEssayTime; // 与当前时间的时间差
	private String formatEssayTime; // 格式化后的随记编写时间
	private Boolean isCollected; // 判断当前文章是否收藏
	private Boolean isFavourited; // 判断当前文章是否添加喜欢
	private Label label;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserImagePath() {
		return userImagePath;
	}

	public void setUserImagePath(String userImagePath) {
		this.userImagePath = userImagePath;
	}

	public String getEssayTitle() {
		return essayTitle;
	}

	public void setEssayTitle(String essayTitle) {
		this.essayTitle = essayTitle;
	}

	public String getEssayContent() {
		return essayContent;
	}

	public void setEssayContent(String essayContent) {
		this.essayContent = essayContent;
	}

	public String getEssayImagePath() {
		return essayImagePath;
	}

	public void setEssayImagePath(String essayImagePath) {
		this.essayImagePath = essayImagePath;
	}

	public Timestamp getEssayTime() {
		return essayTime;
	}

	public void setEssayTime(Timestamp essayTime) {
		setFormatEssayTime(essayTime);
		this.essayTime = essayTime;
	}

	public int getEssayReadingNumber() {
		return essayReadingNumber;
	}

	public void setEssayReadingNumber(int essayReadingNumber) {
		this.essayReadingNumber = essayReadingNumber;
	}

	public int getEssayCommentNumber() {
		return essayCommentNumber;
	}

	public void setEssayCommentNumber(int essayCommentNumber) {
		this.essayCommentNumber = essayCommentNumber;
	}

	public int getEssayGoodNumber() {
		return essayGoodNumber;
	}

	public void setEssayGoodNumber(int essayGoodNumber) {
		this.essayGoodNumber = essayGoodNumber;
	}

	public int getEssayWordNumber() {
		return essayWordNumber;
	}

	public void setEssayWordNumber(int essayWordNumber) {
		this.essayWordNumber = essayWordNumber;
	}

	public int getCorpusId() {
		return corpusId;
	}

	public void setCorpusId(int corpusId) {
		this.corpusId = corpusId;
	}

	public int getIsHot() {
		return isHot;
	}

	public void setIsHot(int isHot) {
		this.isHot = isHot;
	}

	public String getCorpusName() {
		return corpusName;
	}

	public void setCorpusName(String corpusName) {
		this.corpusName = corpusName;
	}

	public String getSubEssayTime() {
		return subEssayTime;
	}

	public void setSubEssayTime(String subEssayTime) {
		this.subEssayTime = subEssayTime;
	}

	public String getFormatEssayTime() {
		return formatEssayTime;
	}

	public void setFormatEssayTime(Timestamp formatEssayTime) {
		this.formatEssayTime = CountUtil.formatTimestamp(formatEssayTime);
	}

	public Boolean getIsCollected() {
		return isCollected;
	}

	public void setIsCollected(Boolean isCollected) {
		this.isCollected = isCollected;
	}

	public Boolean getIsFavourited() {
		return isFavourited;
	}

	public void setIsFavourited(Boolean isFavourited) {
		this.isFavourited = isFavourited;
	}

	public Label getLabel() {
		return label;
	}

	public void setLabel(Label label) {
		this.label = label;
	}
}