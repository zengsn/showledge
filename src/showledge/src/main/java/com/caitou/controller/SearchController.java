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
		
		if (searchKeyword != null) {  // 判断关键字是否为空
			if (!searchKeyword.isEmpty()) {
				
				PageParam<List<Essay>> essayPageParam = new PageParam<List<Essay>>();
				// 查找包含此关键字的文章  
				int essayRowCount = essayService.getRowCountLikeKeyword(searchKeyword);
				essayPageParam.setRowCount(essayRowCount);
				PageParam.setPageSize(7);
				essayPageParam.setCurrentPage(1);
				essayService.getEssayLikeKeyword(essayPageParam, searchKeyword);
				model.addAttribute("essayPageParam", essayPageParam);

				
				PageParam<List<User>> userPageParam = new PageParam<List<User>>();
				// 查找包含此关键字的用户  
				int userRowCount = userService.getRowCountLikeKeyword(searchKeyword);
				userPageParam.setRowCount(userRowCount);
				PageParam.setPageSize(10);
				userPageParam.setCurrentPage(1);
				userPageParam = userService.getUserLikeKeyword(userPageParam,
						searchKeyword);
				model.addAttribute("userPageParam", userPageParam);
				
				//搜索文集
				//PageParam<List<Corpus>> corpusPageParam = new PageParam<List<Corpus>>();
				// 查找包含此关键字的文集
				/*int corpusRowCount = corpusService.getRowCountLikeKeyword(searchKeyword);
				corpusPageParam.setRowCount(corpusRowCount);
				PageParam.setPageSize(10);
				corpusPageParam.setCurrentPage(1);
				corpusPageParam = corpusService.getCorpusLikeKeyword(
						corpusPageParam, searchKeyword);
				model.addAttribute("corpusPageParam", corpusPageParam);*/

				model.addAttribute("searchKeyword", searchKeyword);
			}
			
			//转发到搜索页
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
