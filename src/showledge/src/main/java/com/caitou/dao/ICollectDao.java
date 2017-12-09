package com.caitou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.caitou.bean.Collect;
import com.github.abel533.mapper.Mapper;

/**
 * 对Collect表进行操作的Dao层
 * 
 * @author caitou
 *
 */

@Repository
public interface ICollectDao extends Mapper<Collect>{

	// 新建评论
	int insertCollect(@Param("essayId") int essayId, @Param("userId") int userId);

	// 通过文章id和用户id删除收藏
	int deleteByEssayId(@Param("essayId") int essayId,
			@Param("userId") int userId);

	// 通过用户id查询收藏的文章id
	List<Integer> queryEssayIdByUserId(@Param("userId") int userId);

	// 通过用户昵称和文章id查询是否已经收藏此文章
	Collect queryOneCollect(@Param("essayId") int essayId,
			@Param("userId") int userId);
}
