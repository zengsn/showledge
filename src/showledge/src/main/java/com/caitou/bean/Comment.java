package com.caitou.bean;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.caitou.common.CountUtil;


@Table(name="t_comment")
public class Comment {

	@Id
	@GeneratedValue(generator="JDBC")
	private int id;
	private int essayId;
	private int commentDiscussantId;
	private String commentDiscussantName; // 评论者昵称
	private String commentDiscussantImagePath; // 评论者头像
	private Timestamp commentTime; // 评论时间
	private String commentContent; // 评论内容
	private int commentBuildingNumber; // 评论楼层
	
	@Transient
	private List<Reply> replyList;
	@Transient
	private String formatCommentTime; // 格式化后的评论时间

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEssayId() {
		return essayId;
	}

	public void setEssayId(int essayId) {
		this.essayId = essayId;
	}

	public int getCommentDiscussantId() {
		return commentDiscussantId;
	}

	public void setCommentDiscussantId(int commentDiscussantId) {
		this.commentDiscussantId = commentDiscussantId;
	}

	public String getCommentDiscussantName() {
		return commentDiscussantName;
	}

	public void setCommentDiscussantName(String commentDiscussantName) {
		this.commentDiscussantName = commentDiscussantName;
	}

	public String getCommentDiscussantImagePath() {
		return commentDiscussantImagePath;
	}

	public void setCommentDiscussantImagePath(String commentDiscussantImagePath) {
		this.commentDiscussantImagePath = commentDiscussantImagePath;
	}

	public Timestamp getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Timestamp commentTime) {
		setFormatCommentTime(commentTime);
		this.commentTime = commentTime;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getCommentBuildingNumber() {
		return commentBuildingNumber;
	}

	public void setCommentBuildingNumber(int commentBuildingNumber) {
		this.commentBuildingNumber = commentBuildingNumber;
	}

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

	public String getFormatCommentTime() {
		return formatCommentTime;
	}

	public void setFormatCommentTime(Timestamp formatCommentTime) {
		this.formatCommentTime = CountUtil.formatTimestamp(formatCommentTime);
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", essayId=" + essayId + ", commentDiscussantId=" + commentDiscussantId
				+ ", commentDiscussantName=" + commentDiscussantName + ", commentDiscussantImagePath="
				+ commentDiscussantImagePath + ", commentTime=" + commentTime + ", commentContent=" + commentContent
				+ ", commentBuildingNumber=" + commentBuildingNumber + ", replyList=" + replyList
				+ ", formatCommentTime=" + formatCommentTime + "]";
	}

	public Comment(int id, int essayId, int commentDiscussantId, String commentDiscussantName,
			String commentDiscussantImagePath, Timestamp commentTime, String commentContent, int commentBuildingNumber,
			List<Reply> replyList, String formatCommentTime) {
		super();
		this.id = id;
		this.essayId = essayId;
		this.commentDiscussantId = commentDiscussantId;
		this.commentDiscussantName = commentDiscussantName;
		this.commentDiscussantImagePath = commentDiscussantImagePath;
		this.commentTime = commentTime;
		this.commentContent = commentContent;
		this.commentBuildingNumber = commentBuildingNumber;
		this.replyList = replyList;
		this.formatCommentTime = formatCommentTime;
	}

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}














