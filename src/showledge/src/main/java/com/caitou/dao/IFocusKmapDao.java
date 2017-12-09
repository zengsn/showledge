package com.caitou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.caitou.bean.FocusKmap;
import com.github.abel533.mapper.Mapper;

/**
 * 对FocusKmap表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface IFocusKmapDao extends Mapper<FocusKmap>{

	// 新建关注知识地图
	int insertFocusKmap(@Param("userId") int userId, @Param("kmapId") int kmapId);

	// 通过用户id和知识地图id删除关注知识地图
	int deleteFocusKmap(@Param("userId") int userId, @Param("kmapId") int kmapId);

	// 通过用户id查询关注的知识地图id
	List<Integer> queryKmapIdByUserId(@Param("userId") int userId);
}











