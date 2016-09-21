package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.common.HtmlUtil;
import com.caitou.dto.AjaxResult;
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

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchEssayInIndex(
			@RequestParam(value = "word", required = false) String searchKeyword,
			Model model) throws Exception {
		if (searchKeyword != null) {
			if (!searchKeyword.isEmpty()) {
				List<Essay> essayList = essayService
						.getEssayTitleLikeKeyword(searchKeyword);
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
				model.addAttribute("essayList", essayList);
				model.addAttribute("searchKeyword", searchKeyword);
			}
			return "search";
		} else {
			return "redirect:/search?word=&type=notes";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/search/searchEssay", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	public AjaxResult<List<Essay>> searchEssayInSearch(String searchKeyword)
			throws Exception {
		if (!searchKeyword.isEmpty()) {
			List<Essay> essayList = essayService
					.getEssayTitleLikeKeyword(searchKeyword);
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
			return new AjaxResult<List<Essay>>(true, essayList);
		} else {
			return new AjaxResult<List<Essay>>(false);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/search/searchCorpus", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	public AjaxResult<List<Corpus>> searchCorpusInSearch(String searchKeyword)
			throws Exception {
		if (!searchKeyword.isEmpty()) {
			List<Corpus> corpusList = corpusService
					.getCorpusLikeKeyword(searchKeyword);
			return new AjaxResult<List<Corpus>>(true, corpusList);
		} else {
			return new AjaxResult<List<Corpus>>(false);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/search/searchUser", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	public AjaxResult<List<User>> searchUserInSearch(String searchKeyword)
			throws Exception {
		if (!searchKeyword.isEmpty()) {
			List<User> userList = userService.getUserLikeKeyword(searchKeyword);
			return new AjaxResult<List<User>>(true, userList);
		} else {
			return new AjaxResult<List<User>>(false);
		}
	}
}
