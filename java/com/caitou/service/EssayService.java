package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.common.HtmlUtil;
import com.caitou.dao.IEssayDao;
import com.caitou.dao.IUserDao;

@Service
public class EssayService {

	@Resource
	IEssayDao iEssayDao;

	@Resource
	IUserDao iUserDao;

	public void insertEssay(String corpusId, String userName) {
		User user = iUserDao.selectByUserName(userName);
		Essay essay = new Essay();
		essay.setUserId(user.getId());
		essay.setUserName(userName);
		essay.setEssayTitle("无标题随记");
		essay.setCorpusId(Integer.valueOf(corpusId));
		iEssayDao.insertEssay(essay);
	}

	public void deleteEssayById(String id) {
		iEssayDao.deleteById(Integer.valueOf(id));
	}

	public void deleteEssayByCorpusId(String corpusId) {
		iEssayDao.deleteByCorpusId(Integer.valueOf(corpusId));
	}

	public void updateEssay(String id, String essayTitle, String essayContent) {
		Essay essay = new Essay();
		essay.setId(Integer.valueOf(id));
		essay.setEssayTitle(essayTitle);
		essay.setEssayContent(essayContent);
		essay.setEssayTime(CountUtil.getTime());
		essayContent = HtmlUtil.getTextFromTHML(essayContent);
		essay.setEssayWordNumber(CountUtil.countWordNumber(essayContent));
		iEssayDao.updateById(essay);
	}

	public void updateCommentNumberById(String id, int essayCommentNumber) {
		Essay essay = new Essay();
		essay.setId(Integer.valueOf(id));
		essay.setEssayCommentNumber(essayCommentNumber);
		iEssayDao.updateCommentNumberById(essay);
	}

	public Essay selectEssayById(String id) {
		Essay essay = iEssayDao.selectById(id);
		return essay;
	}

	public List<Essay> selectEssayLimit(String limitNumber) {
		int intLimitNumber = Integer.valueOf(limitNumber);
		if (intLimitNumber == 0) {
			intLimitNumber = 5;
		} else {
			intLimitNumber = intLimitNumber + 5;
		}
		List<Essay> essayList = iEssayDao.selectLimit(intLimitNumber);
		return essayList;
	}

	public List<Essay> selectEssayByCorpusId(String corpusId) {
		List<Essay> essayList = iEssayDao.selectByCorpusId(Integer
				.valueOf(corpusId));
		return essayList;
	}

	public List<Essay> selectEssayByTitle(String essayTitle) {
		List<Essay> essayList = iEssayDao.selectByTitle(essayTitle);
		return essayList;
	}

	public List<Essay> selectEssayTitleLikeKeyword(String keyword) {
		List<Essay> essayList = iEssayDao.selectTitleLikeKeyword(keyword);
		return essayList;
	}

	public List<Essay> selectByUserNameOrderByTime(String userName) {
		List<Essay> essayList = iEssayDao.selectByUserNameOrderByTime(userName);
		return essayList;
	}
}
