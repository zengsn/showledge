package com.caitou.dao;

import java.util.List;

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
	public void insertFocusCorpus(FocusCorpus focusCorpus);

	// 通过文集id和用户昵称删除关注文集
	public void deleteFocusCorpus(FocusCorpus focusCorpus);

	// 通过用户昵称查询关注的文集id
	public List<Integer> selectCorpusIdByUserName(String userName);

	// 通过文集id查询关注用户的昵称
	public List<String> selectUserNameByCorpusId(int corpusId);

	// 通过用户昵称和文集id查询是否关注此文集
	public FocusCorpus selectOneCorpus(FocusCorpus focusCorpus);
}
