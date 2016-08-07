package com.caitou.dao;

import org.springframework.stereotype.Repository;

import com.caitou.entity.User;

@Repository
public interface IUserDao {

	public void insertUser(User user);

	public User selectByUserName(User user);

	public User selectByUserEmail(User user);

	public void updateUserImage(User user);

	public void updateUserName(User user);
	
	public void updateUserPassword(User user);
}
