package com.caitou.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Dynamic;
import com.caitou.bean.Essay;
import com.caitou.bean.KMap;
import com.caitou.bean.User;
import com.caitou.dto.AjaxResult;
import com.caitou.dto.PageParam;
import com.caitou.service.EssayService;
import com.caitou.service.KMapService;
import com.caitou.service.UserService;
import com.caitou.service.inter.DynamicService;
import com.caitou.threadlocal.UserThreadLocal;
import com.github.pagehelper.PageInfo;

/**
 * 榜样动态的页面
 * 
 * @author _wind
 *
 */

@Controller
public class FollowController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private EssayService essayService;
	
	@Autowired
	private DynamicService dynamicService;
	
	@Autowired
	private EssayService dssayService;
	
	@Autowired
	private KMapService kMapService;

	@RequestMapping(value = "/follow", method = RequestMethod.GET)
	public String follow(Model model){
		
		//找到最新的用户信息
		User user = userService.getUserAndCount(UserThreadLocal.getUser().getId());
		model.addAttribute("user", user);
		
		//找到我的学习笔记
		List<Essay> essayById = essayService.getEssayByUserIdOrderByTime(UserThreadLocal.getUser().getId());
		model.addAttribute("essayList", essayById);
		
		//我的榜样的动态
		List<Dynamic> dynList = dynamicService.getFollowDyn();
		model.addAttribute("dynList", dynList);
		
		//我的榜样的笔记
		PageInfo<Essay> notePage = essayService.getFollowNote();
		model.addAttribute("notePage", notePage);
		
		//我的榜样的脑图
		PageInfo<KMap> kMapList = kMapService.getFollowKMap();
		model.addAttribute("kMapPage", kMapList);
		
		//推荐关注
		PageInfo<User> userRecPage = userService.getRecUser(UserThreadLocal.getUser().getId());
		model.addAttribute("userRecPage", userRecPage);
		
		return "follow";
	}

	//发布动态
	@RequestMapping("publishDyn")
	public @ResponseBody AjaxResult<Object> publishDyn(String content,String emotion,String xx,String notesId){
		dynamicService.publishDyn(content,emotion,xx,notesId);
		return new AjaxResult<Object>(true);
	}
	
	
	
}

















