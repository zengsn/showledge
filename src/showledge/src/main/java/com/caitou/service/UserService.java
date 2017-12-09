package com.caitou.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.caitou.bean.Collect;
import com.caitou.bean.Dynamic;
import com.caitou.bean.Essay;
import com.caitou.bean.FocusKmap;
import com.caitou.bean.FocusUser;
import com.caitou.bean.KMap;
import com.caitou.bean.User;
import com.caitou.bean.UserInfo;
import com.caitou.common.CountUtil;
import com.caitou.dao.DynamicDao;
import com.caitou.dao.ICollectDao;
import com.caitou.dao.IEssayDao;
import com.caitou.dao.IFocusCorpusDao;
import com.caitou.dao.IFocusKmapDao;
import com.caitou.dao.IFocusUserDao;
import com.caitou.dao.IKMapDao;
import com.caitou.dao.IUserDao;
import com.caitou.dao.UserInfoDao;
import com.caitou.dto.PageParam;
import com.caitou.threadlocal.UserThreadLocal;
import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserService {

	@Resource
	IUserDao iUserDao;

	@Resource
	EssayService essayService;

	@Autowired
	private IEssayDao essayDao; 
	
	@Autowired
	private UserInfoDao userInfoDao;
	
	@Autowired
	private DynamicDao dynamicDao;
	
	@Autowired
	private IFocusCorpusDao focusCorpusDao; 
	
	/*@Autowired
	private IFocusUserDao focusUserDao;
	*/
	public int insertUser(String userEmail, String userName,
			String userPassword, Timestamp userCreateTime) {
		User user = new User();
		user.setUserEmail(userEmail);
		user.setUserName(userName);
		user.setUserPassword(userPassword);
		user.setUserCreateTime(userCreateTime);
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

	public void updateUserPhone(int userId, String userPhone) {
		iUserDao.updateUserPhone(userId, userPhone);
	}

	public void updateUserWeb(int userId, String userWeb) {
		iUserDao.updateUserWeb(userId, userWeb);
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
		
		User user = iUserDao.queryByUserId(id);
		user.setUserFormatCreateTime(CountUtil.formatUserTimestampInTimeLine(user.getUserCreateTime()));
		user.setUserInfo(this.getUserInfo(user.getId()));
		
		return user;
	}

	public int getRowCountLikeKeyword(String keyword) {
		return iUserDao.getRowCountLikeKeyword(keyword);
	}

	public PageParam<List<User>> getUserLikeKeyword(
			PageParam<List<User>> pageParam, String searchKeyword) {
		int offset = (pageParam.getCurrentPage() - 1) * PageParam.getPageSize();
		int size = PageParam.getPageSize();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", searchKeyword);
		map.put("offset", offset);
		map.put("size", size);
		List<User> userList = iUserDao.queryLikeKeyword(map);
		
		if (UserThreadLocal.getUser() != null) {
			User userLocal = UserThreadLocal.getUser();
			
			for (User user : userList) {
				if (user.getId() == userLocal.getId()) {
					user.setIsFocused(true);
				}else{
					Example example = new Example(FocusUser.class);
					example.createCriteria().andEqualTo("userId", userLocal.getId()).andEqualTo("focusUserId", user.getId());
					int selectCountByExample = focusUserDao.selectCountByExample(example);
					user.setIsFocused(selectCountByExample == 1);
				}
			}
		}
		
		pageParam.setData(userList);
		return pageParam;
	}
	
	public List<User> getAllUser() {
		return iUserDao.queryAllUser();
	}

	/**
	 * 
	 * 
	 * @param se
	 */
	public void updateUserInfo(UserInfo se) {
		UserInfo selectByPrimaryKey = userInfoDao.selectByPrimaryKey(se.getId());
		if (selectByPrimaryKey == null) {
			userInfoDao.insert(se);
		}else{
			userInfoDao.updateByPrimaryKey(se);
		}
	}

	/**
	 * 获取用户信息
	 * 
	 * @param id
	 * @return
	 */
	public UserInfo getUserInfo(int id) {
		return userInfoDao.selectByPrimaryKey(id);
	}

	
	@Autowired
	private IKMapDao kMapDao;
	
	@Autowired
	private IFocusUserDao focusUserDao;
	
	@Autowired
	private IFocusKmapDao focusKmapDao; 
	
	@Autowired
	private ICollectDao collectDao;
	
	/**
	 * 查询用户,并更新数量相关的字段
	 * 
	 * @param userIdInSession
	 * @return
	 */
	@Transactional(readOnly=false)
	public User getUserAndCount(int userIdInSession) {
		User user = getUserByUserId(userIdInSession);
		/*User user = iUserDao.queryByUserId(userIdInSession);
		user.setUserFormatCreateTime(CountUtil.formatUserTimestampInTimeLine(user.getUserCreateTime()));
		user.setUserInfo(this.getUserInfo(user.getId()));
		*/
		
		//动态的数量
		Example example1 = new Example(Dynamic.class);
		example1.createCriteria().andEqualTo("userId", user.getId());
		int selectCountByExample2 = dynamicDao.selectCountByExample(example1);
		user.setUserDynNumber(selectCountByExample2);
		
		//笔记的数量
		Example example2 = new Example(Essay.class);
		example2.createCriteria().andEqualTo("userId", user.getId());
		int selectCountByExample = essayDao.selectCountByExample(example2);
		user.setUserEssayNumber(selectCountByExample);
		
		//地图的数量
		Example example3 = new Example(KMap.class);
		example3.createCriteria().andEqualTo("userId", user.getId());
		int selectCountByExample0 = kMapDao.selectCountByExample(example3);
		user.setUserKMapNumber(selectCountByExample0);
		
		//学习榜样的数量
		Example example4 = new Example(FocusUser.class);
		example4.createCriteria().andEqualTo("userId", user.getId());
		int selectCountByExample3 = focusUserDao.selectCountByExample(example4);
		user.setUserFocusUserNumber(selectCountByExample3);
		
		//关注的数量
		Example example5 = new Example(FocusUser.class);
		example5.createCriteria().andEqualTo("focusUserId", user.getId());
		int selectCountByExample4 = focusUserDao.selectCountByExample(example5);
		user.setUserFocusNumber(selectCountByExample4);
		
		//收藏的数量
		Example example6 = new Example(FocusKmap.class);
		example6.createCriteria().andEqualTo("userId", user.getId());
		int selectCountByExample6 = focusKmapDao.selectCountByExample(example6);
		Example example7 = new Example(Collect.class);
		example7.createCriteria().andEqualTo("userId", user.getId());
		int selectCountByExample7 = collectDao.selectCountByExample(example7);
		user.setUserCollectTotleNumber(selectCountByExample6 + selectCountByExample7);
		
		iUserDao.updateByPrimaryKey(user);
		return user;
	}

	/**
	 * 改变用户关注状态
	 * 
	 * @param userId
	 */
	public void changeFocusUser(Integer userId) {
		
		User user = UserThreadLocal.getUser();
		
		Example example = new Example(FocusUser.class);
		example.createCriteria().andEqualTo("focusUserId", userId).andEqualTo("userId", user.getId());
		int selectCountByExample = focusUserDao.selectCountByExample(example);
		
		//已经关注了
		if (selectCountByExample == 1) {
			//取消关注
			focusUserDao.deleteByExample(example);
		}else{
			//关注
			focusUserDao.insert(new FocusUser(userId,user.getId()));
		}
		
	}

	/**
	 * 获取我的学习榜样列表
	 * @param i 
	 * 
	 * @return
	 */
	public PageInfo<User> getBanYan(int i) {
		PageHelper.startPage(1, 6);
		List<User> banYan = iUserDao.getBanYan(i);
		return new PageInfo(banYan);
	}
	
	/**
	 * 获取我的学习榜样列表
	 * @param i 
	 * 
	 * @return
	 */
	public PageInfo<User> getFollowMe(int i) {
		PageHelper.startPage(1, 6);
		List<User> followMe = iUserDao.getFollowMe(i);
		PageInfo<User> pageInfo = new PageInfo<User>(followMe);
		
		List<User> list = pageInfo.getList();
		for (User user : list) {
			if (user.getId() == UserThreadLocal.getUser().getId()) {
				user.setIsFocused(true);
				continue;
			}
			
			Example example = new Example(FocusUser.class);
			example.createCriteria().andEqualTo("userId", UserThreadLocal.getUser().getId()).andEqualTo("focusUserId", user.getId());
			int selectCountByExample = focusUserDao.selectCountByExample(example);
			if (selectCountByExample == 1) {
				user.setIsFocused(true);
			}else{
				user.setIsFocused(false);
			}
		}
		
		return pageInfo;
	}

	/**
	 * 
	 * 
	 * @param id
	 * @return
	 */
	public PageInfo<User> getRecUser(int id) {
		PageHelper.startPage(1,3);
		List<User> list = iUserDao.getRecUser(id);
		PageInfo<User> userPage = new PageInfo<>(list);
		
		for (User user2 : userPage.getList()) {
			//关注我的数量
			Example example5 = new Example(FocusUser.class);
			example5.createCriteria().andEqualTo("focusUserId", user2.getId());
			int selectCountByExample4 = focusUserDao.selectCountByExample(example5);
			user2.setUserFocusNumber(selectCountByExample4);
		}
		
		return userPage;
	}

	/**
	 * 
	 * 
	 * @return
	 */
	public PageInfo<User> getRecUser() {
		
		
		
		return null;
	}
	
}




































