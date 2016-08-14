package com.caitou.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.common.CountUtil;
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

	CountUtil myTool;

	public void insertEssay(String corpusId, String userName) {
		User user = new User();
		user.setUserName(userName);
		user = iUserDao.selectByUserName(user);
		Essay essay = new Essay();
		essay.setUserId(user.getId());
		essay.setUserName(userName);
		essay.setEssayTitle("无标题随记");
		essay.setCorpusId(Integer.valueOf(corpusId));
		iEssayDao.insertEssay(essay);
	}

	public void updateEssay(Essay essay) {
		Date date = new Date();
		Timestamp currentTime = new Timestamp(date.getTime());
		essay.setEssayTime(currentTime);
		iEssayDao.updateEssayById(essay);
	}

	public List<Essay> selectEssayLimit(String limitNumber) {
		int intLimitNumber = Integer.valueOf(limitNumber);
		if (intLimitNumber == 0) {
			intLimitNumber = 5;
		} else {
			intLimitNumber = intLimitNumber + 5;
		}
		List<Essay> essayList = iEssayDao.selectEssayLimit(intLimitNumber);
		return essayList;
	}

	public Essay selectEssayById(String id) {
		Essay essay = iEssayDao.selectEssayById(id);
		return essay;
	}

	public List<Essay> selectEssayByCorpusId(String corpusId) {
		Essay essay = new Essay();
		essay.setCorpusId(Integer.valueOf(corpusId));
		List<Essay> essayList = iEssayDao.selectEssayByCorpusId(essay);
		return essayList;
	}

	public List<Essay> selectEssayTitleLikeKeyword(String keyword) {
		List<Essay> essayList = iEssayDao.selectEssayTitleLikeKeyword(keyword);
		return essayList;
	}

	public List<Essay> selectEssayByTitle(String essayTitle) {
		List<Essay> essayList = iEssayDao.selectEssayByTitle(essayTitle);
		return essayList;
	}

	public void deleteEssayById(String essayId) {
		Essay essay = new Essay();
		essay.setId(Integer.valueOf(essayId));
		iEssayDao.deleteEssayById(essay);
	}

	public void deleteEssayByCorpusId(String corpusId) {
		Essay essay = new Essay();
		essay.setCorpusId(Integer.valueOf(corpusId));
		iEssayDao.deleteEssayByCorpusId(essay);
	}
}
