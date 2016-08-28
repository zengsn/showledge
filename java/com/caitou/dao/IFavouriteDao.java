package com.caitou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caitou.bean.Favourite;

/**
 * 对Favourite表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface IFavouriteDao {

	// 新建评论
	public void insertFavourite(Favourite favourite);

	// 通过id删除喜欢
	public void deleteByEssayId(Favourite favourite);

	// 通过用户昵称查询收藏的文章id
	public List<Integer> selectEssayIdByUserName(String userName);

	// 通过用户昵称和文章id查询是否已经喜欢此文章
	public Favourite selectOneFavourite(Favourite favourite);
	
	// 通过文章id计算喜欢数
	public int countFavouriteByEssayId(int essayId);
}
