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
import com.caitou.service.EssayService;
import com.caitou.service.FavouriteService;

@Controller
public class FavouriteController {

	@Resource
	FavouriteService favouriteService;

	@Resource
	EssayService essayService;

	@RequestMapping(value = "/favourites", method = RequestMethod.GET)
	public String initFavourite(Model model, HttpSession session) {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
			List<Integer> favouriteEssayIdList = favouriteService
					.getEssayIdByUserId(userIdInSession);
			List<Essay> essayList = new ArrayList<Essay>();
			for (int i = 0; i < favouriteEssayIdList.size(); i++) {
				int essayId = favouriteEssayIdList.get(i);
				essayList.add(essayService.getEssayById(essayId));
			}
			essayList = CountUtil.setSubTimeInEssay(essayList);
			model.addAttribute("essayList", essayList);
			return "favourite";
		} else {
			return "redirect:/login";
		}
	}
}
