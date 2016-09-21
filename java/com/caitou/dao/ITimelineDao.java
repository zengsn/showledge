package com.caitou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.caitou.bean.Timeline;

/**
 * 对Timeline表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface ITimelineDao {

	// 新建动态
	int insertTimeline(Timeline timeline);

	// 通过文章id删除动态
	int deleteByEssayId(@Param("essayId") int essayId);

	// 通过用户id查询该用户所有动态
	List<Timeline> queryByUserId(@Param("userId") int userId);

}
