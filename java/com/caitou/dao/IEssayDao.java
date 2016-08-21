package com.caitou.dao;

import java.util.List;

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

	// 新建随记
	public void insertEssay(Essay essay);

	// 通过id删除随记
	public void deleteById(int id);

	// 通过corpusId删除随记
	public void deleteByCorpusId(int corpusId);

	// 通过id修改随记
	public void updateById(Essay essay);

	// 通过id修改随记评论数
	public void updateCommentNumberById(Essay essay);

	// 通过id查询随记
	public Essay selectById(String id);

	// 查询对应数量的随记
	public List<Essay> selectLimit(int limitNumber);

	// 通过corpusId查询随记
	public List<Essay> selectByCorpusId(int corpusId);

	// 通过随记题目查询随记
	public List<Essay> selectByTitle(String essayTitle);

	// 通过随记题目中所包含的关键字查询随记
	public List<Essay> selectTitleLikeKeyword(String keyword);

	// 通过用户昵称查找随记,并将查询结果按照时间顺序倒序排序
	public List<Essay> selectByUserNameOrderByTime(String userName);
}
