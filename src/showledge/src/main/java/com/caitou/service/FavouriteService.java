package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Favourite;
import com.caitou.bean.User;
import com.caitou.dao.IFavouriteDao;
import com.caitou.threadlocal.UserThreadLocal;
import com.github.abel533.entity.Example;

@Service
public class FavouriteService {

	@Resource
	IFavouriteDao iFavouriteDao;

	public void insertFavourite(int essayId, int userId) {
		iFavouriteDao.insertFavourite(essayId, userId);
	}

	public void deleteByEssayId(int essayId, int userId) {
		iFavouriteDao.deleteByEssayId(essayId, userId);
	}

	public List<Integer> getEssayIdByUserId(int userId) {
		return iFavouriteDao.queryEssayIdByUserId(userId);
	}

	public Boolean isFavourited(int essayId, int userId) {
		Favourite favourite = iFavouriteDao.queryOneFavourite(essayId, userId);
		if (favourite != null) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 改变用户的喜欢装填
	 * 
	 * @param essayId
	 */
	public void changeFavourite(Integer essayId) {
		User user = UserThreadLocal.getUser();
		
		Example example = new Example(Favourite.class);
		example.createCriteria().andEqualTo("essayId", essayId).andEqualTo("userId", user.getId());
		int selectCountByExample = iFavouriteDao.selectCountByExample(example);
		
		//判断是否点赞
		if (selectCountByExample == 1) {
			//已经点赞,取消点赞
			iFavouriteDao.deleteByExample(example);
		}else{
			//点赞
			iFavouriteDao.insert(new Favourite(essayId, user.getId()));
		}
		
	}
	
	
	
	
}










