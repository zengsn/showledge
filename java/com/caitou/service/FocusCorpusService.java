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

	public void insertFocusCorpus(String corpusId, String userName) {
		FocusCorpus focusCorpus = new FocusCorpus();
		focusCorpus.setCorpusId(Integer.valueOf(corpusId));
		focusCorpus.setUserName(userName);
		iFocusCorpusDao.insertFocusCorpus(focusCorpus);
	}

	public void deleteFocusCorpus(String corpusId, String userName) {
		FocusCorpus focusCorpus = new FocusCorpus();
		focusCorpus.setCorpusId(Integer.valueOf(corpusId));
		focusCorpus.setUserName(userName);
		iFocusCorpusDao.deleteFocusCorpus(focusCorpus);
	}

	public List<Integer> selectCorpusIdByUserName(String userName) {
		return iFocusCorpusDao.selectCorpusIdByUserName(userName);
	}

	public List<String> selectUserNameByCorpusId(int corpusId) {
		return iFocusCorpusDao.selectUserNameByCorpusId(corpusId);
	}

	public Boolean isFocusCorpused(int corpusId, String userName) {
		FocusCorpus focusCorpus = new FocusCorpus();
		focusCorpus.setCorpusId(Integer.valueOf(corpusId));
		focusCorpus.setUserName(userName);
		FocusCorpus focusCorpus2 = iFocusCorpusDao.selectOneCorpus(focusCorpus);
		if (focusCorpus2 != null) {
			return true;
		} else {
			return false;
		}
	}
}
