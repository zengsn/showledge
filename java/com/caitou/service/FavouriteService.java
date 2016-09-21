package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Favourite;
import com.caitou.dao.IFavouriteDao;

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
}
