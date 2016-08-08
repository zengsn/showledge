package com.caitou.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.common.MyTool;
import com.caitou.entity.Essay;
import com.caitou.entity.ResultDTO;
import com.caitou.service.EssayService;

@Controller
public class WriterController {

	@Resource
	EssayService essayService;

	@RequestMapping(value = "writer")
	public String goToWriter() {
		return "writer";
	}

	@RequestMapping(value = "writer.do")
	public String addEssay(Essay essay, HttpSession session) {
		String userName = (String) session.getAttribute("userNameInSession");
		essayService.insertEssay(essay, userName);
		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "createEssay.do", produces = "application/json")
	public ResultDTO createEssay(String essayTitle, String container,
			HttpServletRequest request, HttpSession session) throws Exception {
		ResultDTO result = new ResultDTO();
		if (!essayTitle.isEmpty() && !container.isEmpty()) {
			String userName = (String) session
					.getAttribute("userNameInSession");
			Essay essay = new Essay();
			essay.setEssayTitle(essayTitle);
			essay.setEssayContent(container);
			MyTool myTool = new MyTool();
			essay.setEssayWordNumber(myTool.countWordNumber(container));
			essayService.insertEssay(essay, userName);
			result.setSuccess(true);
			return result;
		} else {
			result.setSuccess(false);
			return result;
		}
	}
}
