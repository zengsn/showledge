package com.caitou.tasks;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.caitou.bean.Essay;
import com.caitou.bean.EssayType;
import com.caitou.bean.Recommend;
import com.caitou.bean.User;
import com.caitou.dao.EssayTypeDao;
import com.caitou.dao.IEssayDao;
import com.caitou.dao.RecommendDao;
import com.caitou.service.EssayService;
import com.caitou.service.KMapService;
import com.caitou.service.UserService;
import com.github.abel533.entity.Example;



@Component
public class RecommendTask {
	
	private static final Logger logger = LoggerFactory.getLogger(RecommendTask.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private KMapService kMapService;
	
	@Autowired
	private RecommendDao recommendDao;

	@Autowired
	private EssayService essayService; 
	
	@Autowired
	private IEssayDao essayDao; 
	
	@Autowired
	private EssayTypeDao essayTypeDao;
	
	private List<EssayType> types;

	public void doRecommend(){
		logger.debug("推荐算法执行");
		
		if (types == null) {
			types = essayTypeDao.select(null);
			logger.debug("文章类型的数量是:" + types.size());
		}
		
		List<User> allUser = userService.getAllUser();
		for (User user : allUser) {
			//获取文章的类型
			
			for (User u : allUser) {
				if (u != user) {
					int sum = 0;
					
					//计算相似度
					for (EssayType essayType : types) {
						Example example = new Example(Essay.class);
						example.createCriteria().andEqualTo("type", essayType.getId()).andEqualTo("userId", user.getId());
						int selectCountByExample = essayDao.selectCountByExample(example);
						
						Example example2 = new Example(Essay.class);
						example2.createCriteria().andEqualTo("type", essayType.getId()).andEqualTo("userId", u.getId());
						int selectCountByExample2 = essayDao.selectCountByExample(example2);
						
						if (selectCountByExample > 0 && selectCountByExample2 > 0 && selectCountByExample2 > selectCountByExample) {
							sum += 20;
						}else if(selectCountByExample > 0 && selectCountByExample2 > 0){
							sum += 10;
						}
					}
					
					//做推荐
					if (sum > 0) {
						Recommend recommend = new Recommend(user.getId(),u.getId() , sum);
						
						Example example = new Example(Recommend.class);
						example.createCriteria().andEqualTo("userId",user.getId()).andEqualTo("comUserId", u.getId());
						int selectCountByExample = recommendDao.selectCountByExample(example);
						
						if (selectCountByExample != 0) {
							//更新
							recommendDao.updateByPrimaryKey(recommend);
						}else{
							//插入
							recommendDao.insert(recommend);
						}
						
					}
				}
			}
		}
		
	}
	

}

















