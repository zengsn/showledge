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

	// 修改用户密码
	public void updateUserEmail(User user);

	// 修改用户简介
	public void updateUserIntroduce(User user);

	// 修改关注用户数
	public void updateUserFocusUserNumber(User user);

	// 修改关注文集数
	public void updateUserFocusCorpusNumber(User user);

	// 修改用户粉丝数
	public void updateUserFansNumber(User user);

	// 修改用户所写文章数
	public void updateUserEssayNumber(User user);

	// 修改用户所写字数数
	public void updateUserWordsNumber(User user);

	// 修改用户收获喜欢数
	public void updateUserLikesNumber(User user);

	// 通过用户名查询用户
	public User selectByUserName(String userName);

	// 通过用户邮箱查询用户
	public User selectByUserEmail(String userEmail);

	// 通过用户id查询用户
	public User selectByUserId(int id);

	// 通过用户名中所包含的关键字查询用户
	public List<User> selectLikeKeyword(String keyword);
}
