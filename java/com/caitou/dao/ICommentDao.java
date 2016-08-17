package com.caitou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caitou.bean.Comment;

/**
 * 对Comment表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface ICommentDao {

	// 新建评论
	public void insertComment(Comment comment);

	// 通过文章id查询评论
	public List<Comment> selectByEssayId(int id);
}
