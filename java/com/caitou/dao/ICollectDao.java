package com.caitou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caitou.bean.Collect;

/**
 * 对Collect表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface ICollectDao {

	// 新建评论
	public void insertCollect(Collect collect);

	// 通过id和用户昵称删除收藏
	public void deleteByEssayId(Collect collect);

	// 通过用户昵称查询收藏的文章id
	public List<Integer> selectEssayIdByUserName(String userName);

	// 通过用户昵称和文章id查询是否已经收藏此文章
	public Collect selectOneCollect(Collect collect);
}
