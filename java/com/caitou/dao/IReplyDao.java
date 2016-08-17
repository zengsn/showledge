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

	// 新建评论
	public void insertReply(Reply reply);

	// 通过评论id查询回复
	public List<Reply> selectByCommentId(int commentId);
}
