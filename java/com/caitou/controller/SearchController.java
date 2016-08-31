package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.common.HtmlUtil;
import com.caitou.entity.ResultDTO;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.UserService;

@Controller
public class SearchController {

	@Resource
	EssayService essayService;

	@Resource
	CorpusService corpusService;

	@Resource
	UserService userService;

	@RequestMapping(value = "search")
	public String goToSearch() throws Exception {
		return "search";
	}

	@RequestMapping(value = "searchInIndex.do")
	public String searchEssayInIndex(String searchKeyword,
			HttpServletRequest request) throws Exception {
		if (searchKeyword != null && !searchKeyword.isEmpty()) {
			List<Essay> essayList = essayService
					.selectEssayTitleLikeKeyword(searchKeyword);
			for (int i = 0; i < essayList.size(); i++) {
				String essayTitle = essayList.get(i).getEssayTitle();
				String essayContent = essayList.get(i).getEssayContent();
				essayTitle = essayTitle.replaceAll(searchKeyword,
						"<em class=\"search-result-highlight\">"
								+ searchKeyword + "</em>");
				essayContent = HtmlUtil.getTextFromTHML(essayContent);
				essayContent = essayContent.replaceAll(searchKeyword,
						"<em class=\"search-result-highlight\">"
								+ searchKeyword + "</em>");
				essayList.get(i).setEssayTitle(essayTitle);
				essayList.get(i).setEssayContent(essayContent);
			}
			essayList = CountUtil.setSubTimeInEssay(essayList);
			request.setAttribute("essayList", essayList);
			request.setAttribute("searchKeyword", searchKeyword);
		}
		return "search";
	}

	@ResponseBody
	@RequestMapping(value = "searchEssay.do", produces = "application/json")
	public ResultDTO searchEssayInSearch(String searchKeyword) throws Exception {
		ResultDTO result = new ResultDTO();
		if (!searchKeyword.isEmpty()) {
			List<Essay> essayList = essayService
					.selectEssayTitleLikeKeyword(searchKeyword);
			for (int i = 0; i < essayList.size(); i++) {
				String essayTitle = essayList.get(i).getEssayTitle();
				String essayContent = essayList.get(i).getEssayContent();
				essayTitle = essayTitle.replaceAll(searchKeyword,
						"<em class=\"search-result-highlight\">"
								+ searchKeyword + "</em>");
				essayContent = HtmlUtil.getTextFromTHML(essayContent);
				essayContent = essayContent.replaceAll(searchKeyword,
						"<em class=\"search-result-highlight\">"
								+ searchKeyword + "</em>");
				essayList.get(i).setEssayTitle(essayTitle);
				essayList.get(i).setEssayContent(essayContent);
			}
			result.setEssayList(essayList);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "searchCorpus.do", produces = "application/json")
	public ResultDTO searchCorpusInSearch(String searchKeyword)
			throws Exception {
		ResultDTO result = new ResultDTO();
		if (!searchKeyword.isEmpty()) {
			List<Corpus> corpusList = corpusService
					.selectCorpusLikeKeyword(searchKeyword);
			result.setCorpusList(corpusList);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "searchUser.do", produces = "application/json")
	public ResultDTO searchUserInSearch(String searchKeyword) throws Exception {
		ResultDTO result = new ResultDTO();
		if (!searchKeyword.isEmpty()) {
			List<User> userList = userService
					.selectUserLikeKeyword(searchKeyword);
			result.setUserList(userList);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}
}
