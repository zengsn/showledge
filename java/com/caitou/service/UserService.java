package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.dao.IUserDao;
import com.caitou.entity.User;

@Service
public class UserService {

	@Resource
	IUserDao iUserDao;

	public boolean insertUser(User user) {
		if (user.getUserName().isEmpty()) {
			return false;
		} else if (user.getUserEmail().isEmpty()) {
			return false;
		} else if (user.getUserPassword().isEmpty()) {
			return false;
		} else {
			iUserDao.insertUser(user);
			return true;
		}
	}

	public boolean checkLogin(User user) {
		if (user.getUserEmail().isEmpty()) {
			return false;
		}
		User user2 = iUserDao.selectByUserEmail(user);
		if (user2.getUserPassword().equals(user.getUserPassword())) {
			return true;
		} else {
			return false;
		}
	}

	public String getUserNameByUserEmail(User user) {
		User user2 = iUserDao.selectByUserEmail(user);
		return user2.getUserName();
	}

	public boolean isExistUserName(String userName) {
		User user = new User();
		user.setUserName(userName);
		User user2 = iUserDao.selectByUserName(user);
		if (user2 != null) {
			return true;
		} else {
			return false;
		}
	}

	public boolean isExistUserEmail(String userEmail) {
		User user = new User();
		user.setUserEmail(userEmail);
		User user2 = iUserDao.selectByUserEmail(user);
		if (user2 != null) {
			return true;
		} else {
			return false;
		}
	}

	public void saveUserImage(String userName, String userImagePath) {
		User user = new User();
		user.setUserName(userName);
		user.setUserImagePath(userImagePath);
		iUserDao.updateUserImage(user);
	}

	public User selectByUserName(String userName) {
		User user = new User();
		user.setUserName(userName);
		return iUserDao.selectByUserName(user);
	}

	public void updateUserName(String oldUserName, String newUserName) {
		User user = new User();
		user.setUserName(oldUserName);
		user = iUserDao.selectByUserName(user);
		user.setUserName(newUserName);
		iUserDao.updateUserName(user);
	}

	public void updateUserPassword(User user) {
		iUserDao.updateUserPassword(user);
	}

	public List<User> selectUserLikeKeyword(String keyword) {
		List<User> userList = iUserDao.selectUserLikeKeyword(keyword);
		return userList;
	}
}
