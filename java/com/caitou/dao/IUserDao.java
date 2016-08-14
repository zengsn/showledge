package com.caitou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caitou.entity.User;

@Repository
public interface IUserDao {

	public void insertUser(User user);

	public User selectByUserName(User user);

	public User selectByUserEmail(User user);
	
	public List<User> selectUserLikeKeyword(String keyword);

	public void updateUserImage(User user);

	public void updateUserName(User user);
	
	public void updateUserPassword(User user);
}
