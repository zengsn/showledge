package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.FocusCorpus;
import com.caitou.dao.IFocusCorpusDao;

@Service
public class FocusCorpusService {

	@Resource
	IFocusCorpusDao iFocusCorpusDao;

	public void insertFocusCorpus(int corpusId, int userId) {
		iFocusCorpusDao.insertFocusCorpus(corpusId, userId);
	}

	public void deleteFocusCorpus(int corpusId, int userId) {
		iFocusCorpusDao.deleteFocusCorpus(corpusId, userId);
	}

	public List<Integer> getCorpusIdByUserId(int userId) {
		return iFocusCorpusDao.queryCorpusIdByUserId(userId);
	}

	public List<Integer> getUserIdByCorpusId(int corpusId) {
		return iFocusCorpusDao.queryUserIdByCorpusId(corpusId);
	}

	public Boolean isFocusCorpused(int corpusId, int userId) {
		FocusCorpus focusCorpus = iFocusCorpusDao.queryOneCorpus(corpusId,
				userId);
		if (focusCorpus != null) {
			return true;
		} else {
			return false;
		}
	}
}
