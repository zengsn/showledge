package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.dao.IUserDao;

@Service
public class UserService {

	@Resource
	IUserDao iUserDao;

	@Resource
	EssayService essayService;

	public int insertUser(String userEmail, String userName, String userPassword) {
		User user = new User();
		user.setUserEmail(userEmail);
		user.setUserName(userName);
		user.setUserPassword(userPassword);
		iUserDao.insertUser(user);
		return user.getId();
	}

	public boolean checkLogin(String userEmail, String userPassword) {
		if (userEmail.isEmpty() || userPassword.isEmpty()) {
			return false;
		}
		User user = iUserDao.queryByUserEmail(userEmail);
		if (user.getUserPassword().equals(userPassword)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean isExistUserName(String userName) {
		User user = iUserDao.queryByUserName(userName);
		if (user != null) {
			return true;
		} else {
			return false;
		}
	}

	public boolean isExistUserEmail(String userEmail) {
		User user = iUserDao.queryByUserEmail(userEmail);
		if (user != null) {
			return true;
		} else {
			return false;
		}
	}

	public void updateUserImage(int userId, String userImagePath) {
		iUserDao.updateUserImagePath(userId, userImagePath);
	}

	public void updateUserName(int userId, String userName) {
		iUserDao.updateUserName(userId, userName);
	}

	public void updateUserPassword(int userId, String userPassword) {
		iUserDao.updateUserPassword(userId, userPassword);
	}

	public void updateUserEmail(int userId, String userEmail) {
		iUserDao.updateUserEmail(userId, userEmail);
	}

	public void updateUserIntroduce(int userId, String userIntroduce) {
		iUserDao.updateUserIntroduce(userId, userIntroduce);
	}

	public void increaseUserFocusUserNumber(int userId) {
		iUserDao.increaseFocusUserNumber(userId);
	}

	public void reduceUserFocusUserNumber(int userId) {
		iUserDao.reduceFocusUserNumber(userId);
	}

	public void increaseUserFocusCorpusNumber(int userId) {
		iUserDao.increaseFocusCorpusNumber(userId);
	}

	public void reduceUserFocusCorpusNumber(int userId) {
		iUserDao.reduceFocusCorpusNumber(userId);
	}

	public void increaseUserFansNumber(int userId) {
		iUserDao.increaseFansNumber(userId);
	}

	public void reduceUserFansNumber(int userId) {
		iUserDao.reduceFansNumber(userId);
	}

	public void increaseUserEssayNumber(int userId) {
		iUserDao.increaseEssayNumber(userId);
	}

	public void reduceUserEssayNumber(int userId) {
		iUserDao.reduceEssayNumber(userId);
	}

	public void increaseUserWordsNumber(int userId, int difference) {
		iUserDao.increaseWordsNumber(userId, difference);
	}

	public void reduceUserWordsNumber(int userId, int essayId, int difference) {
		if (difference < 0) {
			difference = 0 - difference;
			iUserDao.reduceWordsNumber(userId, difference);
		} else if (difference == 0) {
			Essay essay = essayService.getEssayById(essayId);
			difference = essay.getEssayWordNumber();
			iUserDao.reduceWordsNumber(userId, difference);
		}
	}

	public void increaseUserLikesNumber(int userId) {
		iUserDao.increaseLikesNumber(userId);
	}

	public void reduceUserLikesNumber(int userId) {
		iUserDao.reduceLikesNumber(userId);
	}

	public User getUserByUserEmail(String userEmail) {
		return iUserDao.queryByUserEmail(userEmail);
	}

	public User getUserByUserName(String userName) {
		return iUserDao.queryByUserName(userName);
	}

	public User getUserByUserId(int id) {
		return iUserDao.queryByUserId(id);
	}

	public List<User> getUserLikeKeyword(String keyword) {
		return iUserDao.queryLikeKeyword(keyword);
	}
}