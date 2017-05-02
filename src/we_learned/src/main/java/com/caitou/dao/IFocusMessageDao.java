package com.caitou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caitou.bean.FocusMessage;

/**
 * 对Comment表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface IFocusMessageDao {

	// 新建关注用户文章更新信息
	int insertFocusUserEssayMessage(FocusMessage focusMessage);

	// 新建关注文集更新信息
	int insertFocusCorpusMessage(FocusMessage focusMessage);

	// 新建关注用户知识地图更新信息
	int insertFocusUserKmapMessage(FocusMessage focusMessage);

	// 通过id设置已经阅读
	int setIsRead(int id);

	// 查询未阅读新关注信息数
	int getRowCountIsNotRead(int focusUserId);

	// 通过关注者id查询未阅读消息
	List<FocusMessage> queryFocusMessage(int focusUserId);
}
