package com.caitou.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Comment;
import com.caitou.bean.Corpus;
import com.caitou.bean.Dynamic;
import com.caitou.bean.Essay;
import com.caitou.bean.KMap;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.common.HtmlUtil;
import com.caitou.dto.AjaxResult;
import com.caitou.service.CollectService;
import com.caitou.service.CommentService;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.FavouriteService;
import com.caitou.service.FocusCorpusService;
import com.caitou.service.FocusKmapService;
import com.caitou.service.FocusUserService;
import com.caitou.service.KMapService;
import com.caitou.service.UserService;
import com.caitou.service.inter.DynamicService;
import com.caitou.threadlocal.UserThreadLocal;
import com.github.pagehelper.PageInfo;

/**
 * 用户的个人页面
 * 
 * @author _wind
 *
 */

@Controller
public class UserController {

	public static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
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
	
	@Resource
	FocusKmapService focusKmapService;
	
	@Resource
	private CommentService commentService;
	
	@Autowired
	private DynamicService dynamicService;
	
	
	@RequestMapping(value = "/user")
	public String initUser(Model model, HttpSession session,Integer userId)
			throws UnsupportedEncodingException {
		
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}

		if (userIdInSession != 0) {
			//获取用户
			User user = null;
			if (userId == null || userId.equals("")) {
				user = userService.getUserAndCount(userIdInSession);
			}else{
				user = userService.getUserAndCount(userId);
			}
			
			model.addAttribute("user", user);			
/*			int userFocusNumber = user.getUserFocusCorpusNumber()
					+ user.getUserFocusUserNumber();
			user.setUserFocusNumber(userFocusNumber);
*/
			
			//获取用户的笔记
			List<Essay> essayList = essayService.getEssayByUserIdOrderByTime(user.getId());
			essayList = CountUtil.setSubTimeInEssay(essayList);
			
			//文章简介
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
			//个人笔记列表
			model.addAttribute("essayList", essayList);
			boolean hasMore = essayService.hasMore();
			model.addAttribute("essayHasMore", hasMore);
			
/*			List<Corpus> corpusList = corpusService.getCorpusByUserId(user
					.getId());
			model.addAttribute("corpusList", corpusList);
*/
			
			//获取动态
			PageInfo<Dynamic> dynPage = dynamicService.getDynById(user.getId());
			model.addAttribute("dynPage", dynPage);

			//获取榜样
			PageInfo<User> dyList = userService.getBanYan(user.getId());
			model.addAttribute("dyPage", dyList);
			
			//获取关注者
			PageInfo<User> fmList = userService.getFollowMe(user.getId());
			model.addAttribute("fmPage", fmList);
			
			//我收藏的笔记
			PageInfo<Essay> collectEssayList = essayService.getFollowEssay(user.getId());
			model.addAttribute("cePage", collectEssayList);
			
			//脑图
			PageInfo<KMap> kmapList = kMapService.getKMapByUserId(user.getId());
			model.addAttribute("kmapPage", kmapList);
			
			//推荐关注
			PageInfo<User> userRecPage = userService.getRecUser(UserThreadLocal.getUser().getId());
			model.addAttribute("userRecPage", userRecPage);
			
			if (userId == null || userId.equals("")) {
				return "user";
			}else{
				return "user_other";
			}
		} else {
			return "redirect:/login.do";
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
			return "redirect:/user.do";
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
			
			/*List<KMap> kmapList = kMapService.getKMapByUserId(userId);
			model.addAttribute("kmapList", kmapList);*/
			
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

		List<KMap> kmapList = focusKmapService.queryKmapByUserId(userId);
		
		model.addAttribute("favouriteEssayList", favouriteEssayList);
		model.addAttribute("focusCorpusList", focusCorpusList);
		model.addAttribute("userList", userList);
		model.addAttribute("kmapList", kmapList);
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

	@RequestMapping(value="/user/getComment")
	public @ResponseBody List<Comment> getComment(Integer essayId){
		logger.debug(Boolean.valueOf((commentService == null)).toString());
		logger.debug(String.valueOf(essayId));
		
		return commentService.getCommentByEssayId(essayId);
	}
	
	
	@RequestMapping("/user/changeFocusUser")
	public @ResponseBody AjaxResult<Object> changeFocusUser(Integer userId){
		userService.changeFocusUser(userId);
		
		return new AjaxResult<>(true);
	}
	
	
	
}





























