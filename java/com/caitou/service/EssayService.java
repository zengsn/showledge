package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.common.CheckUtil;
import com.caitou.common.CountUtil;
import com.caitou.common.HtmlUtil;
import com.caitou.dao.IEssayDao;

@Service
public class EssayService {

	@Resource
	IEssayDao iEssayDao;

	@Resource
	UserService userService;

	@Resource
	CorpusService corpusService;

	@Resource
	FamousService famousService;

	@Resource
	TimelineService timelineService;

	public void insertEssay(int corpusId, String userName) {
		User user = userService.getUserByUserName(userName);
		Essay essay = new Essay();
		essay.setUserId(user.getId());
		essay.setUserName(userName);
		essay.setEssayTitle("记下idea,保准丢不了~");
		essay.setCorpusId(corpusId);
		essay.setEssayContent("<p>建议编写一篇内容有益并稍长的随记，这样会更有助于您进入热搜哦 (*^__^*)</p>");
		iEssayDao.insertEssay(essay);
		timelineService.insertTimeline(user.getId(), essay.getId(),
				CountUtil.getTime());
	}

	public void deleteEssayById(int id) {
		timelineService.deleteByEssayId(id);
		iEssayDao.deleteById(id);
	}

	public void deleteEssayByCorpusId(int corpusId) {
		iEssayDao.deleteByCorpusId(corpusId);
	}

	public void updateEssay(int userId, int essayId, String essayTitle,
			String essayContent) {
		Essay essay = new Essay();
		essay.setId(essayId);
		essay.setEssayTitle(essayTitle);
		essay.setEssayContent(essayContent);
		essay.setEssayTime(CountUtil.getTime());
		essayContent = HtmlUtil.getTextFromTHML(essayContent);
		int essayWordNumber = CountUtil.countWordNumber(essayContent);
		Essay essay2 = iEssayDao.queryById(essayId);
		int difference = essayWordNumber - essay2.getEssayWordNumber();
		essay.setEssayWordNumber(essayWordNumber);

		if (difference > 0) {
			userService.increaseUserWordsNumber(userId, difference);
			corpusService.increaseEssayWordNumber(essay2.getCorpusId(),
					difference);
		} else if (difference < 0) {
			userService.reduceUserWordsNumber(userId, essayId, difference);
			corpusService.reduceEssayWordNumber(essay2.getCorpusId(), essayId,
					difference);
		}

		if (essayWordNumber > 60) {
			if (essayWordNumber > 1500) {
				essay.setIsHot(1);
				famousService.toBeFamous(essay2, essayWordNumber);
			} else {
				boolean result = CheckUtil.checkEssayIsValuable(essayContent,
						essayWordNumber);
				if (result) {
					essay.setIsHot(1);
					famousService.toBeFamous(essay2, essayWordNumber);
				}
			}
		}

		iEssayDao.updateEssay(essay);
	}

	public void increaseCommentNumberById(int id) {
		iEssayDao.increaseEssayCommentNumber(id);
	}

	public void reduceCommentNumberById(int id) {
		iEssayDao.reduceEssayCommentNumber(id);
	}

	public void increaseReadingNumberById(int id) {
		iEssayDao.increaseEssayReadingNumber(id);
	}

	public void increaseGoodNumberById(int id) {
		iEssayDao.increaseEssayGoodNumber(id);
	}

	public void reduceGoodNumberById(int id) {
		iEssayDao.reduceEssayGoodNumber(id);
	}

	public Essay getEssayById(int id) {
		return iEssayDao.queryById(id);
	}

	public List<Essay> getEssayLimit(int limitNumber) {
		if (limitNumber == 0) {
			limitNumber = 5;
		} else {
			limitNumber = limitNumber + 5;
		}
		return iEssayDao.queryLimit(limitNumber);
	}

	public List<Essay> getEssayByCorpusId(int corpusId) {
		return iEssayDao.queryByCorpusId(corpusId);
	}

	public List<Essay> getEssayByTitle(String essayTitle) {
		return iEssayDao.queryByTitle(essayTitle);
	}

	public List<Essay> getEssayTitleLikeKeyword(String keyword) {
		return iEssayDao.queryTitleLikeKeyword(keyword);
	}

	public List<Essay> getEssayByUserIdOrderByTime(int userId) {
		return iEssayDao.queryByUserIdOrderByTime(userId);
	}
}
