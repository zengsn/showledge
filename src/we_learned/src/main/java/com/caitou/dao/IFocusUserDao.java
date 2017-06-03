package com.caitou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.caitou.bean.FocusUser;

/**
 * 对Focus表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface IFocusUserDao {

	// 新建关注
	int insertFocusUser(@Param("focusUserId") int focusUserId,
			@Param("userId") int userId);

	// 通过被关注用户id和用户id删除关注
	int deleteFocusUser(@Param("focusUserId") int focusUserId,
			@Param("userId") int userId);

	// 通过用户id查询被关注用户id
	List<Integer> queryFocusUserIdByUserId(@Param("userId") int userId);

	// 通过被收藏人id查询用户
	List<Integer> queryUserIdByFocusUserId(@Param("focusUserId") int focusUserId);

	// 通过用户昵称和被收藏用户id查询是否已经关注此用户
	FocusUser queryOneFocusUser(@Param("focusUserId") int focusUserId,
			@Param("userId") int userId);
}
