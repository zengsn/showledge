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
import com.caitou.dto.AjaxResult;
import com.caitou.dto.PageParam;
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
				PageParam<List<Essay>> pageParam = new PageParam<List<Essay>>();
				int rowCount = essayService
						.getRowCountLikeKeyword(searchKeyword);
				pageParam.setRowCount(rowCount);
				PageParam.setPageSize(7);
				pageParam.setCurrentPage(1);
				essayService.getEssayLikeKeyword(pageParam, searchKeyword);
				model.addAttribute("pageParam", pageParam);
				model.addAttribute("searchKeyword", searchKeyword);
			}
			return "search";
		} else {
			return "redirect:/search?word=&type=notes";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/search/searchEssay", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	public AjaxResult<PageParam<List<Essay>>> searchEssayInSearch(
			String searchKeyword, int currentPage) throws Exception {
		if (!searchKeyword.isEmpty()) {
			PageParam<List<Essay>> pageParam = new PageParam<List<Essay>>();
			int rowCount = essayService.getRowCountLikeKeyword(searchKeyword);
			pageParam.setRowCount(rowCount);
			PageParam.setPageSize(7);
			pageParam.setCurrentPage(currentPage);
			pageParam = essayService.getEssayLikeKeyword(pageParam,
					searchKeyword);
			return new AjaxResult<PageParam<List<Essay>>>(true, pageParam);
		} else {
			return new AjaxResult<PageParam<List<Essay>>>(false);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/search/searchCorpus", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	public AjaxResult<PageParam<List<Corpus>>> searchCorpusInSearch(
			String searchKeyword, int currentPage) throws Exception {
		if (!searchKeyword.isEmpty()) {
			PageParam<List<Corpus>> pageParam = new PageParam<List<Corpus>>();
			int rowCount = corpusService.getRowCountLikeKeyword(searchKeyword);
			pageParam.setRowCount(rowCount);
			PageParam.setPageSize(10);
			pageParam.setCurrentPage(currentPage);
			pageParam = corpusService.getCorpusLikeKeyword(pageParam,
					searchKeyword);
			return new AjaxResult<PageParam<List<Corpus>>>(true, pageParam);
		} else {
			return new AjaxResult<PageParam<List<Corpus>>>(false);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/search/searchUser", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	public AjaxResult<PageParam<List<User>>> searchUserInSearch(
			String searchKeyword, int currentPage) throws Exception {
		if (!searchKeyword.isEmpty()) {
			PageParam<List<User>> pageParam = new PageParam<List<User>>();
			int rowCount = userService.getRowCountLikeKeyword(searchKeyword);
			pageParam.setRowCount(rowCount);
			PageParam.setPageSize(10);
			pageParam.setCurrentPage(currentPage);
			pageParam = userService
					.getUserLikeKeyword(pageParam, searchKeyword);
			return new AjaxResult<PageParam<List<User>>>(true, pageParam);
		} else {
			return new AjaxResult<PageParam<List<User>>>(false);
		}
	}
}
