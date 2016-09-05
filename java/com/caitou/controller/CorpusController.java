package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.FocusCorpusService;
import com.caitou.service.UserService;

@Controller
public class CorpusController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	CorpusService corpusService;

	@Resource
	FocusCorpusService focusCorpusService;

	@RequestMapping(value = "corpus")
	public String goToCorpus(String corpusId, HttpServletRequest request,
			HttpSession session) {
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		List<Essay> essayList = essayService.selectEssayByCorpusId(corpusId);
		essayList = CountUtil.setSubTimeInEssay(essayList);
		Corpus corpus = corpusService.selectCorpusById(Integer
				.valueOf(corpusId));
		User user = userService.selectByUserName(corpus.getUserName());
		if (userNameInSession != null) {
			user.setIsFocused(focusCorpusService.isFocusCorpused(
					Integer.valueOf(corpusId), userNameInSession));
		} else {
			user.setIsFocused(false);
		}
		request.setAttribute("user", user);
		request.setAttribute("essayList", essayList);
		request.setAttribute("corpus", corpus);
		return "corpus";
	}
}
