package com.caitou.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.caitou.bean.Corpus;

/**
 * 对Corpus表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface ICorpusDao {

	// 新建文集
	int insertCorpus(Corpus corpus);

	// 通过id删除文集
	int deleteById(@Param("id") int id);

	// 通过id修改文集名
	int updateCorpusName(@Param("id") int id,
			@Param("corpusName") String corpusName);

	// 通过id修改文集封面图片
	int updateCorpusImage(@Param("id") int id,
			@Param("corpusImagePath") String corpusImagePath);

	// 通过id修改文集介绍
	int updateCorpusDiscribe(@Param("id") int id,
			@Param("corpusDiscribe") String corpusDiscribe);

	// 将文集文章数加1
	int increaseEssayNumber(@Param("id") int id);

	// 将文集文章数减1
	int reduceEssayNumber(@Param("id") int id);

	// 通过文集id增加该文集下所有文章总字数
	int increaseEssayWordNumber(@Param("id") int id,
			@Param("difference") int difference);

	// 通过文集id减少该文集下所有文章总字数
	int reduceEssayWordNumber(@Param("id") int id,
			@Param("difference") int difference);

	// 将文集用户关注数加1
	int increaseUserFocusNumber(@Param("id") int id);

	// 将文集用户关注数减1
	int reduceUserFocusNumber(@Param("id") int id);

	// 通过文集id查询文集
	Corpus queryById(@Param("id") int id);

	// 通过用户id查询文集
	List<Corpus> queryByUserId(@Param("userId") int userId);

	// 计算名字包含关键字的文集数
	int getRowCountLikeKeyword(@Param("keyword") String keyword);

	// 通过文集题目所包含的关键字查询文集
	List<Corpus> queryLikeKeyword(Map<String, Object> map);
}
