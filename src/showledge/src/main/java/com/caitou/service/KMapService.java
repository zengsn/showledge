package com.caitou.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.caitou.bean.KMap;
import com.caitou.bean.KmapKeyWord;
import com.caitou.bean.User;
import com.caitou.dao.IKMapDao;
import com.caitou.dao.IUserDao;
import com.caitou.dao.KmapKeyWordDao;
import com.caitou.threadlocal.UserThreadLocal;
import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class KMapService {

	@Resource
	IKMapDao ikMapDao;

	@Autowired
	private IUserDao userDao;
	
	@Autowired
	private KmapKeyWordDao keyWordDao;
	
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

	public PageInfo<KMap> getKMapByUserId(int userId) {
		
		PageHelper.startPage(1, 10);
		List<KMap> queryByUserId = ikMapDao.queryByUserId(userId);
		PageInfo<KMap> info = new PageInfo<>(queryByUserId);
		
		formatKMapList(info.getList());
		
		return info;
	}

	private void formatKMapList(List<KMap> list) {
		for (KMap kMap : list) {
			formatKMap(kMap);
		}
	}

	public KMap getOneKMapById(int id) {
		
		KMap queryOneKMapById = ikMapDao.queryOneKMapById(id);

		formatKMap(queryOneKMapById);
		
		return queryOneKMapById;
	}

	
	private void formatKMap(KMap queryOneKMapById) {

		//计算出标签
		Example example = new Example(KmapKeyWord.class);
		example.createCriteria().andEqualTo("kmapId", queryOneKMapById.getId());
		List<KmapKeyWord> selectByExample = keyWordDao.selectByExample(example);
		queryOneKMapById.setKeyWordList(selectByExample);
		
		User selectByPrimaryKey = userDao.selectByPrimaryKey(queryOneKMapById.getUserId());
		queryOneKMapById.setUser(selectByPrimaryKey);
		
	}

	/**
	 * 获取热门脑图
	 * 
	 * @return
	 */
	public PageInfo<KMap> getHotKMap() {
		
		PageHelper.startPage(1, 6);
		List<KMap> list = ikMapDao.getHotKMap();
		PageInfo<KMap> kPage = new PageInfo<>(list);
		formatKMapList(kPage.getList());
		
		return kPage;
	}

	/**
	 * 
	 * @return
	 */
	public PageInfo<KMap> getFollowKMap() {
		PageHelper.startPage(1, 6);
		
		List<KMap> list = ikMapDao.getFollowKMap(UserThreadLocal.getUser().getId());

		PageInfo<KMap> kMapPage = new PageInfo<>(list);
		
		//格式化一下
		formatKMapList(kMapPage.getList());
		
		return kMapPage;
	}
}
























