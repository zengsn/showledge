package com.caitou.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.caitou.bean.Collect;
import com.caitou.bean.Comment;
import com.caitou.bean.DynEssay;
import com.caitou.bean.Essay;
import com.caitou.bean.EssayType;
import com.caitou.bean.Famous;
import com.caitou.bean.Favourite;
import com.caitou.bean.User;
import com.caitou.common.CheckUtil;
import com.caitou.common.CountUtil;
import com.caitou.common.HtmlUtil;
import com.caitou.dao.DynEssayDao;
import com.caitou.dao.DynamicDao;
import com.caitou.dao.FamousKmapDao;
import com.caitou.dao.FamoustDynDao;
import com.caitou.dao.ICollectDao;
import com.caitou.dao.ICommentDao;
import com.caitou.dao.IEssayDao;
import com.caitou.dao.IFamousDao;
import com.caitou.dao.IFavouriteDao;
import com.caitou.dao.IKMapDao;
import com.caitou.dto.DataBean;
import com.caitou.dto.PageParam;
import com.caitou.threadlocal.UserThreadLocal;

import com.github.abel533.entity.Example;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;



@Service
public class EssayService {

	@Resource
	private IEssayDao essayDao;
	@Autowired
	private IFamousDao famousDao;

	@Autowired
	private DynamicDao dynamicDao;
	@Autowired
	private FamoustDynDao famoustDynDao;
	
	@Autowired
	private IKMapDao kMapDao;
	@Autowired
	private FamousKmapDao famousKmapDao;
	
	@Resource
	UserService userService;

	@Resource
	CorpusService corpusService;

	@Resource
	FamousService famousService;

	@Resource
	LabelService labelService;

	@Autowired
	private DynEssayDao dynEssayDao;
	
	@Autowired
	private ICollectDao collectDao;
	
	@Autowired
	private IFavouriteDao favouriteDao;
	
	@Autowired
	private ICommentDao commentDao; 
	
	public void insertEssay(int corpusId, int userId) {
		User user = userService.getUserByUserId(userId);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("corpusId", corpusId);
		paramMap.put("userId", userId);
		paramMap.put("userName", user.getUserName());
		paramMap.put("essayTitle", "记下idea,保准丢不了~");
		paramMap.put("essayContent",
				"<p>建议编写一篇内容有益并稍长的随记，这样会更有助于您进入热搜哦 (*^__^*)</p>");
		paramMap.put("essayCreateTime", CountUtil.getTime());
		essayDao.insertEssay(paramMap);
	}

	public void deleteEssayById(int id) {
		//删除动态
		Example example = new Example(DynEssay.class);
		example.createCriteria().andEqualTo("essayId", id);
		dynEssayDao.deleteByExample(example);
		
		//删除热门
		famousService.deleteByEssayId(id);
		
		//删除收藏
		Example example2 = new Example(Collect.class);
		example2.createCriteria().andEqualTo("essayId", id);
		collectDao.deleteByExample(example2);
		
		//删除喜欢
		Example example3 = new Example(Favourite.class);
		example3.createCriteria().andEqualTo("essayId", id);
		favouriteDao.deleteByExample(example3);
		
		//删除评论
		Example example4 = new Example(Comment.class);
		example4.createCriteria().andEqualTo("essayId", id);
		commentDao.deleteByExample(example4);
		
		//删除文章
		essayDao.deleteByPrimaryKey(id);
	}

	public void deleteEssayByCorpusId(int corpusId) {
		essayDao.deleteByCorpusId(corpusId);
	}

	public Essay updateEssay(int userId, int essayId, String essayTitle,
			String essayContent) {
		Essay essay = essayDao.queryById(essayId);
		essay.setEssayTitle(essayTitle);
		essay.setEssayContent(essayContent);
		essay.setEssayTime(CountUtil.getTime());
		List<String> stringList = HtmlUtil.getImgSrc(essayContent);
		if (stringList.size() != 0) {
			essay.setEssayImagePath(stringList.get(0));
		}
		essayContent = HtmlUtil.getTextFromTHML(essayContent);
		int essayNewWordNumber = CountUtil.countWordNumber(essayContent);

		if (essayNewWordNumber > 60) {
			if (essayNewWordNumber > 1000) {
				famousService.toBeFamous(essay, essayNewWordNumber);
				if (essay.getIsHot() != 1) {
					essay.setIsHot(1);
				}
			} else if (essayNewWordNumber > 500
					&& essay.getEssayImagePath() != null) {
				famousService.toBeFamous(essay, essayNewWordNumber);
				if (essay.getIsHot() != 1) {
					essay.setIsHot(1);
				}
			} else {
				boolean result = CheckUtil.checkEssayIsValuable(essayContent,
						essayNewWordNumber);
				if (result) {
					famousService.toBeFamous(essay, essayNewWordNumber);
					if (essay.getIsHot() != 1) {
						essay.setIsHot(1);
					}
				}
			}
		}

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("corpusId", essay.getCorpusId());
		paramMap.put("essayId", essay.getId());
		paramMap.put("userId", essay.getUserId());
		paramMap.put("essayTitle", essay.getEssayTitle());
		paramMap.put("essayContent", essay.getEssayContent());
		paramMap.put("essayUpdateTime", essay.getEssayTime());
		paramMap.put("essayImagePath", essay.getEssayImagePath());
		paramMap.put("essayOldWordNumber", essay.getEssayWordNumber());
		paramMap.put("essayNewWordNumber", essayNewWordNumber);
		paramMap.put("isHot", essay.getIsHot());

		essayDao.updateEssay(paramMap);
		return essay;
	}

	public void increaseCommentNumberById(int id) {
		essayDao.increaseEssayCommentNumber(id);
	}

	public void reduceCommentNumberById(int id) {
		essayDao.reduceEssayCommentNumber(id);
	}

	public void increaseReadingNumberById(int id) {
		essayDao.increaseEssayReadingNumber(id);
	}

	public void increaseGoodNumberById(int id) {
		essayDao.increaseEssayGoodNumber(id);
	}

	public void reduceGoodNumberById(int id) {
		essayDao.reduceEssayGoodNumber(id);
	}

	/**
	 * 获取一个文章的数据
	 * 
	 * @param id
	 * @return
	 */
	public Essay getEssayById(int id) {
		Essay essay = essayDao.selectByPrimaryKey(id);
		
		formatCount(essay);
		
		//更新一下数据库的数据
		essayDao.updateByPrimaryKeySelective(essay);
		
		return essay;
	}

	public List<Essay> getEssayLimit(int limitNumber) {
		if (limitNumber == 0) {
			limitNumber = 5;
		} else {
			limitNumber = limitNumber + 5;
		}
		return essayDao.queryLimit(limitNumber);
	}

	public List<Essay> getEssayByCorpusId(int corpusId) {
		List<Essay> essayList = essayDao.queryByCorpusId(corpusId);
		for (Essay essay : essayList) {
			essay.setLabel(labelService.getLabelByEssayId(essay.getId()));
		}
		return essayList;
	}

	public List<Essay> getEssayByTitle(String essayTitle) {
		return essayDao.queryByTitle(essayTitle);
	}

	public int getRowCountLikeKeyword(String keyword) {
		return essayDao.getRowCountLikeKeyword(keyword);
	}

	public PageParam<List<Essay>> getEssayLikeKeyword(
			PageParam<List<Essay>> pageParam, String searchKeyword)
			throws UnsupportedEncodingException {
		int offset = (pageParam.getCurrentPage() - 1) * PageParam.getPageSize();
		int size = PageParam.getPageSize();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", searchKeyword);
		map.put("offset", offset);
		map.put("size", size);
		List<Essay> essayList = essayDao.queryTitleLikeKeyword(map);
		for (Essay essay : essayList) {
			String essayTitle = essay.getEssayTitle();
			String essayContent = essay.getEssayContent();
			int userId = essay.getUserId();
			User user = userService.getUserByUserId(userId);
			essay.setUserImagePath(user.getUserImagePath());
			essayTitle = essayTitle.replaceAll(searchKeyword,
					"<u class=\"text-success\">" + searchKeyword + "</u>");
			essayContent = HtmlUtil.getTextFromTHML(essayContent);
			essayContent = CountUtil.cutString(essayContent, 270) + "...";
			essayContent = essayContent.replaceAll(searchKeyword,
					"<u class=\"text-success\">" + searchKeyword + "</u>");
			essay.setEssayTitle(essayTitle);
			essay.setEssayContent(essayContent);
		}
		essayList = CountUtil.setSubTimeInEssay(essayList);
		pageParam.setData(essayList);
		return pageParam;
	}

	public List<Essay> getEssayByUserIdOrderByTime(int userId) {
		List<Essay> queryByUserIdOrderByTime = essayDao.queryByUserIdOrderByTime(userId);
		
		return queryByUserIdOrderByTime;
	}

	public List<Essay> getAllEssay() {
		return essayDao.queryAllEssay();
	}

	/**
	 * 增加一个笔记
	 * 
	 * @param title
	 * @param content
	 * @param type
	 */
	public int addNote(String title, String content, String type) {
		Essay essay = new Essay();
		essay.setEssayTitle(title);
		essay.setEssayContent(content);;
		essay.setType(Integer.valueOf(type));
		
		User user = UserThreadLocal.getUser();
		essay.setUserId(user.getId());
		essay.setEssayTime(new Date());
		essay.setEssayReadingNumber(0);
		essay.setEssayCommentNumber(0);
		essay.setEssayGoodNumber(0);
		essay.setEssayWordNumber(0);
		essay.setCorpusId(0);
		essay.setIsHot(0);
		essay.setUserName(user.getUserName());
		
		essayDao.insert(essay);
		
		return essay.getId();
	}
	
	/**
	 * 更新文章
	 * 
	 * @param essayid
	 * @param title
	 * @param content
	 * @param type
	 */
	public void updateNote(int essayid, String title, String content, String type) {
		Essay essay = essayDao.selectByPrimaryKey(essayid);
		//essay.setId(essayid);
		essay.setEssayTitle(title);
		essay.setEssayContent(content);;
		essay.setType(Integer.valueOf(type));
		
		essayDao.updateByPrimaryKeySelective(essay);
	}

	/**
	 * 查看有没有更多
	 * 
	 * @return
	 */
	public boolean hasMore() {
		Example example = new Example(Essay.class);
		example.createCriteria().andEqualTo("userId", UserThreadLocal.getUser().getId());
		
		int selectCount = essayDao.selectCountByExample(example);
		
		return selectCount > 6;
	}

	/**
	 * 新版首页的数据获取
	 * 
	 * @param select
	 * @return
	 */
	@Deprecated
	public HashMap<String, HashMap<String, PageInfo<?>>> getNewIndexData(List<EssayType> select) {
		HashMap<String, HashMap<String, PageInfo<?>>> map = new HashMap<String, HashMap<String, PageInfo<?>>>();

		//遍历所有的分类
		for (EssayType essayType : select) {
			HashMap<String, PageInfo<?>> hashMap = new HashMap<String, PageInfo<?>>();
			
			if (essayType.getId() == 0) {
				//查询全部当中的热门
				//查询动态
				//查询笔记
				/*PageInfo pageInfo = getPageInfo(essayType.getId());
				hashMap.put("note", pageInfo);
				*/
				//查询脑图
			}else{
				//查询该类型的热门
				//查询动态
				//查询笔记
				//查询脑图
			}
			
			//放进其中一个分类
			map.put(String.valueOf(essayType.getId()), hashMap);
		}
		
		return map;
	}

	private PageInfo getPageInfo() {
		PageHelper.startPage(1, 6);//这个PageHelper是面向对象的,从第一页开始数
		Example example = new Example(Famous.class);
		example.setOrderByClause("grade desc");//从大到小排列
		
		List<Famous> selectByExample = famousDao.selectByExample(example);
		PageInfo pageInfo = new PageInfo(selectByExample);
		List essayIdList = new ArrayList<>();
		for (Famous famous : selectByExample) {
			essayIdList.add(famous.getEssayId());
		}
		
		PageHelper.startPage(1, 6);
		Example example2 = new Example(Essay.class);
		example2.createCriteria().andIn("id", essayIdList);
		List<Essay> selectByExample2 = essayDao.selectByExample(example2);
		pageInfo.setList(selectByExample2);
		
		return pageInfo;
	}

	/**
	 * 获取所有分类的热门笔记
	 * 
	 * @param select
	 * @return
	 */
	public List<DataBean<EssayType, PageInfo<Essay>>> getHotNote(List<EssayType> select) {
		List<DataBean<EssayType, PageInfo<Essay>>> list = new ArrayList<>();
		
		//遍历所有的分类
		for (EssayType essayType : select) {
			DataBean<EssayType, PageInfo<Essay>> data = new DataBean<>();
			data.setT(essayType);
			
			PageInfo pageInfo = null;
			if (essayType.getId() == 0) {
				//查询全部当中的热门
				pageInfo = getPageInfo();
			}else{
				//查询指定类型的热门笔记
				PageHelper.startPage(1, 6);
				List<Essay> selectFamousByType = famousDao.selectFamousByType(essayType.getId());
				
				pageInfo = new PageInfo<>(selectFamousByType);
			}
			
			//格式化文章数据
			List<Essay> list2 = pageInfo.getList();
			formatItemEssay(list2);
			
			data.setE(pageInfo);
			//放进其中一个分类
			list.add(data);
		}
		
		return list;
	}

	/**
	 * 格式化笔记
	 * @param list2
	 */
	private void formatItemEssay(List<Essay> list2) {
		for (Essay essay : list2) {
			String essayContent = essay.getEssayContent();
			essayContent = HtmlUtil.getTextFromTHML(essayContent);
			try {
				essayContent = CountUtil.cutString(essayContent, 180) + "...";
			} catch (UnsupportedEncodingException e) {
				
			}
			essay.setEssayContent(essayContent);
			User user = userService.getUserByUserName(essay.getUserName());
			essay.setUserImagePath(user.getUserImagePath());

			if (UserThreadLocal.getUser() != null) {
				//判断当前用户是否喜欢
				Example example = new Example(Favourite.class);
				example.createCriteria().andEqualTo("essayId", essay.getId()).andEqualTo("userId", UserThreadLocal.getUser().getId());
				int selectCountByExample = favouriteDao.selectCountByExample(example);
				essay.setIsFavourited(selectCountByExample == 1);	
			
				//判断有没有收藏
				Example example2 = new Example(Collect.class);
				example2.createCriteria().andEqualTo("essayId", essay.getId()).andEqualTo("userId", UserThreadLocal.getUser().getId());
				int selectCountByExample2 = collectDao.selectCountByExample(example2);
				essay.setIsCollected(selectCountByExample2 == 1);	
			}
			
			formatCount(essay);
			
			//更新一下数据库的数据
			//essayDao.updateByPrimaryKeySelective(essay);
		}
		CountUtil.setSubTimeInEssay(list2);
	}

	private void formatCount(Essay essay) {
		//获取喜欢的数量
		Example example = new Example(Favourite.class);
		example.createCriteria().andEqualTo("essayId", essay.getId());
		int selectCountByExample = favouriteDao.selectCountByExample(example);
		essay.setEssayGoodNumber(selectCountByExample);
		
		//收藏的数量
		Example example2 = new Example(Collect.class);
		example2.createCriteria().andEqualTo("essayId", essay.getId());
		int selectCountByExample2 = collectDao.selectCountByExample(example2);
		essay.setEssayCollectNumber(selectCountByExample2);
		
		//评论的数量
		Example example3 = new Example(Comment.class);
		example3.createCriteria().andEqualTo("essayId", essay.getId());
		int selectCountByExample3 = commentDao.selectCountByExample(example3);
		essay.setEssayCommentNumber(selectCountByExample3);
	}

	/**
	 * 获取沃收藏的文章
	 * @param i 
	 * 
	 * @return
	 */
	public PageInfo<Essay> getFollowEssay(int i) {
		PageHelper.startPage(1, 6);
		List<Essay> followEssay = essayDao.getFollowEssay(i);
		PageInfo pageInfo = new PageInfo(followEssay);
		formatItemEssay(pageInfo.getList());
		return 	pageInfo;
	}

	/**
	 * 榜样的笔记
	 * 
	 * @return
	 */
	public PageInfo<Essay> getFollowNote() {
		PageHelper.startPage(1, 6);
		List<Essay> list = essayDao.getFollowNote(UserThreadLocal.getUser().getId());
		PageInfo<Essay> pInfo = new PageInfo<>(list);
		
		formatItemEssay(pInfo.getList());
		
		return pInfo;
	}

	/**
	 * 
	 * 
	 * @return
	 */
	public List<Essay> selectAll() {
		List<Essay> select = essayDao.select(null);
		for (Essay essay2 : select) {
			formatCount(essay2);
		}
		
		return select;
	}
	
	
	
}


















