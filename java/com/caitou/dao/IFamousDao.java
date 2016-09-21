package com.caitou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.caitou.bean.Famous;

/**
 * 对Famous表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface IFamousDao {

	// 新建热门文章
	int insertFamous(@Param("essayId") int essayId, @Param("grade") int grade);

	// 删除热门文章
	int deleteByEssayId(@Param("essayId") int essayId);

	// 更新热门文章权重分数
	int updateGradeByEssayId(@Param("essayId") int essayId,
			@Param("grade") int grade);

	// 查询所有热门文章
	List<Famous> queryAllFamous();
}
