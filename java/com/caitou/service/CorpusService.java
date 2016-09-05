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

	public void insertCorpus(String corpusName, String userName) {
		Corpus corpus = new Corpus();
		corpus.setCorpusName(corpusName);
		corpus.setUserName(userName);
		iCorpusDao.insertCorpus(corpus);
	}

	public void deleteCorpusById(String corpusId) {
		iCorpusDao.deleteById(Integer.valueOf(corpusId));
		essayService.deleteEssayByCorpusId(corpusId);
	};

	public void addEssayNumberById(String corpusId) {
		Corpus corpus = iCorpusDao.selectById(Integer.valueOf(corpusId));
		int essayNumber = corpus.getEssayNumber() + 1;
		corpus.setEssayNumber(essayNumber);
		iCorpusDao.updateEssayNumberById(corpus);
	};

	public void subEssayNumberById(String corpusId) {
		Corpus corpus = iCorpusDao.selectById(Integer.valueOf(corpusId));
		int essayNumber = corpus.getEssayNumber() - 1;
		if (essayNumber > 0) {
			corpus.setEssayNumber(essayNumber);
		} else {
			corpus.setEssayNumber(0);
		}
		iCorpusDao.updateEssayNumberById(corpus);
	};

	public void updateEssayWordNumberById(int corpusId, int subEssayWordNumber) {
		Corpus corpus = iCorpusDao.selectById(Integer.valueOf(corpusId));
		int essayWordNumber = corpus.getEssayWordNumber() + subEssayWordNumber;
		corpus.setEssayWordNumber(essayWordNumber);
		iCorpusDao.updateEssayWordNumberById(corpus);
	};

	public void subEssayWordNumberById(String corpusId, String essayId) {
		Corpus corpus = iCorpusDao.selectById(Integer.valueOf(corpusId));
		Essay essay = essayService.selectEssayById(essayId);
		int essayWordNumber = corpus.getEssayWordNumber()
				- essay.getEssayWordNumber();
		if (essayWordNumber > 0) {
			corpus.setEssayWordNumber(essayWordNumber);
		} else {
			corpus.setEssayWordNumber(0);
		}
		iCorpusDao.updateEssayWordNumberById(corpus);
	};

	public void addUserFocusNumberById(String corpusId) {
		Corpus corpus = iCorpusDao.selectById(Integer.valueOf(corpusId));
		int userFocusNumber = corpus.getUserFocusNumber() + 1;
		corpus.setUserFocusNumber(userFocusNumber);
		iCorpusDao.updateUserFocusNumberById(corpus);
	};

	public void subUserFocusNumberById(String corpusId) {
		Corpus corpus = iCorpusDao.selectById(Integer.valueOf(corpusId));
		int userFocusNumber = corpus.getUserFocusNumber() - 1;
		if (userFocusNumber > 0) {
			corpus.setUserFocusNumber(userFocusNumber);
		} else {
			corpus.setUserFocusNumber(0);
		}
		iCorpusDao.updateUserFocusNumberById(corpus);
	};

	public void updateCorpusById(String corpusId, String newCorpusName) {
		Corpus corpus = new Corpus();
		corpus.setId(Integer.valueOf(corpusId));
		corpus.setCorpusName(newCorpusName);
		iCorpusDao.updateCorpusNameById(corpus);
	}

	public List<Corpus> selectCorpusByUserName(String userName) {
		List<Corpus> corpusList = iCorpusDao.selectByUserName(userName);
		return corpusList;
	}

	public Corpus selectCorpusById(int id) {
		Corpus corpus = iCorpusDao.selectById(id);
		return corpus;
	}

	public List<Corpus> selectCorpusLikeKeyword(String keyword) {
		List<Corpus> corpusList = iCorpusDao.selectLikeKeyword(keyword);
		return corpusList;
	}
}
