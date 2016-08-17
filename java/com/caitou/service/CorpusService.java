package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Corpus;
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

	public void updateCorpusById(String corpusId, String newCorpusName) {
		Corpus corpus = new Corpus();
		corpus.setId(Integer.valueOf(corpusId));
		corpus.setCorpusName(newCorpusName);
		iCorpusDao.updateById(corpus);
	}

	public List<Corpus> selectCorpusByUserName(String userName) {
		List<Corpus> corpusList = iCorpusDao.selectByUserName(userName);
		return corpusList;
	}

	public Corpus selectCorpusById(String id) {
		Corpus corpus = iCorpusDao.selectById(Integer.valueOf(id));
		return corpus;
	}

	public List<Corpus> selectCorpusLikeKeyword(String keyword) {
		List<Corpus> corpusList = iCorpusDao.selectLikeKeyword(keyword);
		return corpusList;
	}
}
