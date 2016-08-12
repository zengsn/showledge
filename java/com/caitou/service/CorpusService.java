package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.dao.ICorpusDao;
import com.caitou.entity.Corpus;

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

	public List<Corpus> selectCorpusByUserName(String userName) {
		Corpus corpus = new Corpus();
		corpus.setUserName(userName);
		List<Corpus> corpusList = iCorpusDao.selectCorpusByUserName(corpus);
		return corpusList;
	}

	public void deleteCorpusById(String corpusId) {
		Corpus corpus = new Corpus();
		corpus.setId(Integer.valueOf(corpusId));
		iCorpusDao.deleteCorpusById(corpus);
		essayService.deleteEssayByCorpusId(corpusId);
	};

	public void updateCorpusById(String corpusId, String newCorpusName) {
		Corpus corpus = new Corpus();
		corpus.setId(Integer.valueOf(corpusId));
		corpus.setCorpusName(newCorpusName);
		iCorpusDao.updateCorpusById(corpus);
	}
}
