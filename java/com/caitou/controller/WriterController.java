package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.dto.AjaxResult;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.UserService;

@Controller
public class WriterController {

	@Resource
	EssayService essayService;

	@Resource
	CorpusService corpusService;

	@Resource
	UserService userService;

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
			corpusService.insertCorpus(userIdInSession, corpusName);
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
			int userIdInSession = (int) session.getAttribute("userIdInSession");
			String userNameInSession = (String) session
					.getAttribute("userNameInSession");
			userService.increaseUserEssayNumber(userIdInSession);
			corpusService.increaseEssayNumberById(corpusId);
			essayService.insertEssay(corpusId, userNameInSession);
			List<Essay> essayList = essayService.getEssayByCorpusId(corpusId);
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
		if (session.getAttribute("userIdInSession") != null) {
			int userIdInSession = (int) session.getAttribute("userIdInSession");
			essayService.updateEssay(userIdInSession, essayIdHidden,
					essayTitle, container);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
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
			int userIdInSession = (int) session.getAttribute("userIdInSession");
			userService.reduceUserWordsNumber(userIdInSession, essayId, 0);
			userService.reduceUserEssayNumber(userIdInSession);
			corpusService.reduceEssayWordNumber(corpusId, essayId, 0);
			corpusService.reduceEssayNumberById(corpusId);
			essayService.deleteEssayById(essayId);
			List<Essay> essayList = essayService.getEssayByCorpusId(corpusId);
			return new AjaxResult<List<Essay>>(true, essayList);
		} else {
			return new AjaxResult<List<Essay>>(false);
		}
	}
}
