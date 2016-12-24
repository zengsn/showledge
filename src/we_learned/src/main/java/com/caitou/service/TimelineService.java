package com.caitou.service;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Timeline;
import com.caitou.dao.ITimelineDao;

@Service
public class TimelineService {

	@Resource
	ITimelineDao iTimelineDao;

	public void insertTimeline(int userId, int essayId, Timestamp createTime) {
		Timeline timeline = new Timeline();
		timeline.setUserId(userId);
		timeline.setEssayId(essayId);
		timeline.setCreateTime(createTime);
		iTimelineDao.insertTimeline(timeline);
	}

	public void deleteByEssayId(int essayId) {
		iTimelineDao.deleteByEssayId(essayId);
	}

	public List<Timeline> getTimelineByUserId(int userId) {
		return iTimelineDao.queryByUserId(userId);
	}

}
