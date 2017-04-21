package com.caitou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.caitou.bean.FocusCorpus;

/**
 * 对FocusCorpus表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface IFocusCorpusDao {

	// 新建关注文集
	int insertFocusCorpus(@Param("corpusId") int corpusId,
			@Param("userId") int userId);

	// 通过文集id和用户id删除关注文集
	int deleteFocusCorpus(@Param("corpusId") int corpusId,
			@Param("userId") int userId);

	// 通过用户id查询关注的文集id
	List<Integer> queryCorpusIdByUserId(@Param("userId") int userId);

	// 通过文集id查询关注用户id
	List<Integer> queryUserIdByCorpusId(@Param("corpusId") int corpusId);

	// 通过用户昵称和文集id查询是否关注此文集
	FocusCorpus queryOneCorpus(@Param("corpusId") int corpusId,
			@Param("userId") int userId);
}
