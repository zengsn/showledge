package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Collect;
import com.caitou.dao.ICollectDao;

@Service
public class CollectService {

	@Resource
	ICollectDao iCollectDao;

	public void insertCollect(int essayId, int userId) {
		iCollectDao.insertCollect(essayId, userId);
	}

	public void deleteByEssayId(int essayId, int userId) {
		iCollectDao.deleteByEssayId(essayId, userId);
	}

	public List<Integer> getEssayIdByUserId(int userId) {
		return iCollectDao.queryEssayIdByUserId(userId);
	}

	public Boolean isCollected(int essayId, int userId) {
		Collect collect = iCollectDao.queryOneCollect(essayId, userId);
		if (collect != null) {
			return true;
		} else {
			return false;
		}
	}
}
