package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.User;
import com.caitou.dao.IUserDao;

@Service
public class UserService {

	@Resource
	IUserDao iUserDao;

	public void insertUser(User user) {
		iUserDao.insertUser(user);
	}

	public boolean checkLogin(String userEmail, String userPassword) {
		if (userEmail.isEmpty() || userPassword.isEmpty()) {
			return false;
		}
		User user = iUserDao.selectByUserEmail(userEmail);
		if (user.getUserPassword().equals(userPassword)) {
			return true;
		} else {
			return false;
		}
	}

	public String getUserNameByUserEmail(String userEmail) {
		User user = iUserDao.selectByUserEmail(userEmail);
		return user.getUserName();
	}

	public boolean isExistUserName(String userName) {
		User user = iUserDao.selectByUserName(userName);
		if (user != null) {
			return true;
		} else {
			return false;
		}
	}

	public boolean isExistUserEmail(String userEmail) {
		User user = iUserDao.selectByUserEmail(userEmail);
		if (user != null) {
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
		return iUserDao.selectByUserName(userName);
	}

	public void updateUserName(String oldUserName, String newUserName) {
		User user = iUserDao.selectByUserName(oldUserName);
		user.setUserName(newUserName);
		iUserDao.updateUserName(user);
	}

	public void updateUserPassword(User user) {
		iUserDao.updateUserPassword(user);
	}

	public List<User> selectUserLikeKeyword(String keyword) {
		List<User> userList = iUserDao.selectLikeKeyword(keyword);
		return userList;
	}
}
