package com.caitou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caitou.bean.User;

/**
 * 对User表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface IUserDao {

	// 新建用户
	public void insertUser(User user);

	// 修改用户头像路径
	public void updateUserImage(User user);

	// 修改用户名
	public void updateUserName(User user);

	// 修改用户密码
	public void updateUserPassword(User user);

	// 通过用户名查询用户
	public User selectByUserName(String userName);

	// 通过用户邮箱查询用户
	public User selectByUserEmail(String userEmail);

	// 通过用户名中所包含的关键字查询用户
	public List<User> selectLikeKeyword(String keyword);
}
