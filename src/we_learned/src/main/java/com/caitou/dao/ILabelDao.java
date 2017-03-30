package com.caitou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.caitou.bean.Label;

/**
 * 对Label表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface ILabelDao {

	// 添加标签
	int insertLabel(@Param("userId") int userId, @Param("essayId") int essayId,
			@Param("firstLabel") String firstLabel,
			@Param("secondLabel") String secondLabel,
			@Param("thirdLabel") String thirdLabel);

	// 删除标签
	int deleteLabel(@Param("essayId") int essayId);

	// 通过文章id修改文章标签
	int updateLabelByEssayId(@Param("essayId") int essayId,
			@Param("firstLabel") String firstLabel,
			@Param("secondLabel") String secondLabel,
			@Param("thirdLabel") String thirdLabel);

	// 通过用户id查询文章标签
	List<Label> queryByUserId(@Param("userId") int userId);

	// 通过文章id查询文章标签
	Label queryByEssayId(@Param("essayId") int essayId);

	// 通过用户id查询文章标签
	List<Label> queryByThirdLabel(@Param("userId") int userId,
			@Param("thirdLabel") String thirdLabel);
}
