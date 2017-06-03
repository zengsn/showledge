package com.caitou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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

	// 添加喜欢
	int insertFavourite(@Param("essayId") int essayId,
			@Param("userId") int userId);

	// 通过文章id和用户id删除喜欢
	int deleteByEssayId(@Param("essayId") int essayId,
			@Param("userId") int userId);

	// 通过用户id查询收藏的文章id
	List<Integer> queryEssayIdByUserId(@Param("userId") int userId);

	// 通过文章id和用户id查询是否已经喜欢此文章
	Favourite queryOneFavourite(@Param("essayId") int essayId,
			@Param("userId") int userId);
}
