package com.caitou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caitou.bean.CommentMessage;

/**
 * 对CommentMessage表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface ICommentMessageDao {

	// 新建评论消息
	int insertCommentMessage(CommentMessage commentMessage);

	// 通过id设置已经阅读
	int setIsRead(int id);

	// 查询未阅读新评论消息数
	int getRowCountIsNotRead(int focusUserId);

	// 通过关注者id查询消息
	List<CommentMessage> queryCommentMessage(int focusUserId);
}
