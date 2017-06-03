package com.caitou.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.caitou.bean.Essay;

/**
 * 对Essay表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface IEssayDao {

	// 使用存储过程新建随记
	void insertEssay(Map<String, Object> paramMap);

	// 使用存储过程通过id删除随记
	void deleteById(Map<String, Object> paramMap);

	// 通过corpusId删除随记
	int deleteByCorpusId(int corpusId);

	// 使用存储过程更新随记
	void updateEssay(Map<String, Object> paramMap);

	// 将文章阅读数加1
	int increaseEssayReadingNumber(@Param("id") int id);

	// 将文章评论数加1
	int increaseEssayCommentNumber(@Param("id") int id);

	// 将文章评论数减1
	int reduceEssayCommentNumber(@Param("id") int id);

	// 将文章喜欢数加1
	int increaseEssayGoodNumber(@Param("id") int id);

	// 将文章喜欢数减1
	int reduceEssayGoodNumber(@Param("id") int id);

	// 通过id查询随记
	Essay queryById(int id);

	// 查询对应数量的随记
	List<Essay> queryLimit(int limitNumber);

	// 通过corpusId查询随记
	List<Essay> queryByCorpusId(int corpusId);

	// 通过随记题目查询随记
	List<Essay> queryByTitle(String essayTitle);

	// 计算题目包含关键字的文章数
	int getRowCountLikeKeyword(@Param("keyword") String keyword);

	// 通过随记题目中所包含的关键字查询随记
	List<Essay> queryTitleLikeKeyword(Map<String, Object> map);

	// 通过用户id查找随记,并将查询结果按照时间顺序倒序排序
	List<Essay> queryByUserIdOrderByTime(int userId);

	// 查询所有文章
	List<Essay> queryAllEssay();
}
