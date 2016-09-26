package com.caitou.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.common.CheckUtil;
import com.caitou.common.CountUtil;
import com.caitou.common.HtmlUtil;
import com.caitou.dao.IEssayDao;
import com.caitou.dto.PageParam;

@Service
public class EssayService {

	@Resource
	IEssayDao iEssayDao;

	@Resource
	UserService userService;

	@Resource
	CorpusService corpusService;

	@Resource
	FamousService famousService;

	@Resource
	TimelineService timelineService;

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
		iEssayDao.insertEssay(paramMap);
	}

	public void deleteEssayById(int id) {
		Essay essay = iEssayDao.queryById(id);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("corpusId", essay.getCorpusId());
		paramMap.put("essayId", id);
		paramMap.put("userId", essay.getUserId());
		iEssayDao.deleteById(paramMap);
	}

	public void deleteEssayByCorpusId(int corpusId) {
		iEssayDao.deleteByCorpusId(corpusId);
	}

	public void updateEssay(int userId, int essayId, String essayTitle,
			String essayContent) {
		Essay essay = iEssayDao.queryById(essayId);
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

		iEssayDao.updateEssay(paramMap);
	}

	public void increaseCommentNumberById(int id) {
		iEssayDao.increaseEssayCommentNumber(id);
	}

	public void reduceCommentNumberById(int id) {
		iEssayDao.reduceEssayCommentNumber(id);
	}

	public void increaseReadingNumberById(int id) {
		iEssayDao.increaseEssayReadingNumber(id);
	}

	public void increaseGoodNumberById(int id) {
		iEssayDao.increaseEssayGoodNumber(id);
	}

	public void reduceGoodNumberById(int id) {
		iEssayDao.reduceEssayGoodNumber(id);
	}

	public Essay getEssayById(int id) {
		return iEssayDao.queryById(id);
	}

	public List<Essay> getEssayLimit(int limitNumber) {
		if (limitNumber == 0) {
			limitNumber = 5;
		} else {
			limitNumber = limitNumber + 5;
		}
		return iEssayDao.queryLimit(limitNumber);
	}

	public List<Essay> getEssayByCorpusId(int corpusId) {
		return iEssayDao.queryByCorpusId(corpusId);
	}

	public List<Essay> getEssayByTitle(String essayTitle) {
		return iEssayDao.queryByTitle(essayTitle);
	}

	public int getRowCountLikeKeyword(String keyword) {
		return iEssayDao.getRowCountLikeKeyword(keyword);
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
		List<Essay> essayList = iEssayDao.queryTitleLikeKeyword(map);
		for (Essay essay : essayList) {
			String essayTitle = essay.getEssayTitle();
			String essayContent = essay.getEssayContent();
			essayTitle = essayTitle.replaceAll(searchKeyword,
					"<em class=\"search-result-highlight\">" + searchKeyword
							+ "</em>");
			essayContent = HtmlUtil.getTextFromTHML(essayContent);
			essayContent = CountUtil.cutString(essayContent, 640) + "...";
			essayContent = essayContent.replaceAll(searchKeyword,
					"<em class=\"search-result-highlight\">" + searchKeyword
							+ "</em>");
			essay.setEssayTitle(essayTitle);
			essay.setEssayContent(essayContent);
		}
		essayList = CountUtil.setSubTimeInEssay(essayList);
		pageParam.setData(essayList);
		return pageParam;
	}

	public List<Essay> getEssayByUserIdOrderByTime(int userId) {
		return iEssayDao.queryByUserIdOrderByTime(userId);
	}
}
