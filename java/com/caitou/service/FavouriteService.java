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

	public void insertFavourite(String essayId, String userName) {
		Favourite favourite = new Favourite();
		favourite.setEssayId(Integer.valueOf(essayId));
		favourite.setUserName(userName);
		iFavouriteDao.insertFavourite(favourite);
	}

	public void deleteByEssayId(String essayId, String userName) {
		Favourite favourite = new Favourite();
		favourite.setEssayId(Integer.valueOf(essayId));
		favourite.setUserName(userName);
		iFavouriteDao.deleteByEssayId(favourite);
	}

	public List<Integer> selectEssayIdByUserName(String userName) {
		return iFavouriteDao.selectEssayIdByUserName(userName);
	}

	public Boolean isFavourited(String essayId, String userName) {
		Favourite favourite = new Favourite();
		favourite.setEssayId(Integer.valueOf(essayId));
		favourite.setUserName(userName);
		Favourite favourite2 = iFavouriteDao.selectOneFavourite(favourite);
		if (favourite2 != null) {
			return true;
		} else {
			return false;
		}
	}

	public int countFavouriteByEssayId(String essayId) {
		return iFavouriteDao.countFavouriteByEssayId(Integer.valueOf(essayId));
	}
}
