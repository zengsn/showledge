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

	public void insertCollect(String essayId, String userName) {
		Collect collect = new Collect();
		collect.setEssayId(Integer.valueOf(essayId));
		collect.setUserName(userName);
		iCollectDao.insertCollect(collect);
	}

	public void deleteByEssayId(String essayId, String userName) {
		Collect collect = new Collect();
		collect.setEssayId(Integer.valueOf(essayId));
		collect.setUserName(userName);
		iCollectDao.deleteByEssayId(collect);
	}

	public List<Integer> selectEssayIdByUserName(String userName) {
		return iCollectDao.selectEssayIdByUserName(userName);
	}

	public Boolean isCollected(String essayId, String userName) {
		Collect collect = new Collect();
		collect.setEssayId(Integer.valueOf(essayId));
		collect.setUserName(userName);
		Collect collect2 = iCollectDao.selectOneCollect(collect);
		if (collect2 != null) {
			return true;
		} else {
			return false;
		}
	}
}
