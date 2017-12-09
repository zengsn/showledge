package com.caitou.tasks;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;

import com.alibaba.fastjson.JSONObject;
import com.caitou.bean.Essay;
import com.caitou.bean.EssayType;
import com.caitou.bean.KMap;
import com.caitou.bean.Key;
import com.caitou.bean.KmapKeyWord;
import com.caitou.bean.User;
import com.caitou.dao.EssayTypeDao;
import com.caitou.dao.IEssayDao;
import com.caitou.dao.IKMapDao;
import com.caitou.dao.IUserDao;
import com.caitou.dao.KmapKeyWordDao;
import com.caitou.dao.UserInfoDao;
import com.caitou.dto.MapBean;
import com.caitou.service.KeyService;
import com.github.abel533.entity.Example;

/**
 * 自动创建
 * 
 * 需要用到笔记
 * 
 * @author _wind
 *
 */


@Component
public class CreateKMapTask {

	private static final Logger logger = LoggerFactory.getLogger(CreateKMapTask.class);
	
	@Autowired
	private IKMapDao kMapDao;
	
	@Autowired
	private IUserDao userDao;
	
	@Autowired
	private IEssayDao essayDao; 
	
	@Autowired
	private KeyService keyService;
	
	@Autowired
	private EssayTypeDao essayTypeDao;
	
	@Autowired
	private KmapKeyWordDao kmapKeyWordDao;
	
	private List<Key> keys;
	private List<EssayType> types;

	/**
	 * 自动创建脑图的任务
	 * 
	 */
	public void createKMap(){
		logger.debug("自动创建脑图启动...");
		
		if (keys == null) {
			keys = keyService.getKeys();
			logger.debug("创建脑图对象初始化完毕,key大小是:" + keys.size());
		}
		
		if (types == null) {
			types = essayTypeDao.select(null);
			logger.debug("文章类型的数量是:" + types.size());
		}
		
		
		//执行自动创建脑图逻辑
		List<User> select = userDao.select(null);
		//遍历每个用户
		for (User user : select) {
			//建立这个用户的思维导图
			for (EssayType essayType : types) {
				try {
					//建立该类型的思维导图
					int userId = user.getId();
					int typeId = essayType.getId();
					//每一个type就有一个脑图
					MapBean mapBean = new MapBean(true, String.valueOf(essayType.getId()),
							(essayType.getName() + "知识地图"), null, null);
					Example example = new Example(Essay.class);
					example.createCriteria().andEqualTo("userId", userId).andEqualTo("type", typeId);
					List<Essay> essays = essayDao.selectByExample(example);//该用户该类型的所有文章
					if (essays == null || essays.isEmpty()) {
						continue;
					}
					//遍历每一个文章
					Map<String, List<Essay>> map = new HashMap<String, List<Essay>>();
					for (Essay essay : essays) {
						getTitleKeys(essay, map);
					}
					if (map.isEmpty()) {
						continue;
					}
					//一定有二级树
					List<MapBean> mapList = new ArrayList<>();
					mapBean.setChildren(mapList);
					//生成二级树
					for (Entry<String, List<Essay>> entry : map.entrySet()) {
						String key = entry.getKey();

						MapBean bean = new MapBean();
						bean.setTopic(key);
						bean.setDirection("");
						bean.setExpanded(true);
						bean.setId(key);

						bean.setChildren(getContextKeys(entry.getValue()));

						mapList.add(bean);
					}
					//插入这个mapBean
					Example example2 = new Example(KMap.class);
					example2.createCriteria().andEqualTo("kmapName", mapBean.getTopic()).andEqualTo("userId",
							user.getId());
					int count = kMapDao.selectCountByExample(example2);
					logger.debug("找到的map的大小是:" + count + "user是:" + user.getId() + "map是" + mapBean.getTopic());
					int id = 0;
					if (count == 0) {
						//插入
						KMap kMap = new KMap(null, user.getId(), mapBean.getTopic(), "node_tree",
								JSONObject.toJSON(mapBean).toString(), null, 0, 0, false);
						kMapDao.insert(kMap);
						logger.debug("执行插入:" + mapBean.getTopic() + " " + user.getId());
						//写入标签
						id = kMap.getId();
					} else {
						//更新
						KMap kMap = new KMap(null, null, null, null, JSONObject.toJSON(mapBean).toString(), null, null,
								null, false);
						kMapDao.updateByExampleSelective(kMap, example2);
						logger.debug("执行更新:" + mapBean.getTopic() + " " + user.getId());
						//写入标签

						id = kMap.getId();
					}
					Example example3 = new Example(KmapKeyWord.class);
					example3.createCriteria().andEqualTo("kmapId", id);
					kmapKeyWordDao.deleteByExample(example3);
					//生成标签
					for (MapBean mapBean2 : mapList) {
						KmapKeyWord kmapKeyWord = new KmapKeyWord(null, id, mapBean2.getTopic());
						kmapKeyWordDao.insert(kmapKeyWord);
					} 
				} catch (Exception e) {
					e.printStackTrace();
					continue;
				}
			}
		}
		
		
	}
	
	/**
	 * 
	 * 
	 * @param value
	 * @return
	 */
	private List<MapBean> getContextKeys(List<Essay> value) {
		Set<MapBean> set = new HashSet<>();
		
		for (Essay essay : value) {
			for (Key key : keys) {
				if (essay.getEssayContent().indexOf(key.getKeyCode()) >= 0) {
					set.add(new MapBean(true, key.getKeyCode(), key.getKeyCode(), null, null));
				}
			}
		}
		
		List<MapBean> arrayList = new ArrayList<>();
		arrayList.addAll(set);
		return arrayList;
	}

	/**
	 * 找到文本的关键词
	 * 
	 * @param essayTitle
	 * @return
	 */
	private void getTitleKeys(Essay essay,Map<String, List<Essay>> map) {
		for (Key key : keys) {
			if (essay.getEssayTitle().indexOf(key.getKeyCode()) >= 0) {
				String keyCode = key.getKeyCode();
				if (map.get(keyCode) != null) {
					List<Essay> list = map.get(keyCode);
					list.add(essay);
				}else{
					List<Essay> l = new ArrayList<>();
					l.add(essay);
					map.put(keyCode,l);
				}
			}
		}
	}
	
	
	
	
	
	
	
	
}

































