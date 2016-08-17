package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.UserService;

@Controller
public class CorpusController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	CorpusService corpusService;

	@RequestMapping(value = "corpus")
	public String goToCorpus(String corpusId, HttpServletRequest request) {
		List<Essay> essayList = essayService.selectEssayByCorpusId(corpusId);
		essayList = CountUtil.setSubTimeInEssay(essayList);
		Corpus corpus = corpusService.selectCorpusById(corpusId);
		User user = userService.selectByUserName(corpus.getUserName());
		request.setAttribute("essayList", essayList);
		request.setAttribute("corpus", corpus);
		request.setAttribute("userImagePath", user.getUserImagePath());
		return "corpus";
	}
}
