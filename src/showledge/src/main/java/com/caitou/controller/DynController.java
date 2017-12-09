package com.caitou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.dto.AjaxResult;
import com.caitou.service.inter.DynamicService;




@Controller
@RequestMapping("/dyn")
public class DynController {
	
	@Autowired
	private DynamicService dynamicService;
	
	@RequestMapping("/deleteDyn")
	public @ResponseBody AjaxResult<Object> deleteDyn(Integer dynId){
		dynamicService.deleteDyn(dynId);
		
		return new AjaxResult<>(true);
	}
	

}
