package com.caitou.service.inter;

import java.util.List;

import com.caitou.bean.DynEssay;
import com.caitou.bean.Dynamic;
import com.caitou.service.base.BaseService;
import com.github.pagehelper.PageInfo;



public interface DynamicService extends BaseService<Dynamic> {

	/**
	 * 获取热门动态
	 * 
	 * @return
	 */
	PageInfo<Dynamic> getHotDyn();

	/**
	 * 发布动态
	 * 
	 * @param content
	 * @param emotion
	 * @param xx
	 * @param notesId
	 */
	void publishDyn(String content, String emotion, String xx, String notesId);

	/**
	 * 获取我关注的人的动态
	 * @return
	 */
	List<Dynamic> getFollowDyn();

	/**
	 * 根据用户id获取动态
	 * 
	 * @param id
	 * @return
	 */
	PageInfo<Dynamic> getDynById(int id);

	/**
	 * 删除一个动态
	 * 
	 * @param dynId
	 */
	void deleteDyn(Integer dynId);
	

}



















