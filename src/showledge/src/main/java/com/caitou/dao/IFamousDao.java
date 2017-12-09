package com.caitou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.caitou.bean.Essay;
import com.caitou.bean.Famous;
import com.github.abel533.mapper.Mapper;

/**
 * 对Famous表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface IFamousDao extends Mapper<Famous>{

	// 查询总的记录条数
	int getRowCount();

	// 根据偏移量查询记录
	List<Famous> queryByOffect(@Param("offset") int offset,
			@Param("size") int size);

	// 新建热门文章
	int insertFamous(@Param("essayId") int essayId, @Param("grade") int grade);

	// 删除热门文章
	int deleteByEssayId(@Param("essayId") int essayId);

	// 更新热门文章权重分数
	int updateGradeByEssayId(@Param("essayId") int essayId,
			@Param("grade") int grade);

	//根据类型获取热门的笔记
	List<Essay> selectFamousByType(@Param("essayType")int id);
}
