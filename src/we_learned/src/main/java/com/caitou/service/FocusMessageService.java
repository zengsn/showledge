package com.caitou.service;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.FocusMessage;
import com.caitou.common.CountUtil;
import com.caitou.dao.IFocusMessageDao;

@Service
public class FocusMessageService {

	@Resource
	IFocusMessageDao iFocusMessageDao;

	public void insertFocusUserEssayMessage(int focusUserId, int userId,
			String userName, int essayId, Timestamp updateTime) {
		FocusMessage focusMessage = new FocusMessage();
		focusMessage.setFocusUserId(focusUserId);
		focusMessage.setUserId(userId);
		focusMessage.setUserName(userName);
		focusMessage.setEssayId(essayId);
		focusMessage.setUpdateTime(updateTime);
		iFocusMessageDao.insertFocusUserEssayMessage(focusMessage);
	}

	public void insertFocusCorpusMessage(int focusUserId, int corpusId,
			String corpusName, int essayId, String essayTitle,
			Timestamp updateTime) {
		FocusMessage focusMessage = new FocusMessage();
		focusMessage.setFocusUserId(focusUserId);
		focusMessage.setCorpusId(corpusId);
		focusMessage.setCorpusName(corpusName);
		focusMessage.setEssayId(essayId);
		focusMessage.setEssayTitle(essayTitle);
		focusMessage.setUpdateTime(updateTime);
		iFocusMessageDao.insertFocusCorpusMessage(focusMessage);
	}

	public void insertFocusUserKmapMessage(int focusUserId, int userId,
			String userName, int kmapId, Timestamp updateTime) {
		FocusMessage focusMessage = new FocusMessage();
		focusMessage.setFocusUserId(focusUserId);
		focusMessage.setUserId(userId);
		focusMessage.setUserName(userName);
		focusMessage.setKmapId(kmapId);
		focusMessage.setUpdateTime(updateTime);
		iFocusMessageDao.insertFocusUserEssayMessage(focusMessage);
	}

	public void setIsRead(int id) {
		iFocusMessageDao.setIsRead(id);
	}

	public int getRowCountIsNotRead(int focusUserId) {
		return iFocusMessageDao.getRowCountIsNotRead(focusUserId);
	}

	public List<FocusMessage> getFocusMessage(int focusUserId) {
		List<FocusMessage> focusMessageList = iFocusMessageDao
				.queryFocusMessage(focusUserId);
		if (null == focusMessageList || focusMessageList.isEmpty()) {
			return null;
		} else {
			for (int i = 0; i < focusMessageList.size(); i++) {
				FocusMessage focusMessage = focusMessageList.get(i);
				Timestamp startTimestamp = focusMessage.getUpdateTime();
				if (startTimestamp != null) {
					String subUpdateTime = CountUtil
							.getTimeByNow(startTimestamp);
					focusMessage.setSubUpdateTime(subUpdateTime);
				} else {
					focusMessage.setSubUpdateTime("未知时间");
				}
			}
			return focusMessageList;
		}
	}
}
