package com.caitou.service.inter.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
//import java.util.PrimitiveIterator.OfDouble;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.caitou.bean.DynData;
import com.caitou.bean.DynEssay;
import com.caitou.bean.Dynamic;
import com.caitou.bean.Essay;
import com.caitou.bean.Famous;
import com.caitou.bean.FamoustDyn;
import com.caitou.bean.FocusUser;
import com.caitou.bean.User;
import com.caitou.bean.UserInfo;
import com.caitou.common.CountUtil;
import com.caitou.dao.DynDataDao;
import com.caitou.dao.DynEssayDao;
import com.caitou.dao.FamoustDynDao;
import com.caitou.dao.IEssayDao;
import com.caitou.dao.IFocusUserDao;
import com.caitou.dao.IUserDao;
import com.caitou.dao.UserInfoDao;
import com.caitou.service.base.impl.BaseServiceImpl;
import com.caitou.service.inter.DynamicService;
import com.caitou.threadlocal.UserThreadLocal;
import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;



@Service
public class DynamicServiceImpl extends BaseServiceImpl<Dynamic> implements DynamicService {

	@Autowired
	private DynEssayDao dynEssayDao;
	
	@Autowired
	private DynDataDao dynDataDao;

	@Autowired
	private IFocusUserDao focusUserDao;
	
	@Autowired
	private IEssayDao essayDao;
	
	@Autowired
	private IUserDao userDao;
	
	@Autowired
	private FamoustDynDao famoustDynDao;
	
	@Override
	public PageInfo<Dynamic> getHotDyn() {
		
		PageHelper.startPage(1, 6);
		Example example = new Example(Dynamic.class);
		example.setOrderByClause("time desc");
		List<Dynamic> selectByExample = selectByExample(example);
		
		PageInfo<Dynamic> dynPage = new PageInfo<>(selectByExample);

		//格式化数据
		formatDyn(dynPage.getList());

		return dynPage;
	}

	@Override
	public void publishDyn(String content, String emotion, String xx, String notesId) {
		Dynamic dynamic = new Dynamic(null, UserThreadLocal.getUser().getId(), new Date(), emotion, content);
		insert(dynamic);
		//会自动回显id
		//System.out.println(dynamic.getId());
		
		if (notesId != null && !notesId.equals("")) {
			String[] split = notesId.split("\\|");
			for (String string : split) {
				dynEssayDao.insert(new DynEssay(dynamic.getId(), Integer.valueOf(string)));
			}	
		}

		
		if (xx != null && !xx.equals("") && !xx.equals("#\\|")) {
			String[] split2 = xx.split("\\|");
			for (String string2 : split2) {
				String[] split3 = string2.split("#");
				dynDataDao.insert(new DynData(null, split3[0] , split3[1], dynamic.getId()));
			}
		}
		
	}

	@Override
	public List<Dynamic> getFollowDyn() {
		
		Example example = new Example(FocusUser.class);
		example.createCriteria().andEqualTo("userId", UserThreadLocal.getUser().getId());
		List<FocusUser> selectByExample = focusUserDao.selectByExample(example);
		
		List<Dynamic> dynList = new ArrayList<>();
		for (FocusUser focusUser : selectByExample) {
			Example example2 = new Example(Dynamic.class);
			example2.createCriteria().andEqualTo("userId", focusUser.getFocusUserId());
			List selectByExample2 = selectByExample(example2);
			dynList.addAll(selectByExample2);
		}
		
		formatDyn(dynList);
		
		return dynList;
	}

	private void formatDyn(List<Dynamic> dynList) {
		for (Dynamic dynamic : dynList) {
			//动态的外链
			Example example2 = new Example(DynData.class);
			example2.createCriteria().andEqualTo("dynId", dynamic.getId());
			List<DynData> selectByExample2 = dynDataDao.selectByExample(example2);
			dynamic.setDynDataList(selectByExample2);
			
			//动态的文章
			Example example3 = new Example(DynEssay.class);
			example3.createCriteria().andEqualTo("dynId", dynamic.getId());
			List<DynEssay> selectByExample3 = dynEssayDao.selectByExample(example3);
			List<Essay> eList = new ArrayList<>();
			for (DynEssay dynEssay : selectByExample3) {
				Essay selectByPrimaryKey = essayDao.selectByPrimaryKey(dynEssay.getEssayId());
				eList.add(selectByPrimaryKey);
			}
			dynamic.setEssayList(eList);
			
			//动态的用户
			User selectByPrimaryKey = userDao.selectByPrimaryKey(dynamic.getUserId());
			dynamic.setUser(selectByPrimaryKey);

			//格式化时间
			dynamic.setFormatTime(CountUtil.formatTime(dynamic.getTime()));
		}
		
		//CountUtil.setSubTimeInDyn(dynList);
	}

	@Override
	public PageInfo<Dynamic> getDynById(int id) {
		
		PageHelper.startPage(1, 6);
		Example example = new Example(Dynamic.class);
		example.createCriteria().andEqualTo("userId", id);
		List<Dynamic> selectByExample = selectByExample(example);
		PageInfo<Dynamic> dynPage = new PageInfo<>(selectByExample);
		formatDyn(dynPage.getList());
		
		return dynPage;
	}

	
	@Override
	public void deleteDyn(Integer dynId) {
		Example example = new Example(DynEssay.class);
		example.createCriteria().andEqualTo("dynId",dynId);
		dynEssayDao.deleteByExample(example);
		
		Example example2 = new Example(DynData.class);
		example2.createCriteria().andEqualTo("dynId",dynId);
		dynDataDao.deleteByExample(example2);
		
		Example example3 = new Example(FamoustDyn.class);
		example3.createCriteria().andEqualTo("dynId", dynId);
		famoustDynDao.deleteByExample(example3);
		
		deleteByPrimaryKey(dynId);
	}
	
	
	
	
	
	
	
}































