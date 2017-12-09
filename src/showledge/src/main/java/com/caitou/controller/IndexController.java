package com.caitou.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.print.attribute.HashAttributeSet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.DynEssay;
import com.caitou.bean.Dynamic;
import com.caitou.bean.Essay;
import com.caitou.bean.EssayType;
import com.caitou.bean.KMap;
import com.caitou.bean.User;
import com.caitou.dto.AjaxResult;
import com.caitou.dto.DataBean;
import com.caitou.dto.PageParam;
import com.caitou.service.CommentMessageService;
import com.caitou.service.EssayService;
import com.caitou.service.FamousService;
import com.caitou.service.FocusMessageService;
import com.caitou.service.KMapService;
import com.caitou.service.UserService;
import com.caitou.service.inter.DynamicService;
import com.caitou.service.inter.EssayTypeService;
import com.caitou.threadlocal.UserThreadLocal;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;



@Controller
public class IndexController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	FamousService famousService;

	@Resource
	CommentMessageService commentMessageService;

	@Resource
	FocusMessageService focusMessageService;
	
	@Autowired
	private EssayTypeService essayTypeService;

	@Autowired
	private DynamicService dynamicService;
	
	@Autowired
	private KMapService kMapService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String initIndex(Model model, HttpSession session)
			throws UnsupportedEncodingException {

		//老的分页查询
		/*PageParam<List<Essay>> pageParam = new PageParam<List<Essay>>();
		int rowCount = famousService.getRowCount();
		pageParam.setRowCount(rowCount);
		pageParam.setCurrentPage(0);
		pageParam = famousService.getFamousEssayByOffect(pageParam);
		//直接从参数中注入session的方式
		if (session.getAttribute("userIdInSession") != null) {
			int userId = (int) session.getAttribute("userIdInSession");
			int messageNotReadNumber = commentMessageService
					.getRowCountIsNotRead(userId)
					+ focusMessageService.getRowCountIsNotRead(userId);
			session.setAttribute("messageNotReadNumber", messageNotReadNumber);
		}
		model.addAttribute("pageParam", pageParam);*/
		
		//获取所有分类
		List<EssayType> select = essayTypeService.select(null);
		select.add(0, new EssayType(0, "全部"));
		model.addAttribute("essaytype", select);

		//新主页数据
		//HashMap<String, HashMap<String,PageInfo<?>>> map = essayService.getNewIndexData(select); 
		//按照类型获取热门笔记
		List<DataBean<EssayType, PageInfo<Essay>>> list = essayService.getHotNote(select); 
		model.addAttribute("noteList", list);
		
		//获取热门动态
		PageInfo<Dynamic> dynList = dynamicService.getHotDyn();
		model.addAttribute("dynPage", dynList);
		
		//获取热门脑图
		PageInfo<KMap> kMapList = kMapService.getHotKMap();
		model.addAttribute("kMapPage", kMapList);
		
		//推荐的人
		if (UserThreadLocal.getUser() != null) {
			PageInfo<User> userRecPage = userService.getRecUser(UserThreadLocal.getUser().getId());
			model.addAttribute("userRecPage", userRecPage);
		}else{
			PageInfo<User> userRecPage = userService.getRecUser();
			model.addAttribute("userRecPage", userRecPage);
		}
		
		return "index";
	}

	@RequestMapping(value = "/lookMoreEssay", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<PageParam<List<Essay>>> lookMoreEssay(int currentPage)
			throws UnsupportedEncodingException {
		PageParam<List<Essay>> pageParam = new PageParam<List<Essay>>();
		int rowCount = famousService.getRowCount();
		pageParam.setRowCount(rowCount);
		currentPage += 1;
		if (currentPage > pageParam.getTotalPage() - 1) {
			return new AjaxResult<PageParam<List<Essay>>>(false);
		}
		pageParam.setCurrentPage(currentPage);
		pageParam = famousService.getFamousEssayByOffect(pageParam);
		return new AjaxResult<PageParam<List<Essay>>>(true, pageParam);
	}
	
	
	
	
}



















