package com.caitou.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.common.MyTool;
import com.caitou.dao.IEssayDao;
import com.caitou.dao.IUserDao;
import com.caitou.entity.Essay;
import com.caitou.entity.User;

@Service
public class EssayService {

	@Resource
	IEssayDao iEssayDao;

	@Resource
	IUserDao iUserDao;

	MyTool myTool;

	public void insertEssay(Essay essay, String userName) {
		User user = new User();
		user.setUserName(userName);
		user = iUserDao.selectByUserName(user);
		essay.setUserId(user.getId());
		essay.setUserName(userName);
		Date date = new Date();
		Timestamp currentTime = new Timestamp(date.getTime());
		essay.setEssayTime(currentTime);
		essay.setEssayWordNumber(myTool.countWordNumber(essay.getEssayContent()));
		iEssayDao.insertEssay(essay);
	}

	public List<Essay> selectAllEssay() {
		List<Essay> essayList = iEssayDao.selectAllEssay();
		return essayList;
	}

	public Essay selectEssayById(String id) {
		Essay essay = iEssayDao.selectEssayById(id);
		return essay;
	}
}
