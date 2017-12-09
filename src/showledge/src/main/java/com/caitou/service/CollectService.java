package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Collect;
import com.caitou.bean.User;
import com.caitou.dao.ICollectDao;
import com.caitou.threadlocal.UserThreadLocal;
import com.github.abel533.entity.Example;

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

	/**
	 * 改变用户收藏笔记的状态
	 * 
	 * @param essayId
	 */
	public void changeCollection(Integer essayId) {
		User user = UserThreadLocal.getUser();
		
		Example example = new Example(Collect.class);
		example.createCriteria().andEqualTo("essayId", essayId).andEqualTo("userId", user.getId());
		int selectCountByExample = iCollectDao.selectCountByExample(example);
		
		
		if (selectCountByExample == 1) {
			//已经收藏,取消收藏
			iCollectDao.deleteByExample(example);
		}else{
			//没有收藏,收藏
			iCollectDao.insert(new Collect(essayId, user.getId()));
		}
	}
}
































