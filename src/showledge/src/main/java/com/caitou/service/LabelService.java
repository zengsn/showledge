package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Label;
import com.caitou.dao.ILabelDao;

@Service
public class LabelService {

	@Resource
	ILabelDao iLabelDao;

	public int insertLabel(int userId, int essayId, String firstLabel,
			String secondLabel, String thirdLabel) {
		return iLabelDao.insertLabel(userId, essayId, firstLabel, secondLabel,
				thirdLabel);
	}

	public int deleteLabel(int essayId) {
		return iLabelDao.deleteLabel(essayId);
	}

	public int updateLabelByEssayId(int essayId, String firstLabel,
			String secondLabel, String thirdLabel) {
		return iLabelDao.updateLabelByEssayId(essayId, firstLabel, secondLabel,
				thirdLabel);
	}

	public List<Label> getLabelByUserId(int userId) {
		return iLabelDao.queryByUserId(userId);
	}

	public Label getLabelByEssayId(int essayId) {
		return iLabelDao.queryByEssayId(essayId);
	}

	public List<Label> getLabelByThirdLabel(int userId, String thirdLabel) {
		return iLabelDao.queryByThirdLabel(userId, thirdLabel);
	}
}
