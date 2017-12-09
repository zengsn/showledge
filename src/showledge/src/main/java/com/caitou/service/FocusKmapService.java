package com.caitou.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.KMap;
import com.caitou.dao.IFocusKmapDao;



@Service
public class FocusKmapService {

	@Resource
	IFocusKmapDao iFocusKmapDao;

	@Resource
	KMapService kMapService;

	public void insertFocusKmap(int userId, int kmapId) {
		iFocusKmapDao.insertFocusKmap(userId, kmapId);
	}

	public void deleteFocusKmap(int userId, int kmapId) {
		iFocusKmapDao.deleteFocusKmap(userId, kmapId);
	}

	public List<KMap> queryKmapByUserId(int userId) {
		List<Integer> intList = iFocusKmapDao.queryKmapIdByUserId(userId);
		List<KMap> kMapList = new ArrayList<KMap>();
		for (int i = 0; i < intList.size(); i++) {
			KMap kMap = kMapService.getOneKMapById(intList.get(i));
			kMapList.add(kMap);
		}
		return kMapList;
	}
}
