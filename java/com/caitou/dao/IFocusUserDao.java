package com.caitou.dao;

import java.util.List;

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
	public void insertFocusUser(FocusUser focus);

	// 通过id和用户昵称删除关注
	public void deleteByFocusUserId(FocusUser focus);

	// 通过用户昵称查询被收藏用户id
	public List<Integer> selectFocusUserIdByUserName(String userName);

	// 通过被收藏人id查询用户
	public List<String> selectUserNameByFocusUserId(int focusUserId);

	// 通过用户昵称和被收藏用户id查询是否已经关注此用户
	public FocusUser selectOneFocusUser(FocusUser focus);
}
