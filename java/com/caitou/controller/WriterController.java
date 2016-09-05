package com.caitou.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.entity.ResultDTO;
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

	@RequestMapping(value = "writer")
	public String goToWriter(HttpServletRequest request, HttpSession session) {
		String userName = (String) session.getAttribute("userNameInSession");
		if (userName != null) {
			List<Corpus> corpusList = corpusService
					.selectCorpusByUserName(userName);
			request.setAttribute("corpusList", corpusList);
			request.setAttribute("corpusListSize", corpusList.size());
			if (corpusList.size() > 0) {
				List<Essay> essayList = essayService
						.selectEssayByCorpusId(String.valueOf(corpusList.get(0)
								.getId()));
				request.setAttribute("essayList", essayList);
				request.setAttribute("essayListSize", essayList.size());
			}
		} else {
			return "redirect:/login";
		}
		return "writer";
	}

	@ResponseBody
	@RequestMapping(value = "updateEssay.do", produces = "application/json")
	public ResultDTO updateEssay(String essayIdHidden, String essayTitle,
			String container, HttpSession session) throws Exception {
		ResultDTO result = new ResultDTO();
		String userName = (String) session.getAttribute("userNameInSession");
		if (essayIdHidden != null && essayTitle != null && container != null) {
			essayService.updateEssay(userName, essayIdHidden, essayTitle,
					container);
			result.setSuccess(true);
			return result;
		} else {
			result.setSuccess(false);
			return result;
		}
	}

	@ResponseBody
	@RequestMapping(value = "createCorpus.do", produces = "application/json")
	public ResultDTO createCorpus(String corpusName, HttpSession session)
			throws Exception {
		ResultDTO result = new ResultDTO();
		String userName = (String) session.getAttribute("userNameInSession");
		if (corpusName != null && userName != null) {
			corpusService.insertCorpus(corpusName, userName);
			result.setSuccess(true);
			return result;
		} else {
			result.setSuccess(false);
			return result;
		}
	}

	@ResponseBody
	@RequestMapping(value = "createEssay.do", produces = "application/json")
	public ResultDTO createEssay(String corpusId, HttpServletRequest request,
			HttpSession session) throws Exception {
		ResultDTO result = new ResultDTO();
		String userName = (String) session.getAttribute("userNameInSession");
		if (corpusId != null && userName != null) {
			userService.addUserEssayNumber(userName);
			corpusService.addEssayNumberById(corpusId);
			essayService.insertEssay(corpusId, userName);
			List<Essay> essayList = essayService
					.selectEssayByCorpusId(corpusId);
			result.setSuccess(true);
			result.setEssayList(essayList);
			return result;
		} else {
			result.setSuccess(false);
			return result;
		}
	}

	@ResponseBody
	@RequestMapping(value = "selectEssayByCorpusId.do", produces = "application/json")
	public ResultDTO selectEssayByCorpusId(String corpusId,
			HttpServletRequest request, HttpSession session) throws Exception {
		ResultDTO result = new ResultDTO();
		if (corpusId != null) {
			List<Essay> essayList = essayService
					.selectEssayByCorpusId(corpusId);
			result.setSuccess(true);
			result.setEssayList(essayList);
			return result;
		} else {
			result.setSuccess(false);
			return result;
		}
	}

	@ResponseBody
	@RequestMapping(value = "selectEssayById.do", produces = "application/json")
	public ResultDTO selectEssayById(String essayId,
			HttpServletRequest request, HttpSession session) throws Exception {
		ResultDTO result = new ResultDTO();
		if (essayId != null) {
			Essay essay = essayService.selectEssayById(essayId);
			result.setSuccess(true);
			result.setEssay(essay);
			return result;
		} else {
			result.setSuccess(false);
			return result;
		}
	}

	@ResponseBody
	@RequestMapping(value = "deleteCorpusById.do", produces = "application/json")
	public ResultDTO deleteCorpusById(String corpusId,
			HttpServletRequest request, HttpSession session) throws Exception {
		ResultDTO result = new ResultDTO();
		if (corpusId != null) {
			corpusService.deleteCorpusById(corpusId);
			result.setSuccess(true);
			return result;
		} else {
			result.setSuccess(false);
			return result;
		}
	}

	@ResponseBody
	@RequestMapping(value = "deleteEssayById.do", produces = "application/json")
	public ResultDTO deleteEssayById(String corpusId, String essayId,
			HttpServletRequest request, HttpSession session) throws Exception {
		ResultDTO result = new ResultDTO();
		String userName = (String) session.getAttribute("userNameInSession");
		if (essayId != null) {
			userService.subUserWordsNumber(userName, essayId);
			userService.subUserEssayNumber(userName);
			corpusService.subEssayNumberById(corpusId);
			essayService.deleteEssayById(essayId);
			List<Essay> essayList = essayService
					.selectEssayByCorpusId(corpusId);
			result.setSuccess(true);
			result.setEssayList(essayList);
			return result;
		} else {
			result.setSuccess(false);
			return result;
		}
	}

	@ResponseBody
	@RequestMapping(value = "updateCorpusName.do", produces = "application/json")
	public ResultDTO updateCorpusName(String corpusId, String newCorpusName,
			HttpServletRequest request, HttpSession session) throws Exception {
		ResultDTO result = new ResultDTO();
		if (corpusId != null && newCorpusName != null) {
			corpusService.updateCorpusById(corpusId, newCorpusName);
			result.setSuccess(true);
			return result;
		} else {
			result.setSuccess(false);
			return result;
		}
	}
}
