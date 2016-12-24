package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping(value = "/notebooks/{corpusId}/latest", method = RequestMethod.GET)
	public String initCorpus(@PathVariable("corpusId") int corpusId,
			Model model, HttpSession session) {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		List<Essay> essayList = essayService.getEssayByCorpusId(corpusId);
		essayList = CountUtil.setSubTimeInEssay(essayList);
		Corpus corpus = corpusService.getCorpusById(corpusId);
		User user = userService.getUserByUserId(corpus.getUserId());
		corpus.setUserName(user.getUserName());
		corpus.setUserImagePath(user.getUserImagePath());
		if (userIdInSession != 0) {
			user = userService.getUserByUserId(userIdInSession);
			user.setIsFocused(focusCorpusService.isFocusCorpused(corpusId,
					userIdInSession));
		} else {
			user.setIsFocused(false);
		}
		model.addAttribute("user", user);
		model.addAttribute("essayList", essayList);
		model.addAttribute("corpus", corpus);
		return "corpus";
	}
}
