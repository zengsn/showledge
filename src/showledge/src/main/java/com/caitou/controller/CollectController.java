package com.caitou.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.caitou.bean.Essay;
import com.caitou.common.CountUtil;
import com.caitou.service.CollectService;
import com.caitou.service.EssayService;

@Controller
public class CollectController {

	@Resource
	CollectService collectService;

	@Resource
	EssayService essayService;

	@RequestMapping(value = "/bookmarks", method = RequestMethod.GET)
	public String initCollect(Model model, HttpSession session) {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
			List<Integer> collectEssayIdList = collectService
					.getEssayIdByUserId(userIdInSession);
			List<Essay> essayList = new ArrayList<Essay>();
			for (int i = 0; i < collectEssayIdList.size(); i++) {
				int essayId = collectEssayIdList.get(i);
				essayList.add(essayService.getEssayById(essayId));
			}
			essayList = CountUtil.setSubTimeInEssay(essayList);
			model.addAttribute("essayList", essayList);
			return "collect";
		} else {
			return "redirect:/login";
		}
	}
}
