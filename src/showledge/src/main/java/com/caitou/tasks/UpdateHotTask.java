package com.caitou.tasks;

import java.util.List;

import javax.imageio.plugins.bmp.BMPImageWriteParam;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.caitou.bean.Dynamic;
import com.caitou.bean.Essay;
import com.caitou.bean.Famous;
import com.caitou.bean.FamousKmap;
import com.caitou.bean.FamoustDyn;
import com.caitou.bean.KMap;
import com.caitou.dao.DynamicDao;
import com.caitou.dao.FamousKmapDao;
import com.caitou.dao.FamoustDynDao;
import com.caitou.dao.IEssayDao;
import com.caitou.dao.IFamousDao;
import com.caitou.dao.IKMapDao;
import com.caitou.dto.MapBean;
import com.caitou.service.EssayService;



@Component
public class UpdateHotTask {
	
	private static final Logger logger = LoggerFactory.getLogger(UpdateHotTask.class);

	@Autowired
	private IEssayDao iEssayDao;
	@Autowired
	private IFamousDao iFamousDao;
	
	@Autowired
	private EssayService essayService;
	
	/**
	 * 计算热度的定时器
	 */
	public void updateNoteHot(){
		logger.debug("笔记定时器启动");
		
		List<Essay> select = essayService.selectAll();
		for (Essay essay : select) {
			
			Famous selectByPrimaryKey = iFamousDao.selectByPrimaryKey(essay.getId());
			int scorce = essay.getEssayReadingNumber() * 1 + essay.getEssayCommentNumber() * 5 +essay.getEssayGoodNumber() * 10 + essay.getEssayCollectNumber() * 20;
			
			if (selectByPrimaryKey==null) {
				iFamousDao.insert(new Famous(essay.getId(), scorce));
			}else{
				selectByPrimaryKey.setGrade(scorce);
				iFamousDao.updateByPrimaryKey(selectByPrimaryKey);
			}
		}
	}

	
	
	@Autowired
	private IKMapDao kMapDao; 
	@Autowired
	private FamousKmapDao famousKmapDao;
	/**
	 * 计算热度的定时器
	 */
	public void updateKMapHot(){
		logger.debug("脑图定时器启动");
		
		List<KMap> select2 = kMapDao.select(null);
		for (KMap kMap : select2) {
			
			MapBean mapBean = JSONObject.parseObject(kMap.getKmapData(),MapBean.class);
			int sum = 10 + 5 * mapBean.getChildren().size();
			
			for (MapBean mBean : mapBean.getChildren()) {
				if (mBean.getChildren() != null) {
					sum += mBean.getChildren().size();
				}
			}
			
			FamousKmap selectByPrimaryKey = famousKmapDao.selectByPrimaryKey(kMap.getId());
			if (selectByPrimaryKey == null) {
				famousKmapDao.insert(new FamousKmap(kMap.getId(), sum));
			}else{
				famousKmapDao.updateByPrimaryKeySelective(new FamousKmap(kMap.getId(), sum));
			}
		}
	}
	
	
	
	//动态不需要热门
//	@Autowired
//	private DynamicDao dynamicDao;
//	@Autowired
//	private FamoustDynDao famoustDynDao;
//	/**
//	 * 计算热度的定时器
//	 */
//	public void updateDynHot(){
//		logger.debug("动态定时器启动");
//		
//		List<Dynamic> select2 = dynamicDao.select(null);
//		for (Dynamic dynamic : select2) {
//			FamoustDyn selectByPrimaryKey = famoustDynDao.selectByPrimaryKey(dynamic.getId());
//			if (selectByPrimaryKey == null) {
//				famoustDynDao.insert(new FamoustDyn(dynamic.getId(), 100));
//			}
//		}
//	}

	
	
}
























