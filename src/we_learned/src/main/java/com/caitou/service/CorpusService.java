package com.caitou.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.dao.ICorpusDao;
import com.caitou.dto.PageParam;

@Service
public class CorpusService {

	@Resource
	ICorpusDao iCorpusDao;

	@Resource
	EssayService essayService;

	@Resource
	UserService userService;

	public void insertCorpus(int userId, String corpusName) {
		iCorpusDao.insertCorpus(userId, corpusName);
	}

	public void deleteCorpusById(int corpusId) {
		List<Essay> essayList = essayService.getEssayByCorpusId(corpusId);
		for (Essay essay : essayList) {
			essayService.deleteEssayById(essay.getId());
		}
		iCorpusDao.deleteById(corpusId);
	};

	public void increaseEssayNumberById(int corpusId) {
		iCorpusDao.increaseEssayNumber(Integer.valueOf(corpusId));
	};

	public void reduceEssayNumberById(int corpusId) {
		iCorpusDao.reduceEssayNumber(Integer.valueOf(corpusId));
	};

	public void increaseEssayWordNumber(int corpusId, int difference) {
		iCorpusDao.increaseEssayWordNumber(corpusId, difference);
	};

	public void reduceEssayWordNumber(int corpusId, int essayId, int difference) {
		if (difference < 0) {
			difference = 0 - difference;
			iCorpusDao.reduceEssayWordNumber(corpusId, difference);
		} else if (difference == 0) {
			Essay essay = essayService.getEssayById(essayId);
			iCorpusDao.reduceEssayWordNumber(corpusId,
					essay.getEssayWordNumber());
		}
	};

	public void increaseUserFocusNumberById(int corpusId) {
		iCorpusDao.increaseUserFocusNumber(corpusId);
	};

	public void reduceUserFocusNumberById(int corpusId) {
		iCorpusDao.reduceUserFocusNumber(corpusId);
	};

	public void updateCorpusById(int corpusId, String newCorpusName) {
		iCorpusDao.updateCorpusName(corpusId, newCorpusName);
	}

	public List<Corpus> getCorpusByUserId(int userId) {
		return iCorpusDao.queryByUserId(userId);
	}

	public Corpus getCorpusById(int id) {
		return iCorpusDao.queryById(id);
	}

	public int getRowCountLikeKeyword(String keyword) {
		return iCorpusDao.getRowCountLikeKeyword(keyword);
	}

	public PageParam<List<Corpus>> getCorpusLikeKeyword(
			PageParam<List<Corpus>> pageParam, String searchKeyword) {
		int offset = (pageParam.getCurrentPage() - 1) * PageParam.getPageSize();
		int size = PageParam.getPageSize();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", searchKeyword);
		map.put("offset", offset);
		map.put("size", size);
		List<Corpus> corpusList = iCorpusDao.queryLikeKeyword(map);
		for (Corpus corpus : corpusList) {
			String userName = userService.getUserByUserId(corpus.getUserId())
					.getUserName();
			corpus.setUserName(userName);
		}
		pageParam.setData(corpusList);
		return pageParam;
	}
}
