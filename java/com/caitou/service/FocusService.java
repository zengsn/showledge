package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Focus;
import com.caitou.dao.IFocusDao;

@Service
public class FocusService {

	@Resource
	IFocusDao iFocusDao;

	@Resource
	UserService userService;

	public void insertFocus(String focusUserId, String userName) {
		Focus focus = new Focus();
		focus.setFocusUserId(Integer.valueOf(focusUserId));
		focus.setUserName(userName);
		iFocusDao.insertFocus(focus);
		int userFocusNumber = iFocusDao.countWhereUserName(userName);
		userService.updateUserFocusNumber(userName, userFocusNumber);
	}

	public void deleteById(String focusUserId, String userName) {
		Focus focus = new Focus();
		focus.setFocusUserId(Integer.valueOf(focusUserId));
		focus.setUserName(userName);
		iFocusDao.deleteByFocusUserId(focus);
		int userFocusNumber = iFocusDao.countWhereUserName(userName);
		userService.updateUserFocusNumber(userName, userFocusNumber);
	}

	public List<Integer> selectFocusUserIdByUserName(String userName) {
		return iFocusDao.selectFocusUserIdByUserName(userName);
	}

	public List<String> selectUserNameByFocusUserId(int focusUserId) {
		return iFocusDao.selectUserNameByFocusUserId(focusUserId);
	}

	public Boolean isFocused(int focusUserId, String userName) {
		Focus focus = new Focus();
		focus.setFocusUserId(focusUserId);
		focus.setUserName(userName);
		Focus focus2 = iFocusDao.selectOneFocus(focus);
		if (focus2 != null) {
			return true;
		} else {
			return false;
		}
	}

	public int countWhereUserName(String userName) {
		return iFocusDao.countWhereUserName(userName);
	}
}
