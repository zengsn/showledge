package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Essay;
import com.caitou.bean.Famous;
import com.caitou.dao.IFamousDao;

@Service
public class FamousService {

	@Resource
	IFamousDao iFamousDao;

	public void toBeFamous(Essay essay, int essayWordNumber) {
		int grade = essayWordNumber / 10 + essay.getEssayCommentNumber()
				+ essay.getEssayGoodNumber() + essay.getEssayReadingNumber();
		if (essay.getIsHot() == 0) {
			iFamousDao.insertFamous(essay.getId(), grade);
		} else {
			iFamousDao.updateGradeByEssayId(essay.getId(), grade);
		}
	};

	public void updateGradeByEssayId(int essayId, int grade) {
		iFamousDao.updateGradeByEssayId(essayId, grade);
	}

	public List<Famous> getAllFamous() {
		return iFamousDao.queryAllFamous();
	}
}
