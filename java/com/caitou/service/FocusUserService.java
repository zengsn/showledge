package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.FocusUser;
import com.caitou.dao.IFocusUserDao;

@Service
public class FocusUserService {

	@Resource
	IFocusUserDao iFocusDao;

	@Resource
	UserService userService;

	public void insertFocus(String focusUserId, String userName) {
		FocusUser focus = new FocusUser();
		focus.setFocusUserId(Integer.valueOf(focusUserId));
		focus.setUserName(userName);
		iFocusDao.insertFocusUser(focus);
	}

	public void deleteById(String focusUserId, String userName) {
		FocusUser focus = new FocusUser();
		focus.setFocusUserId(Integer.valueOf(focusUserId));
		focus.setUserName(userName);
		iFocusDao.deleteByFocusUserId(focus);
	}

	public List<Integer> selectFocusUserIdByUserName(String userName) {
		return iFocusDao.selectFocusUserIdByUserName(userName);
	}

	public List<String> selectUserNameByFocusUserId(int focusUserId) {
		return iFocusDao.selectUserNameByFocusUserId(focusUserId);
	}

	public Boolean isFocused(int focusUserId, String userName) {
		FocusUser focus = new FocusUser();
		focus.setFocusUserId(focusUserId);
		focus.setUserName(userName);
		FocusUser focus2 = iFocusDao.selectOneFocusUser(focus);
		if (focus2 != null) {
			return true;
		} else {
			return false;
		}
	}
}
