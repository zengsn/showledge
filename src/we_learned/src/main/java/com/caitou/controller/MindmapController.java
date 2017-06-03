package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.KMap;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.dto.AjaxResult;
import com.caitou.service.FocusKmapService;
import com.caitou.service.FocusMessageService;
import com.caitou.service.FocusUserService;
import com.caitou.service.KMapService;
import com.caitou.service.UserService;

@Controller
public class MindmapController {

	@Resource
	UserService userService;

	@Resource
	KMapService kMapService;

	@Resource
	FocusKmapService focusKmapService;

	@Resource
	FocusUserService focusUserService;

	@Resource
	FocusMessageService focusMessageService;

	@RequestMapping(value = "/mindmap/{kMapId}", method = RequestMethod.GET)
	public String initMindmap(@PathVariable("kMapId") int kMapId, Model model,
			HttpSession session) {
		KMap kMap = kMapService.getOneKMapById(kMapId);
		int userIdInSession = 0;
		if (kMap != null) {
			if (session.getAttribute("userIdInSession") != null) {
				userIdInSession = (int) session.getAttribute("userIdInSession");
			}
			if (userIdInSession == kMap.getUserId()) {
				model.addAttribute("kMap", kMap);
				return "edit-mindmap";
			} else {
				kMapService.increaseKMapLookNumberById(kMapId);
				if (!focusKmapService.queryKmapByUserId(userIdInSession)
						.isEmpty()) {
					kMap.setIsLike(true);
				} else {
					kMap.setIsLike(false);
				}
				model.addAttribute("kMap", kMap);
				return "mindmap";
			}
		} else {
			return "404";
		}
	}

	@RequestMapping(value = "/newmindmap", method = RequestMethod.GET)
	public String initNewMindmap(Model model, HttpSession session) {
		if (session.getAttribute("userIdInSession") != null) {
			int userId = (int) session.getAttribute("userIdInSession");
			KMap kMap = new KMap();
			kMap.setKmapFormat("node_tree");
			String data = "{\"id\":\"root\",\"topic\":\"jsMind\",\"expanded\":true}";
			kMap.setKmapData(data.replaceAll("\\\\", ""));

			User user = userService.getUserByUserId(userId);

			model.addAttribute("user", user);
			model.addAttribute("kMap", kMap);
			return "new-mindmap";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/mindmap/updateKMapData", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> updateKMapData(int kmapId, String data,
			HttpSession session) throws Exception {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {  // 判断用户是否登录
			userIdInSession = (int) session.getAttribute("userIdInSession");
			String userNameInSession = (String) session
					.getAttribute("userNameInSession");
			JSONObject jsonObject = JSONObject.fromObject(data);
			String kmapFormat = "node_tree";
			String kmapData = jsonObject.get("data").toString();  // 解析页面传过来的用户数据
			kMapService
			        .updateKMapDataById(kmapId, kmapData, kmapFormat);  // 将用户数据存入数据库

			List<Integer> userIdList = focusUserService
					.getUserIdByFocusUserId(userIdInSession);
			for (int i = 0; i < userIdList.size(); i++) {  // 给关注此用户的用户发送更新信息
				focusMessageService.insertFocusUserKmapMessage(
						userIdList.get(i), userIdInSession, userNameInSession,
						kmapId, CountUtil.getTime());
			}

			return new AjaxResult<Object>(true);
		}
		return new AjaxResult<Object>(false);
	}

	@RequestMapping(value = "/mindmap/updateKMapBasicSetting", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> updateKMapBasicSetting(int kmapId,
			String kmapName, String kmapDescribe, HttpSession session)
			throws Exception {
		if (session.getAttribute("userIdInSession") != null) {
			kMapService.updateKMapBasicSettingById(kmapId, kmapName,
					kmapDescribe);
			return new AjaxResult<Object>(true);
		}
		return new AjaxResult<Object>(false);
	}

	@RequestMapping(value = "/mindmap/insertKMapData", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> insertKMapData(String kmapName,
			String kmapDescribe, String data, HttpSession session)
			throws Exception {
		if (session.getAttribute("userIdInSession") != null) {
			int userId = (int) session.getAttribute("userIdInSession");
			JSONObject jsonObject = JSONObject.fromObject(data);
			String kmapFormat = "node_tree";
			String kmapData = jsonObject.get("data").toString();
			int kmapId = kMapService.insertKMap(userId, kmapName, kmapFormat,
					kmapData, kmapDescribe);
			return new AjaxResult<Object>(true, kmapId);
		}
		return new AjaxResult<Object>(false);
	}

	@RequestMapping(value = "/mindmap/deleteKMap", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> deleteKMap(int kmapId, HttpSession session)
			throws Exception {
		if (session.getAttribute("userIdInSession") != null) {
			int userId = (int) session.getAttribute("userIdInSession");
			KMap kMap = kMapService.getOneKMapById(kmapId);
			if (kMap != null) {
				if (kMap.getUserId() == userId) {
					kMapService.deleteKMap(kmapId);
					return new AjaxResult<Object>(true);
				} else {
					return new AjaxResult<Object>(false);
				}
			} else {
				return new AjaxResult<Object>(false);
			}
		}
		return new AjaxResult<Object>(false);
	}

	@RequestMapping(value = "/mindmap/addFocusKmap", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	@Transactional
	public AjaxResult<Object> addFavourite(int kmapId, HttpSession session)
			throws Exception {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		if (userIdInSession != 0) {
			focusKmapService.insertFocusKmap(userIdInSession, kmapId);
			kMapService.increaseKMapLikeNumberById(kmapId);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}

	@RequestMapping(value = "/mindmap/removeFocusKmap", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	@Transactional
	public AjaxResult<Object> removeFavourite(int kmapId, HttpSession session)
			throws Exception {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		if (userIdInSession != 0) {
			focusKmapService.deleteFocusKmap(userIdInSession, kmapId);
			kMapService.reduceKMapLikeNumberById(kmapId);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}
}
