package com.caitou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caitou.entity.Comment;

@Repository
public interface ICommentDao {

	public void insertComment(Comment comment);

	public List<Comment> selectCommentByEssayId(String id);
}
