package com.caitou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.caitou.bean.KMap;

/**
 * 对KMap表进行操作的Dao层
 * 
 * @author caitou
 *
 */
@Repository
public interface IKMapDao {

	// 添加知识地图
	int insertKMap(KMap kMap);

	// 删除知识地图
	int deleteKMap(@Param("id") int id);

	// 通过id修改知识地图
	int updateKMapDataById(@Param("id") int id,
			@Param("kmapData") String kmapData,
			@Param("kmapFormat") String kmapFormat);

	// 通过id修改知识地图基本设置
	int updateKMapBasicSettingById(@Param("id") int id,
			@Param("kmapName") String kmapName,
			@Param("kmapDescribe") String kmapDescribe);

	// 通过id增加知识地图喜欢数
	int increaseKMapLikeNumberById(@Param("id") int id);

	// 通过id减少知识地图喜欢数
	int reduceKMapLikeNumberById(@Param("id") int id);

	// 通过id增加指示地图浏览数
	int increaseKMapLookNumberById(@Param("id") int id);

	// 通过用户id查询其下知识地图列表
	List<KMap> queryByUserId(@Param("userId") int userId);

	// 通过id查询该知识地图
	KMap queryOneKMapById(@Param("id") int id);
}
