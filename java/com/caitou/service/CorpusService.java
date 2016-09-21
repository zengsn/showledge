package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.dao.ICorpusDao;

@Service
public class CorpusService {

	@Resource
	ICorpusDao iCorpusDao;

	@Resource
	EssayService essayService;

	public void insertCorpus(int userId, String corpusName) {
		iCorpusDao.insertCorpus(userId, corpusName);
	}

	public void deleteCorpusById(int corpusId) {
		iCorpusDao.deleteById(Integer.valueOf(corpusId));
		essayService.deleteEssayByCorpusId(corpusId);
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

	public List<Corpus> getCorpusLikeKeyword(String keyword) {
		return iCorpusDao.queryLikeKeyword(keyword);
	}
}
