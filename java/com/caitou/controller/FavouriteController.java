package com.caitou.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caitou.bean.Essay;
import com.caitou.common.CountUtil;
import com.caitou.service.EssayService;
import com.caitou.service.FavouriteService;

@Controller
public class FavouriteController {

	@Resource
	FavouriteService favouriteService;

	@Resource
	EssayService essayService;

	@RequestMapping(value = "favourite")
	public String goToFavourite(HttpServletRequest request, HttpSession session) {
		String userName = (String) session.getAttribute("userNameInSession");
		if (userName != null && !userName.isEmpty()) {
			List<Integer> favouriteEssayIdList = favouriteService
					.selectEssayIdByUserName(userName);
			List<Essay> essayList = new ArrayList<Essay>();
			for (int i = 0; i < favouriteEssayIdList.size(); i++) {
				String essayId = String.valueOf(favouriteEssayIdList.get(i));
				essayList.add(essayService.selectEssayById(essayId));
			}
			essayList = CountUtil.setSubTimeInEssay(essayList);
			request.setAttribute("essayList", essayList);
			return "favourite";
		} else {
			return "redirect:/login";
		}
	}
}
