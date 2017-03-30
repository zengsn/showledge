package com.caitou.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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
	int insertUser(User user);

	// 更新用户昵称
	int updateUserName(@Param("id") int id, @Param("userName") String userName);

	// 更新用户密码
	int updateUserPassword(@Param("id") int id,
			@Param("userPassword") String userPassword);

	// 更新用户手机
	int updateUserPhone(@Param("id") int id,
			@Param("userPhone") String userPhone);

	// 更新用户邮箱
	int updateUserEmail(@Param("id") int id,
			@Param("userEmail") String userEmail);

	// 更新用户头像
	int updateUserImagePath(@Param("id") int id,
			@Param("userImagePath") String userImagePath);

	// 更新用户自我介绍
	int updateUserIntroduce(@Param("id") int id,
			@Param("userIntroduce") String userIntroduce);

	// 更新用户个人网站
	int updateUserWeb(@Param("id") int id, @Param("userWeb") String userWeb);

	// 将关注用户数加1
	int increaseFocusUserNumber(@Param("id") int id);

	// 将关注用户数减1
	int reduceFocusUserNumber(@Param("id") int id);

	// 将关注文集数加1
	int increaseFocusCorpusNumber(@Param("id") int id);

	// 将关注文集数减1
	int reduceFocusCorpusNumber(@Param("id") int id);

	// 将用户粉丝数加1
	int increaseFansNumber(@Param("id") int id);

	// 将用户粉丝数减1
	int reduceFansNumber(@Param("id") int id);

	// 将用户所写文章数加1
	int increaseEssayNumber(@Param("id") int id);

	// 将用户所写文章数减1
	int reduceEssayNumber(@Param("id") int id);

	// 增加用户所写总字数
	int increaseWordsNumber(@Param("id") int id,
			@Param("difference") int difference);

	// 减少用户所写总字数
	int reduceWordsNumber(@Param("id") int id,
			@Param("difference") int difference);

	// 将用户收获喜欢数加1
	int increaseLikesNumber(@Param("id") int id);

	// 将用户收获喜欢数减1
	int reduceLikesNumber(@Param("id") int id);

	// 通过用户名查询用户
	User queryByUserName(@Param("userName") String userName);

	// 通过用户邮箱查询用户
	User queryByUserEmail(@Param("userEmail") String userEmail);

	// 通过用户id查询用户
	User queryByUserId(@Param("id") int id);

	// 计算题目包含关键字的文章数
	int getRowCountLikeKeyword(@Param("keyword") String keyword);

	// 通过用户名中所包含的关键字查询用户
	List<User> queryLikeKeyword(Map<String, Object> map);
}
