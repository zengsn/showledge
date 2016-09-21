package com.caitou.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Essay;
import com.caitou.bean.Famous;
import com.caitou.common.CountUtil;
import com.caitou.dto.AjaxResult;
import com.caitou.service.EssayService;
import com.caitou.service.FamousService;
import com.caitou.service.UserService;

@Controller
@RequestMapping("/index")
public class IndexController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	FamousService famousService;

	@RequestMapping(method = RequestMethod.GET)
	public String initIndex(Model model) {
		List<Famous> famousList = famousService.getAllFamous();
		List<Essay> essayList = new ArrayList<Essay>();
		for (int i = 0; i < famousList.size(); i++) {
			Essay essay = essayService.getEssayById(famousList.get(i)
					.getEssayId());
			essayList.add(essay);
		}
		essayList = CountUtil.setSubTimeInEssay(essayList);
		// model.addAttribute("limitNumber", 5);
		model.addAttribute("essayList", essayList);
		return "index";
	}

	@ResponseBody
	@RequestMapping(value = "/{limitNumber}/lookMoreEssay", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	public AjaxResult<List<Essay>> lookMoreEssay(
			@PathVariable("limitNumber") int limitNumber) {
		List<Essay> essayList = essayService.getEssayLimit(limitNumber);
		essayList = CountUtil.setSubTimeInEssay(essayList);
		if (essayList != null) {
			return new AjaxResult<List<Essay>>(true, essayList);
		} else {
			return new AjaxResult<List<Essay>>(false);
		}
	}
}
