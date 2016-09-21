package com.caitou.controller;

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
import com.caitou.bean.Timeline;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.dto.AjaxResult;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.FocusCorpusService;
import com.caitou.service.FocusUserService;
import com.caitou.service.TimelineService;
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
	TimelineService timelineService;

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String initUser(Model model, HttpSession session) {
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
			List<Corpus> corpusList = corpusService
					.getCorpusByUserId(userIdInSession);
			model.addAttribute("user", user);
			model.addAttribute("essayList", essayList);
			model.addAttribute("corpusList", corpusList);
			return "user";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/users/{userId}/latest_articles", method = RequestMethod.GET)
	public String initUsers(@PathVariable("userId") int userId, Model model,
			HttpSession session) {
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
			List<Corpus> corpusList = corpusService.getCorpusByUserId(userId);
			model.addAttribute("user", user);
			model.addAttribute("essayList", essayList);
			model.addAttribute("corpusList", corpusList);
			return "users";
		}
	}

	@RequestMapping(value = "/users/{userId}/subscriptions", method = RequestMethod.GET)
	public String initSubscriptions(@PathVariable("userId") int userId,
			Model model, HttpSession session) {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		User user = userService.getUserByUserId(userId);
		int userFocusNumber = user.getUserFocusCorpusNumber()
				+ user.getUserFocusUserNumber();
		user.setUserFocusNumber(userFocusNumber);
		if (userIdInSession != 0) {
			user.setIsFocused(focusUserService.isFocusUsered(user.getId(),
					userIdInSession));
		}
		List<Corpus> corpusList = corpusService
				.getCorpusByUserId(userIdInSession);
		List<Integer> intList = focusCorpusService
				.getCorpusIdByUserId(userIdInSession);
		List<Corpus> corpusFocusList = new ArrayList<Corpus>();
		for (int i = 0; i < intList.size(); i++) {
			Corpus corpus = corpusService.getCorpusById(intList.get(i));
			if (userIdInSession != 0) {
				corpus.setIsUserFocused(focusCorpusService.isFocusCorpused(
						intList.get(i), userIdInSession));
			} else {
				corpus.setIsUserFocused(false);
			}
			corpusFocusList.add(corpus);
		}
		model.addAttribute("user", user);
		model.addAttribute("corpusList", corpusList);
		model.addAttribute("corpusFocusList", corpusFocusList);
		return "subscription";
	}

	@RequestMapping(value = "/users/{userId}/following", method = RequestMethod.GET)
	public String initFollowing(@PathVariable("userId") int userId,
			Model model, HttpSession session) {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		User user = userService.getUserByUserId(userId);
		int userFocusNumber = user.getUserFocusCorpusNumber()
				+ user.getUserFocusUserNumber();
		user.setUserFocusNumber(userFocusNumber);
		if (userIdInSession != 0) {
			user.setIsFocused(focusUserService.isFocusUsered(user.getId(),
					userIdInSession));
		}
		List<Integer> intList = focusUserService.getFocusUserIdByUserId(user
				.getId());
		List<User> userList = new ArrayList<User>();
		for (int i = 0; i < intList.size(); i++) {
			User user2 = userService.getUserByUserId(intList.get(i));
			if (userIdInSession != 0) {
				user2.setIsFocused(focusUserService.isFocusUsered(
						user2.getId(), userIdInSession));
			}
			userList.add(user2);

		}
		List<Corpus> corpusList = corpusService
				.getCorpusByUserId(userIdInSession);
		model.addAttribute("user", user);
		model.addAttribute("userList", userList);
		model.addAttribute("corpusList", corpusList);
		return "following";
	}

	@RequestMapping(value = "/users/{userId}/followers", method = RequestMethod.GET)
	public String initFollower(@PathVariable("userId") int userId, Model model,
			HttpSession session) {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		User user = userService.getUserByUserId(userId);
		int userFocusNumber = user.getUserFocusCorpusNumber()
				+ user.getUserFocusUserNumber();
		user.setUserFocusNumber(userFocusNumber);
		if (userIdInSession != 0) {
			user.setIsFocused(focusUserService.isFocusUsered(user.getId(),
					userIdInSession));
		}
		List<Integer> intList = focusUserService.getUserIdByFocusUserId(user
				.getId());
		List<User> userList = new ArrayList<User>();
		for (int i = 0; i < intList.size(); i++) {
			User user2 = userService.getUserByUserId(intList.get(i));
			if (userIdInSession != 0) {
				user2.setIsFocused(focusUserService.isFocusUsered(
						user2.getId(), userIdInSession));
			}
			userList.add(user2);
		}
		List<Corpus> corpusList = corpusService
				.getCorpusByUserId(userIdInSession);
		model.addAttribute("user", user);
		model.addAttribute("userList", userList);
		model.addAttribute("corpusList", corpusList);
		return "follower";
	}

	@RequestMapping(value = "/users/{userId}/timeline", method = RequestMethod.GET)
	public String initTimeline(@PathVariable("userId") int userId, Model model,
			HttpSession session) {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		User user = userService.getUserByUserId(userId);
		int userFocusNumber = user.getUserFocusCorpusNumber()
				+ user.getUserFocusUserNumber();
		user.setUserFocusNumber(userFocusNumber);
		if (userIdInSession != 0) {
			user.setIsFocused(focusUserService.isFocusUsered(user.getId(),
					userIdInSession));
		}
		List<Timeline> timelineList = timelineService
				.getTimelineByUserId(userId);
		for (int i = 0; i < timelineList.size(); i++) {
			Timeline timeline = timelineList.get(i);
			if (timeline.getEssayId() != 0) {
				Essay essay = essayService.getEssayById(timeline.getEssayId());
				essay.setCorpusName(corpusService.getCorpusById(
						essay.getCorpusId()).getCorpusName());
				timelineList.get(i).setEssay(essay);
				timeline.setFormatCreateTime(CountUtil
						.formatEssayTimestampInTimeLine(timeline
								.getCreateTime()));
			} else {
				timeline.setFormatCreateTime(CountUtil
						.formatUserTimestampInTimeLine(timeline.getCreateTime()));
			}
		}
		model.addAttribute("user", user);
		model.addAttribute("timelineList", timelineList);
		return "timeline";
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

	@RequestMapping(value = "/user/addFocusCorpus", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	@Transactional
	public AjaxResult<Object> addFocusCorpus(int corpusId, HttpSession session) {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
			userService.increaseUserFocusCorpusNumber(userIdInSession);
			corpusService.increaseUserFocusNumberById(corpusId);
			focusCorpusService.insertFocusCorpus(corpusId, userIdInSession);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}

	@RequestMapping(value = "/user/removeFocusCorpus", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	@Transactional
	public AjaxResult<Object> removeFocusCorpus(int corpusId,
			HttpSession session) {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
			userService.reduceUserFocusCorpusNumber(userIdInSession);
			corpusService.reduceUserFocusNumberById(corpusId);
			focusCorpusService.deleteFocusCorpus(corpusId, userIdInSession);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}
}
