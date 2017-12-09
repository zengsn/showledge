package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.FocusUser;
import com.caitou.dao.IFocusUserDao;

@Service
public class FocusUserService {

	@Resource
	IFocusUserDao iFocusUserDao;

	@Resource
	UserService userService;

	public void insertFocusUser(int focusUserId, int userId) {
		iFocusUserDao.insertFocusUser(focusUserId, userId);
	}

	public void deleteFocusUser(int focusUserId, int userId) {
		iFocusUserDao.deleteFocusUser(focusUserId, userId);
	}

	public List<Integer> getFocusUserIdByUserId(int userId) {
		return iFocusUserDao.queryFocusUserIdByUserId(userId);
	}

	public List<Integer> getUserIdByFocusUserId(int focusUserId) {
		return iFocusUserDao.queryUserIdByFocusUserId(focusUserId);
	}

	public Boolean isFocusUsered(int focusUserId, int userId) {
		//判断有没有关注
		FocusUser focusUser = iFocusUserDao.queryOneFocusUser(focusUserId,
				userId);
		if (focusUser != null) {
			return true;
		} else {
			return false;
		}
	}
}
