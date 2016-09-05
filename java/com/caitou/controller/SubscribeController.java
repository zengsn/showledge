package com.caitou.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Corpus;
import com.caitou.bean.User;
import com.caitou.entity.ResultDTO;
import com.caitou.service.CorpusService;
import com.caitou.service.FocusCorpusService;
import com.caitou.service.FocusUserService;
import com.caitou.service.UserService;

@Controller
public class SubscribeController {

	@Resource
	UserService userService;

	@Resource
	CorpusService corpusService;

	@Resource
	FocusUserService focusUserService;

	@Resource
	FocusCorpusService focusCorpusService;

	@RequestMapping(value = "following")
	public String goToFollowing(String userName, HttpServletRequest request,
			HttpSession session) {
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		User user = userService.selectByUserName(userName);
		int userFocusNumber = user.getUserFocusCorpusNumber()
				+ user.getUserFocusUserNumber();
		user.setUserFocusNumber(userFocusNumber);
		if (userNameInSession != null) {
			user.setIsFocused(focusUserService.isFocused(user.getId(),
					userNameInSession));
		}
		List<Integer> intList = focusUserService
				.selectFocusUserIdByUserName(userName);
		List<User> userList = new ArrayList<User>();
		for (int i = 0; i < intList.size(); i++) {
			User user2 = userService.selectByUserId(intList.get(i));
			if (userNameInSession != null) {
				user2.setIsFocused(focusUserService.isFocused(user2.getId(),
						userNameInSession));
			}
			userList.add(user2);

		}
		List<Corpus> corpusList = corpusService
				.selectCorpusByUserName(userName);
		request.setAttribute("user", user);
		request.setAttribute("userList", userList);
		request.setAttribute("corpusList", corpusList);
		return "following";
	}

	@RequestMapping(value = "follower")
	public String goToFollower(String userName, HttpServletRequest request,
			HttpSession session) {
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		User user = userService.selectByUserName(userName);
		int userFocusNumber = user.getUserFocusCorpusNumber()
				+ user.getUserFocusUserNumber();
		user.setUserFocusNumber(userFocusNumber);
		if (userNameInSession != null) {
			user.setIsFocused(focusUserService.isFocused(user.getId(),
					userNameInSession));
		}
		List<String> stringList = focusUserService
				.selectUserNameByFocusUserId(user.getId());
		List<User> userList = new ArrayList<User>();
		for (int i = 0; i < stringList.size(); i++) {
			User user2 = userService.selectByUserName(stringList.get(i));
			if (userNameInSession != null) {
				user2.setIsFocused(focusUserService.isFocused(user2.getId(),
						userNameInSession));
			}
			userList.add(user2);
		}
		List<Corpus> corpusList = corpusService
				.selectCorpusByUserName(userName);
		request.setAttribute("user", user);
		request.setAttribute("userList", userList);
		request.setAttribute("corpusList", corpusList);
		return "follower";
	}

	@RequestMapping(value = "subscription")
	public String goToSubscription(String userName, HttpServletRequest request,
			HttpSession session) {
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		User user = userService.selectByUserName(userName);
		int userFocusNumber = user.getUserFocusCorpusNumber()
				+ user.getUserFocusUserNumber();
		user.setUserFocusNumber(userFocusNumber);
		if (userNameInSession != null) {
			user.setIsFocused(focusUserService.isFocused(user.getId(),
					userNameInSession));
		}
		List<Corpus> corpusList = corpusService
				.selectCorpusByUserName(userName);
		List<Integer> intList = focusCorpusService
				.selectCorpusIdByUserName(userName);
		List<Corpus> corpusFocusList = new ArrayList<Corpus>();
		for (int i = 0; i < intList.size(); i++) {
			Corpus corpus = corpusService.selectCorpusById(intList.get(i));
			if (userNameInSession != null) {
				corpus.setIsUserFocused(focusCorpusService.isFocusCorpused(
						intList.get(i), userNameInSession));
			} else {
				corpus.setIsUserFocused(false);
			}
			corpusFocusList.add(corpus);
		}
		request.setAttribute("user", user);
		request.setAttribute("corpusList", corpusList);
		request.setAttribute("corpusFocusList", corpusFocusList);
		return "subscription";
	}

	@RequestMapping(value = "subscriber")
	public String goToSubscriber(String corpusId, HttpServletRequest request,
			HttpSession session) {
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		Corpus corpus = corpusService.selectCorpusById(Integer
				.valueOf(corpusId));
		List<String> stringList = focusCorpusService
				.selectUserNameByCorpusId(Integer.valueOf(corpusId));
		List<User> userList = new ArrayList<User>();
		for (int i = 0; i < stringList.size(); i++) {
			User user = userService.selectByUserName(stringList.get(i));
			if (userNameInSession != null) {
				user.setIsFocused(focusUserService.isFocused(user.getId(),
						userNameInSession));
			}
			userList.add(user);
		}
		User user = userService.selectByUserName(corpus.getUserName());
		request.setAttribute("user", user);
		request.setAttribute("corpus", corpus);
		request.setAttribute("userList", userList);
		return "subscriber";
	}

	@ResponseBody
	@RequestMapping(value = "getUserFocus.do", produces = "application/json")
	public ResultDTO getUserFocus(String userName, HttpSession session) {
		ResultDTO result = new ResultDTO();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		List<Integer> intList = focusUserService
				.selectFocusUserIdByUserName(userNameInSession);
		List<User> userList = new ArrayList<>();
		for (int i = 0; i < intList.size(); i++) {
			User user = userService.selectByUserId(intList.get(i));
			if (user != null) {
				if (userNameInSession != null) {
					user.setIsFocused(focusUserService.isFocused(user.getId(),
							userNameInSession));
				}
				userList.add(user);
			}
		}
		result.setUserList(userList);
		result.setSuccess(true);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "getUserFans.do", produces = "application/json")
	public ResultDTO getUserFans(String userName, HttpSession session) {
		ResultDTO result = new ResultDTO();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		User user = userService.selectByUserName(userName);
		List<String> stringList = focusUserService
				.selectUserNameByFocusUserId(user.getId());
		List<User> userList = new ArrayList<>();
		for (int i = 0; i < stringList.size(); i++) {
			user = userService.selectByUserName(stringList.get(i));
			if (user != null) {
				if (userNameInSession != null) {
					user.setIsFocused(focusUserService.isFocused(user.getId(),
							userNameInSession));
				}
				userList.add(user);
			}
		}
		result.setUserList(userList);
		result.setSuccess(true);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "addFocus.do", produces = "application/json")
	public ResultDTO addFocus(String focusUserId, HttpSession session) {
		ResultDTO result = new ResultDTO();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		if (focusUserId != null && userNameInSession != null) {
			userService.addUserFocusUserNumber(userNameInSession);
			userService.addUserFansNumber(focusUserId);
			focusUserService.insertFocus(focusUserId, userNameInSession);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "removeFocus.do", produces = "application/json")
	public ResultDTO removeFocus(String focusUserId, HttpSession session) {
		ResultDTO result = new ResultDTO();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		if (focusUserId != null && userNameInSession != null) {
			userService.subUserFocusUserNumber(userNameInSession);
			userService.subUserFansNumber(focusUserId);
			focusUserService.deleteById(focusUserId, userNameInSession);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "addFocusCorpus.do", produces = "application/json")
	public ResultDTO addFocusCorpus(String corpusId, HttpSession session) {
		ResultDTO result = new ResultDTO();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		if (corpusId != null && userNameInSession != null) {
			userService.addUserFocusCorpusNumber(userNameInSession);
			corpusService.addUserFocusNumberById(corpusId);
			focusCorpusService.insertFocusCorpus(corpusId, userNameInSession);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "removeFocusCorpus.do", produces = "application/json")
	public ResultDTO removeFocusCorpus(String corpusId, HttpSession session) {
		ResultDTO result = new ResultDTO();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		if (corpusId != null && userNameInSession != null) {
			userService.subUserFocusCorpusNumber(userNameInSession);
			corpusService.subUserFocusNumberById(corpusId);
			focusCorpusService.deleteFocusCorpus(corpusId, userNameInSession);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}
}
