package com.caitou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caitou.bean.Focus;

/**
 * 对Focus表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface IFocusDao {

	// 新建关注
	public void insertFocus(Focus focus);

	// 通过id和用户昵称删除关注
	public void deleteByFocusUserId(Focus focus);

	// 通过用户昵称查询被收藏用户id
	public List<Integer> selectFocusUserIdByUserName(String userName);

	// 通过被收藏人id查询用户
	public List<String> selectUserNameByFocusUserId(int focusUserId);

	// 通过用户昵称和被收藏用户id查询是否已经关注此用户
	public Focus selectOneFocus(Focus focus);
}
