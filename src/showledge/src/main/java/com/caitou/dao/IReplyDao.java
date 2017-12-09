package com.caitou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caitou.bean.Reply;

/**
 * 对Reply表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface IReplyDao {

	// 新建回复
	int insertReply(Reply reply);

	// 通过id删除回复
	int deleteById(int id);

	// 通过commentId删除回复
	int deleteByCommentId(int commentId);

	// 通过评论id查询回复
	List<Reply> queryByCommentId(int commentId);
}
