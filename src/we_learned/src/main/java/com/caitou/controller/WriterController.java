package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.bean.Label;
import com.caitou.dto.AjaxResult;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.FocusCorpusService;
import com.caitou.service.FocusMessageService;
import com.caitou.service.FocusUserService;
import com.caitou.service.LabelService;
import com.caitou.service.UserService;

@Controller
public class WriterController {

	@Resource
	EssayService essayService;

	@Resource
	CorpusService corpusService;

	@Resource
	UserService userService;

	@Resource
	LabelService labelService;

	@Resource
	FocusUserService focusUserService;

	@Resource
	FocusCorpusService focusCorpusService;

	@Resource
	FocusMessageService focusMessageService;

	@RequestMapping(value = "/writer", method = RequestMethod.GET)
	public String initWriter(Model model, HttpSession session) {
		if (session.getAttribute("userIdInSession") != null) {
			int userIdInSession = (int) session.getAttribute("userIdInSession");
			List<Corpus> corpusList = corpusService
					.getCorpusByUserId(userIdInSession);
			model.addAttribute("corpusList", corpusList);
			model.addAttribute("corpusListSize", corpusList.size());
			if (corpusList.size() > 0) {
				List<Essay> essayList = essayService
						.getEssayByCorpusId(corpusList.get(0).getId());
				model.addAttribute("essayList", essayList);
				model.addAttribute("essayListSize", essayList.size());
			}
			return "writer";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/writer/createCorpus", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> createCorpus(String corpusName,
			HttpSession session) throws Exception {
		if (session.getAttribute("userIdInSession") != null) {
			int userIdInSession = (int) session.getAttribute("userIdInSession");
			int corpusId = corpusService.insertCorpus(userIdInSession,
					corpusName);
			corpusService.updateCorpusImageById(corpusId,
					"images/uploadImages/corpusHeadImage/default.png");
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}

	@RequestMapping(value = "/writer/createEssay", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<List<Essay>> createEssay(int corpusId, HttpSession session)
			throws Exception {
		if (session.getAttribute("userIdInSession") != null) {
			int userId = (int) session.getAttribute("userIdInSession");
			essayService.insertEssay(corpusId, userId);
			List<Essay> essayList = essayService.getEssayByCorpusId(corpusId);
			Essay essay = essayList.get(0);
			int essayId = essay.getId();
			labelService.insertLabel(userId, essayId, "", "", "");
			Label label = new Label();
			label.setFirstLabel("");
			label.setSecondLabel("");
			label.setThirdLabel("");
			essay.setLabel(label);
			return new AjaxResult<List<Essay>>(true, essayList);
		} else {
			return new AjaxResult<List<Essay>>(false);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/writer/updateCorpusName", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	public AjaxResult<Object> updateCorpusName(int corpusId,
			String newCorpusName, HttpServletRequest request,
			HttpSession session) throws Exception {
		if (session.getAttribute("userIdInSession") != null) {
			corpusService.updateCorpusById(Integer.valueOf(corpusId),
					newCorpusName);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}

	@RequestMapping(value = "/writer/updateEssay", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> updateEssay(int essayIdHidden, String essayTitle,
			String container, HttpSession session) throws Exception {
		if (session.getAttribute("userIdInSession") != null) {	// 判断用户是否已经登录
			Label label = labelService.getLabelByEssayId(essayIdHidden);
			if (!label.getFirstLabel().isEmpty()
					&& !label.getSecondLabel().isEmpty()
					&& !label.getThirdLabel().isEmpty()) {  // 判断用户是否已经选择标签
				int userIdInSession = (int) session.getAttribute("userIdInSession");
				Essay essay = essayService.updateEssay(userIdInSession,
						essayIdHidden, essayTitle, container);  // 更新文章内容
				List<Integer> userIdList = focusUserService.
				        getUserIdByFocusUserId(userIdInSession);
				for (int i = 0; i < userIdList.size(); i++) {  // 给关注此用户的用户发送更新信息
					focusMessageService.insertFocusUserEssayMessage(
							userIdList.get(i), essay.getUserId(),
							essay.getUserName(), essay.getId(),
							essay.getEssayTime());
				}
				List<Integer> userIdList2 = focusCorpusService.
				        getCorpusIdByUserId(userIdInSession);
				for (int i = 0; i < userIdList2.size(); i++) {  // 给关注此文集的用户发送更新信息
					focusMessageService.insertFocusCorpusMessage(
							userIdList2.get(i), essay.getCorpusId(),
							essay.getCorpusName(), essay.getId(), essayTitle,
							essay.getEssayTime());
				}
				return new AjaxResult<Object>(true);
			} else {
				return new AjaxResult<Object>(false, "" + essayIdHidden);
			}
		} else {
			return new AjaxResult<Object>(false, "0");
		}
	}

	@RequestMapping(value = "/writer/getEssayByCorpusId", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<List<Essay>> getEssayByCorpusId(int corpusId,
			HttpSession session) throws Exception {
		if (session.getAttribute("userIdInSession") != null) {
			List<Essay> essayList = essayService.getEssayByCorpusId(corpusId);
			return new AjaxResult<List<Essay>>(true, essayList);
		} else {
			return new AjaxResult<List<Essay>>(false);
		}
	}

	@RequestMapping(value = "/writer/selectLabel", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> selectLabel(int essayId, String firstLabel,
			String secondLabel, String thirdLabel, HttpSession session)
			throws Exception {
		if (session.getAttribute("userIdInSession") != null) {
			labelService.updateLabelByEssayId(essayId, firstLabel, secondLabel,
					thirdLabel);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}

	@RequestMapping(value = "/writer/getEssayContentByEssayId", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Essay> getEssayContentByEssayId(int essayId,
			HttpSession session) throws Exception {
		if (session.getAttribute("userIdInSession") != null) {
			Essay essay = essayService.getEssayById(essayId);
			return new AjaxResult<Essay>(true, essay);
		} else {
			return new AjaxResult<Essay>(false);
		}
	}

	@RequestMapping(value = "/writer/deleteCorpusById", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	@Transactional
	public AjaxResult<Object> deleteCorpusById(int corpusId, HttpSession session)
			throws Exception {
		if (session.getAttribute("userIdInSession") != null) {
			corpusService.deleteCorpusById(corpusId);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}

	@RequestMapping(value = "/writer/deleteEssayById", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<List<Essay>> deleteEssayById(int corpusId, int essayId,
			HttpSession session) throws Exception {
		if (session.getAttribute("userIdInSession") != null) {
			essayService.deleteEssayById(essayId);
			List<Essay> essayList = essayService.getEssayByCorpusId(corpusId);
			return new AjaxResult<List<Essay>>(true, essayList);
		} else {
			return new AjaxResult<List<Essay>>(false);
		}
	}
}
