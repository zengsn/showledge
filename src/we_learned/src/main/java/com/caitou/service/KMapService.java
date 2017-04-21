package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.KMap;
import com.caitou.dao.IKMapDao;

@Service
public class KMapService {

	@Resource
	IKMapDao ikMapDao;

	public int insertKMap(int userId, String kmapName, String kmapFormat,
			String kmapData, String kmapDescribe) {
		KMap kMap = new KMap();
		kMap.setUserId(userId);
		kMap.setKmapName(kmapName);
		kMap.setKmapFormat(kmapFormat);
		kMap.setKmapData(kmapData);
		kMap.setKmapDescribe(kmapDescribe);
		ikMapDao.insertKMap(kMap);
		return kMap.getId();
	}

	public void deleteKMap(int id) {
		ikMapDao.deleteKMap(id);
	}

	public void updateKMapDataById(int id, String kmapData, String kmapFormat) {
		ikMapDao.updateKMapDataById(id, kmapData, kmapFormat);
	}

	public void updateKMapBasicSettingById(int id, String kmapName,
			String kmapDescribe) {
		ikMapDao.updateKMapBasicSettingById(id, kmapName, kmapDescribe);
	}

	public void increaseKMapLikeNumberById(int id) {
		ikMapDao.increaseKMapLikeNumberById(id);
	}

	public void reduceKMapLikeNumberById(int id) {
		ikMapDao.reduceKMapLikeNumberById(id);
	}

	public void increaseKMapLookNumberById(int id) {
		ikMapDao.increaseKMapLookNumberById(id);
	}

	public List<KMap> getKMapByUserId(int userId) {
		return ikMapDao.queryByUserId(userId);
	}

	public KMap getOneKMapById(int id) {
		return ikMapDao.queryOneKMapById(id);
	}
}
