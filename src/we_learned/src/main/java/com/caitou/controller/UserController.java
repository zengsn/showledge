package com.caitou.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.bean.KMap;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.common.HtmlUtil;
import com.caitou.dto.AjaxResult;
import com.caitou.service.CollectService;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.FavouriteService;
import com.caitou.service.FocusCorpusService;
import com.caitou.service.FocusUserService;
import com.caitou.service.KMapService;
import com.caitou.service.UserService;

@Controller
public class UserController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	CorpusService corpusService;

	@Resource
	FocusUserService focusUserService;

	@Resource
	FocusCorpusService focusCorpusService;

	@Resource
	FavouriteService favouriteService;

	@Resource
	CollectService collectService;

	@Resource
	KMapService kMapService;

	@RequestMapping(value = "/user")
	public String initUser(Model model, HttpSession session)
			throws UnsupportedEncodingException {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		if (userIdInSession != 0) {
			User user = userService.getUserByUserId(userIdInSession);
			int userFocusNumber = user.getUserFocusCorpusNumber()
					+ user.getUserFocusUserNumber();
			user.setUserFocusNumber(userFocusNumber);
			List<Essay> essayList = essayService
					.getEssayByUserIdOrderByTime(userIdInSession);
			essayList = CountUtil.setSubTimeInEssay(essayList);
			model.addAttribute("user", user);
			model.addAttribute("essayList", essayList);

			if (essayList != null) {
				for (int i = 0; i < essayList.size(); i++) {
					Essay essay = essayList.get(i);
					String essayContent = essay.getEssayContent();
					essayContent = HtmlUtil.getTextFromTHML(essayContent);
					essayContent = CountUtil.cutString(essayContent, 220)
							+ "...";
					essay.setEssayContent(essayContent);
					essayList.set(i, essay);
				}
			}

			List<Corpus> corpusList = corpusService.getCorpusByUserId(user
					.getId());
			model.addAttribute("corpusList", corpusList);

			List<KMap> kmapList = kMapService.getKMapByUserId(userIdInSession);
			model.addAttribute("kmapList", kmapList);
			return "user";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/users/{userId}/latest_articles", method = RequestMethod.GET)
	public String initUsers(@PathVariable("userId") int userId, Model model,
			HttpSession session) throws UnsupportedEncodingException {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		if (userId == userIdInSession) {
			// 如果判断是自己查看自己的主页则将网页重定向
			return "redirect:/user";
		} else {
			User user = userService.getUserByUserId(userId);
			int userFocusNumber = user.getUserFocusCorpusNumber()
					+ user.getUserFocusUserNumber();
			user.setUserFocusNumber(userFocusNumber);
			user.setIsFocused(focusUserService.isFocusUsered(user.getId(),
					userIdInSession));
			List<Essay> essayList = essayService
					.getEssayByUserIdOrderByTime(userId);
			essayList = CountUtil.setSubTimeInEssay(essayList);
			model.addAttribute("user", user);
			model.addAttribute("essayList", essayList);

			if (essayList != null) {
				for (int i = 0; i < essayList.size(); i++) {
					Essay essay = essayList.get(i);
					String essayContent = essay.getEssayContent();
					essayContent = HtmlUtil.getTextFromTHML(essayContent);
					essayContent = CountUtil.cutString(essayContent, 220)
							+ "...";
					essay.setEssayContent(essayContent);
					essayList.set(i, essay);
				}
			}

			List<Corpus> corpusList = corpusService.getCorpusByUserId(userId);
			model.addAttribute("corpusList", corpusList);
			return "users";
		}
	}

	@RequestMapping(value = "/users/{userId}/like", method = RequestMethod.GET)
	public String initLike(@PathVariable("userId") int userId, Model model,
			HttpSession session) throws UnsupportedEncodingException {
		User user = userService.getUserByUserId(userId);
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}

		List<Integer> favouriteEssayIdList = favouriteService
				.getEssayIdByUserId(userId);
		List<Essay> favouriteEssayList = new ArrayList<Essay>();
		for (int i = 0; i < favouriteEssayIdList.size(); i++) {
			int essayId = favouriteEssayIdList.get(i);
			Essay essay = essayService.getEssayById(essayId);
			if (essay != null) {
				String essayContent = essay.getEssayContent();
				essayContent = HtmlUtil.getTextFromTHML(essayContent);
				essayContent = CountUtil.cutString(essayContent, 280) + "...";
				essay.setEssayContent(essayContent);
				essay.setUserImagePath(user.getUserImagePath());
			}
			favouriteEssayList.add(essay);
		}
		favouriteEssayList = CountUtil.setSubTimeInEssay(favouriteEssayList);

		List<Integer> focusCorpusIdList = focusCorpusService
				.getCorpusIdByUserId(userId);
		List<Corpus> focusCorpusList = new ArrayList<Corpus>();
		for (int i = 0; i < focusCorpusIdList.size(); i++) {
			Corpus corpus = corpusService.getCorpusById(focusCorpusIdList
					.get(i));
			if (userIdInSession != 0) {
				if (corpus.getUserId() == userIdInSession) {
					corpus.setIsUserFocused(false);
				} else {
					corpus.setIsUserFocused(focusCorpusService.isFocusCorpused(
							corpus.getId(), userIdInSession));
				}
			} else {
				corpus.setIsUserFocused(false);
			}
			focusCorpusList.add(corpus);
		}

		List<Integer> intList = focusUserService.getFocusUserIdByUserId(userId);
		List<User> userList = new ArrayList<User>();
		for (int i = 0; i < intList.size(); i++) {
			User user2 = userService.getUserByUserId(intList.get(i));
			if (userIdInSession != 0) {
				if (userId == userIdInSession) {
					user2.setIsFocused(false);
				} else {
					user2.setIsFocused(focusUserService.isFocusUsered(
							user2.getId(), userIdInSession));
				}
			} else {
				user2.setIsFocused(false);
			}
			userList.add(user2);
		}

		model.addAttribute("favouriteEssayList", favouriteEssayList);
		model.addAttribute("focusCorpusList", focusCorpusList);
		model.addAttribute("userList", userList);
		return "like";
	}

	@RequestMapping(value = "/user/updateUser", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<User> updateUser(String userName, String userIntroduce,
			HttpSession session) {
		int userIdInSession = (int) session.getAttribute("userIdInSession");
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		if (!userNameInSession.equals(userName)) {
			boolean success = userService.isExistUserName(userName);
			if (success) {
				return new AjaxResult<User>(false, "昵称已经存在");
			} else {
				userService.updateUserName(userIdInSession, userName);
				session.setAttribute("userNameInSession", userName);
			}
		}
		userService.updateUserIntroduce(userIdInSession, userIntroduce);
		User user = userService.getUserByUserId(userIdInSession);
		user.setUserName(userName);
		user.setUserIntroduce(userIntroduce);
		return new AjaxResult<User>(true, user);
	}

	@RequestMapping(value = "/user/addFocusUser", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	@Transactional
	public AjaxResult<Object> addFocusUser(int focusUserId, HttpSession session) {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
			userService.increaseUserFocusUserNumber(userIdInSession);
			userService.increaseUserFansNumber(focusUserId);
			focusUserService.insertFocusUser(focusUserId, userIdInSession);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}

	@RequestMapping(value = "/user/removeFocusUser", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	@Transactional
	public AjaxResult<Object> removeFocusUser(int focusUserId,
			HttpSession session) {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
			userService.reduceUserFocusUserNumber(userIdInSession);
			userService.reduceUserFansNumber(focusUserId);
			focusUserService.deleteFocusUser(focusUserId, userIdInSession);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}
}
