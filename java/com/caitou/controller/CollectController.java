package com.caitou.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caitou.bean.Essay;
import com.caitou.service.CollectService;
import com.caitou.service.EssayService;

@Controller
public class CollectController {

	@Resource
	CollectService collectService;

	@Resource
	EssayService essayService;

	@RequestMapping(value = "collect")
	public String goToCollect(HttpServletRequest request, HttpSession session) {
		String userName = (String) session.getAttribute("userNameInSession");
		if (userName != null && !userName.isEmpty()) {
			List<Integer> collectEssayIdList = collectService
					.selectEssayIdByUserName(userName);
			List<Essay> essayList = new ArrayList<Essay>();
			for (int i = 0; i < collectEssayIdList.size(); i++) {
				String essayId = String.valueOf(collectEssayIdList.get(i));
				essayList.add(essayService.selectEssayById(essayId));
			}
			request.setAttribute("essayList", essayList);
			return "collect";
		} else {
			return "redirect:/login";
		}
	}
}
