package com.caitou.dao;

import java.util.List;

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
	public void insertCorpus(Corpus corpus);

	// 通过id删除文集
	public void deleteById(int id);

	// 通过id更新文集
	public void updateById(Corpus corpus);

	// 通过用户名查询文集
	public List<Corpus> selectByUserName(String userName);

	// 通过用户名查询文集
	public Corpus selectById(int id);

	// 通过文集题目所包含的关键字查询文集
	public List<Corpus> selectLikeKeyword(String keyword);
}
