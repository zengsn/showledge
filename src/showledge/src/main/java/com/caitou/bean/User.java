package com.caitou.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 用户表
 * 
 * @author _wind
 *
 */

@Table(name="t_user")
public class User implements Serializable{

	@Id
	@GeneratedValue(generator="JDBC")
	private int id;
	private String userName; // 用户名
	private String userPassword; // 用户密码
	private String userEmail; // 用户邮箱
	private String userPhone; // 用户手机
	
	private String userImagePath; // 用户头像存放路径
	private String userIntroduce; // 用户个人简介
	
	//数量相关的东西
	@Transient
	private int userDynNumber; // 动态的数量
	@Transient
	private int userCollectTotleNumber;
	@Transient
	private int userKMapNumber;
	private int userFocusNumber; // 用户关注数
	private int userFocusUserNumber; // 用户关注其他用户数
	private int userFocusCorpusNumber; // 用户关注文集数
	private int userFansNumber; // 用户粉丝数
	private int userEssayNumber; // 用户所写文章数
	private int userWordsNumber; // 用户所写字数
	private int userLikesNumber; // 用户收获喜欢数

	@Transient
	private Boolean isFocused; // 判断用户是否已经关注
	
	private String userWeb; // 用户个人网站
	private Timestamp userCreateTime; // 用户创建时间
	
	@Transient
	private String userFormatCreateTime; // 格式化后的用户创建时间,形如2017-10-01
	
	@Transient
	private String userLevel; // 用户段位

	@Transient
	private UserInfo userInfo;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserImagePath() {
		return userImagePath;
	}

	public void setUserImagePath(String userImagePath) {
		this.userImagePath = userImagePath;
	}

	public String getUserIntroduce() {
		return userIntroduce;
	}

	public void setUserIntroduce(String userIntroduce) {
		this.userIntroduce = userIntroduce;
	}

	public int getUserDynNumber() {
		return userDynNumber;
	}

	public void setUserDynNumber(int userDynNumber) {
		this.userDynNumber = userDynNumber;
	}

	public int getUserCollectTotleNumber() {
		return userCollectTotleNumber;
	}

	public void setUserCollectTotleNumber(int userCollectTotleNumber) {
		this.userCollectTotleNumber = userCollectTotleNumber;
	}

	public int getUserKMapNumber() {
		return userKMapNumber;
	}

	public void setUserKMapNumber(int userKMapNumber) {
		this.userKMapNumber = userKMapNumber;
	}

	public int getUserFocusNumber() {
		return userFocusNumber;
	}

	public void setUserFocusNumber(int userFocusNumber) {
		this.userFocusNumber = userFocusNumber;
	}

	public int getUserFocusUserNumber() {
		return userFocusUserNumber;
	}

	public void setUserFocusUserNumber(int userFocusUserNumber) {
		this.userFocusUserNumber = userFocusUserNumber;
	}

	public int getUserFocusCorpusNumber() {
		return userFocusCorpusNumber;
	}

	public void setUserFocusCorpusNumber(int userFocusCorpusNumber) {
		this.userFocusCorpusNumber = userFocusCorpusNumber;
	}

	public int getUserFansNumber() {
		return userFansNumber;
	}

	public void setUserFansNumber(int userFansNumber) {
		this.userFansNumber = userFansNumber;
	}

	public int getUserEssayNumber() {
		return userEssayNumber;
	}

	public void setUserEssayNumber(int userEssayNumber) {
		this.userEssayNumber = userEssayNumber;
	}

	public int getUserWordsNumber() {
		return userWordsNumber;
	}

	public void setUserWordsNumber(int userWordsNumber) {
		this.userWordsNumber = userWordsNumber;
	}

	public int getUserLikesNumber() {
		return userLikesNumber;
	}

	public void setUserLikesNumber(int userLikesNumber) {
		this.userLikesNumber = userLikesNumber;
	}

	public Boolean getIsFocused() {
		return isFocused;
	}

	public void setIsFocused(Boolean isFocused) {
		this.isFocused = isFocused;
	}

	public String getUserWeb() {
		return userWeb;
	}

	public void setUserWeb(String userWeb) {
		this.userWeb = userWeb;
	}

	public Timestamp getUserCreateTime() {
		return userCreateTime;
	}

	public void setUserCreateTime(Timestamp userCreateTime) {
		this.userCreateTime = userCreateTime;
	}

	public String getUserFormatCreateTime() {
		return userFormatCreateTime;
	}

	public void setUserFormatCreateTime(String userFormatCreateTime) {
		this.userFormatCreateTime = userFormatCreateTime;
	}

	public String getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", userPassword=" + userPassword + ", userEmail="
				+ userEmail + ", userPhone=" + userPhone + ", userImagePath=" + userImagePath + ", userIntroduce="
				+ userIntroduce + ", userDynNumber=" + userDynNumber + ", userCollectTotleNumber="
				+ userCollectTotleNumber + ", userKMapNumber=" + userKMapNumber + ", userFocusNumber=" + userFocusNumber
				+ ", userFocusUserNumber=" + userFocusUserNumber + ", userFocusCorpusNumber=" + userFocusCorpusNumber
				+ ", userFansNumber=" + userFansNumber + ", userEssayNumber=" + userEssayNumber + ", userWordsNumber="
				+ userWordsNumber + ", userLikesNumber=" + userLikesNumber + ", isFocused=" + isFocused + ", userWeb="
				+ userWeb + ", userCreateTime=" + userCreateTime + ", userFormatCreateTime=" + userFormatCreateTime
				+ ", userLevel=" + userLevel + ", userInfo=" + userInfo + "]";
	}

	public User(int id, String userName, String userPassword, String userEmail, String userPhone, String userImagePath,
			String userIntroduce, int userDynNumber, int userCollectTotleNumber, int userKMapNumber,
			int userFocusNumber, int userFocusUserNumber, int userFocusCorpusNumber, int userFansNumber,
			int userEssayNumber, int userWordsNumber, int userLikesNumber, Boolean isFocused, String userWeb,
			Timestamp userCreateTime, String userFormatCreateTime, String userLevel, UserInfo userInfo) {
		super();
		this.id = id;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userImagePath = userImagePath;
		this.userIntroduce = userIntroduce;
		this.userDynNumber = userDynNumber;
		this.userCollectTotleNumber = userCollectTotleNumber;
		this.userKMapNumber = userKMapNumber;
		this.userFocusNumber = userFocusNumber;
		this.userFocusUserNumber = userFocusUserNumber;
		this.userFocusCorpusNumber = userFocusCorpusNumber;
		this.userFansNumber = userFansNumber;
		this.userEssayNumber = userEssayNumber;
		this.userWordsNumber = userWordsNumber;
		this.userLikesNumber = userLikesNumber;
		this.isFocused = isFocused;
		this.userWeb = userWeb;
		this.userCreateTime = userCreateTime;
		this.userFormatCreateTime = userFormatCreateTime;
		this.userLevel = userLevel;
		this.userInfo = userInfo;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}



	
}
