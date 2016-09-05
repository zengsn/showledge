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

	public void updateUserEmail(String oldUserEmail, String newUserEmail) {
		User user = iUserDao.selectByUserEmail(oldUserEmail);
		user.setUserEmail(newUserEmail);
		iUserDao.updateUserEmail(user);
	}

	public void updateUserIntroduce(String userName, String userIntroduce) {
		User user = new User();
		user.setUserName(userName);
		user.setUserIntroduce(userIntroduce);
		iUserDao.updateUserIntroduce(user);
	}

	public void addUserFocusUserNumber(String userName) {
		User user = new User();
		user = iUserDao.selectByUserName(userName);
		user.setUserFocusUserNumber(user.getUserFocusUserNumber() + 1);
		iUserDao.updateUserFocusUserNumber(user);
	}

	public void subUserFocusUserNumber(String userName) {
		User user = new User();
		user = iUserDao.selectByUserName(userName);
		int userFocusUserNumber = user.getUserFocusUserNumber() - 1;
		if (userFocusUserNumber > 0) {
			user.setUserFocusUserNumber(userFocusUserNumber);
		} else {
			user.setUserFocusUserNumber(0);
		}
		iUserDao.updateUserFocusUserNumber(user);
	}

	public void addUserFocusCorpusNumber(String userName) {
		User user = new User();
		user = iUserDao.selectByUserName(userName);
		user.setUserFocusCorpusNumber(user.getUserFocusCorpusNumber() + 1);
		iUserDao.updateUserFocusCorpusNumber(user);
	}

	public void subUserFocusCorpusNumber(String userName) {
		User user = new User();
		user = iUserDao.selectByUserName(userName);
		int userFocusCorpusNumber = user.getUserFocusCorpusNumber() - 1;
		if (userFocusCorpusNumber > 0) {
			user.setUserFocusCorpusNumber(userFocusCorpusNumber);
		} else {
			user.setUserFocusCorpusNumber(0);
		}
		iUserDao.updateUserFocusCorpusNumber(user);
	}

	public void addUserFansNumber(String userId) {
		User user = new User();
		user = iUserDao.selectByUserId(Integer.valueOf(userId));
		user.setUserFansNumber(user.getUserFansNumber() + 1);
		iUserDao.updateUserFansNumber(user);
	}

	public void subUserFansNumber(String userId) {
		User user = new User();
		user = iUserDao.selectByUserId(Integer.valueOf(userId));
		int userFansNumber = user.getUserFansNumber() - 1;
		if (userFansNumber <= 0) {
			user.setUserFansNumber(0);
		} else {
			user.setUserFansNumber(userFansNumber);
		}
		iUserDao.updateUserFansNumber(user);
	}

	public void addUserEssayNumber(String userName) {
		User user = new User();
		user = iUserDao.selectByUserName(userName);
		user.setUserEssayNumber(user.getUserEssayNumber() + 1);
		iUserDao.updateUserEssayNumber(user);
	}

	public void subUserEssayNumber(String userName) {
		User user = new User();
		user = iUserDao.selectByUserName(userName);
		int userEssayNumber = user.getUserEssayNumber() - 1;
		if (userEssayNumber <= 0) {
			user.setUserEssayNumber(0);
		} else {
			user.setUserEssayNumber(userEssayNumber);
		}
		iUserDao.updateUserEssayNumber(user);
	}

	public void updateUserWordsNumber(String userName, int subUserWordsNumber) {
		User user = new User();
		user = iUserDao.selectByUserName(userName);
		int userWordsNumber = user.getUserWordsNumber() + subUserWordsNumber;
		user.setUserWordsNumber(userWordsNumber);
		iUserDao.updateUserWordsNumber(user);
	}

	public void subUserWordsNumber(String userName, String essayId) {
		User user = new User();
		user = iUserDao.selectByUserName(userName);
		Essay essay = essayService.selectEssayById(essayId);
		int userWordsNumber = user.getUserWordsNumber()
				- essay.getEssayWordNumber();
		if (userWordsNumber <= 0) {
			user.setUserWordsNumber(0);
		} else {
			user.setUserWordsNumber(userWordsNumber);
		}
		iUserDao.updateUserWordsNumber(user);
	}

	public void addUserLikesNumber(String userName) {
		User user = new User();
		user = iUserDao.selectByUserName(userName);
		user.setUserLikesNumber(user.getUserLikesNumber() + 1);
		iUserDao.updateUserLikesNumber(user);
	}

	public void subUserLikesNumber(String userName) {
		User user = new User();
		user = iUserDao.selectByUserName(userName);
		int userLikesNumber = user.getUserLikesNumber() - 1;
		if (userLikesNumber <= 0) {
			user.setUserLikesNumber(0);
		} else {
			user.setUserLikesNumber(userLikesNumber);
		}
		System.out.println(userLikesNumber);
		iUserDao.updateUserLikesNumber(user);
	}

	public User selectByUserId(int id) {
		return iUserDao.selectByUserId(id);
	}

	public List<User> selectUserLikeKeyword(String keyword) {
		List<User> userList = iUserDao.selectLikeKeyword(keyword);
		return userList;
	}
}
