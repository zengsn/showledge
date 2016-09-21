package com.caitou.dao;

import java.util.List;

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
	int insertCorpus(@Param("userId") int userId,
			@Param("corpusName") String corpusName);

	// 通过id删除文集
	int deleteById(@Param("id") int id);

	// 通过id修改文集名
	int updateCorpusName(@Param("id") int id,
			@Param("corpusName") String corpusName);

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

	// 通过文集题目所包含的关键字查询文集
	List<Corpus> queryLikeKeyword(@Param("keyword") String keyword);
}
