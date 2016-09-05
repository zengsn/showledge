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

	// 通过id更新文集名字
	public void updateCorpusNameById(Corpus corpus);

	// 通过id更新文集下的文章数
	public void updateEssayNumberById(Corpus corpus);

	// 通过id更新文集下所有文章的字数
	public void updateEssayWordNumberById(Corpus corpus);

	// 通过id更新文集的用户关注数
	public void updateUserFocusNumberById(Corpus corpus);

	// 通过用户名查询文集
	public List<Corpus> selectByUserName(String userName);

	// 通过用户名查询文集
	public Corpus selectById(int id);

	// 通过文集题目所包含的关键字查询文集
	public List<Corpus> selectLikeKeyword(String keyword);
}
