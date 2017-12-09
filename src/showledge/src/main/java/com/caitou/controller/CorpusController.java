package com.caitou.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.bean.User;
import com.caitou.common.CountUtil;
import com.caitou.common.FileUploadUtil;
import com.caitou.common.HtmlUtil;
import com.caitou.dto.AjaxResult;
import com.caitou.service.CorpusService;
import com.caitou.service.EssayService;
import com.caitou.service.FocusCorpusService;
import com.caitou.service.UserService;

@Controller
public class CorpusController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	CorpusService corpusService;

	@Resource
	FocusCorpusService focusCorpusService;

	@RequestMapping(value = "/notebooks/{corpusId}/latest", method = RequestMethod.GET)
	public String initCorpus(@PathVariable("corpusId") int corpusId,
			Model model, HttpSession session)
			throws UnsupportedEncodingException {
		int userIdInSession = 0;
		if (session.getAttribute("userIdInSession") != null) {
			userIdInSession = (int) session.getAttribute("userIdInSession");
		}
		List<Essay> essayList = essayService.getEssayByCorpusId(corpusId);
		essayList = CountUtil.setSubTimeInEssay(essayList);

		List<Essay> essayListOrderByTime = new ArrayList<Essay>();
		List<Essay> essayListOrderByFame = new ArrayList<Essay>();
		if (essayList != null) {
			// 文章列表按照时间排序
			for (Essay essay : essayList) {
				Essay essay2 = essay;
				String essayContent = essay2.getEssayContent();
				essayContent = HtmlUtil.getTextFromTHML(essayContent);
				essayContent = CountUtil.cutString(essayContent, 180) + "...";
				essay2.setEssayContent(essayContent);
				User user = userService.getUserByUserName(essay2.getUserName());
				essay2.setUserImagePath(user.getUserImagePath());
				essayListOrderByTime.add(essay2);
			}

			// 文章列表按照热度排序
			if (essayListOrderByTime.size() == 1) {
				essayListOrderByFame = essayListOrderByTime;
			} else {
				for (int i = 0; i < essayListOrderByTime.size(); i++) {
					Essay essay = essayListOrderByTime.get(i);
					int essayReadingNumberByTime = essay
							.getEssayReadingNumber();
					int essayCommentNumberByTime = essay
							.getEssayCommentNumber();
					int essayGoodNumberByTime = essay.getEssayGoodNumber();
					int famousGradeByTime = essayReadingNumberByTime
							+ essayCommentNumberByTime + essayGoodNumberByTime;
					if (i == 0) {
						essayListOrderByFame.add(essay);
					} else {
						int essayListOrderByFameSize = essayListOrderByFame
								.size();
						for (int j = 0; j < essayListOrderByFameSize; j++) {
							int essayReadingNumberByFame = essayListOrderByFame
									.get(j).getEssayReadingNumber();
							int essayCommentNumberByFame = essayListOrderByFame
									.get(j).getEssayCommentNumber();
							int essayGoodNumberByFame = essayListOrderByFame
									.get(j).getEssayGoodNumber();
							int famousGradeByFame = essayReadingNumberByFame
									+ essayCommentNumberByFame
									+ essayGoodNumberByFame;
							if (famousGradeByTime > famousGradeByFame) {
								essayListOrderByFame.add(j, essay);
								j = essayListOrderByFameSize;
							}
							if (j == essayListOrderByFameSize - 1) {
								essayListOrderByFame.add(essay);
								j = essayListOrderByFameSize;
							}
						}
					}
				}
			}
		}

		Corpus corpus = corpusService.getCorpusById(corpusId);
		User user = userService.getUserByUserId(corpus.getUserId());
		corpus.setUserName(user.getUserName());
		corpus.setUserImagePath(user.getUserImagePath());
		if (userIdInSession != 0) {
			user = userService.getUserByUserId(userIdInSession);
			user.setIsFocused(focusCorpusService.isFocusCorpused(corpusId,
					userIdInSession));
		} else {
			user.setIsFocused(false);
		}

		model.addAttribute("user", user);
		model.addAttribute("essayListOrderByTime", essayListOrderByTime);
		model.addAttribute("essayListOrderByFame", essayListOrderByFame);
		model.addAttribute("corpus", corpus);
		return "corpus";
	}

	@RequestMapping(value = "/corpus/addFocusCorpus", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
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

	@RequestMapping(value = "/corpus/removeFocusCorpus", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
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

	@RequestMapping(value = "/corpus/{corpusId}/settings", method = RequestMethod.GET)
	public String initCorpusSetting(@PathVariable("corpusId") int corpusId,
			Model model, HttpSession session) {
		Corpus corpus = corpusService.getCorpusById(corpusId);
		if (session.getAttribute("userIdInSession") != null) {
			int userIdInSession = (int) session.getAttribute("userIdInSession");
			if (userIdInSession != corpus.getUserId()) {
				return "404";
			}
			model.addAttribute("corpus", corpus);
			return "corpus-setting";
		} else {
			return "404";
		}
	}

	@RequestMapping(value = "/corpus/uploadHeadImage/{corpusId}", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public void uploadHeadImage(@PathVariable("corpusId") int corpusId,
			Model model, HttpSession session,
			@RequestParam(required = false) MultipartFile imgFile)
			throws Exception {
		if (imgFile != null && !imgFile.isEmpty()) {
			String realPath = session.getServletContext().getRealPath("/");
			String resourcePath = "images/uploadImages/corpusHeadImage/";
			Corpus corpus = corpusService.getCorpusById(corpusId);
			String deleteImgPath = realPath + corpus.getCorpusImagePath();
			File file = new File(deleteImgPath);
			if (!corpus.getCorpusImagePath().equals(
					"images/uploadImages/corpusHeadImage/default.png")) {
				if (file.isFile() && file.exists()) {
					file.delete();
				}
			}
			if (imgFile != null) {
				if (FileUploadUtil.allowUpload(imgFile.getContentType())) {
					String fileName = FileUploadUtil.rename(imgFile
							.getOriginalFilename());
					int end = fileName.lastIndexOf(".");
					String saveName = fileName.substring(0, end);
					File dir = new File(realPath + resourcePath);
					if (!dir.exists()) {
						dir.mkdirs();
					}
					file = new File(dir, saveName + "_src.jpg");
					imgFile.transferTo(file);
					String srcImagePath = resourcePath + saveName + "_src.jpg";
					corpusService.updateCorpusImageById(corpusId, srcImagePath);
				}
			}
		}
	}

	@RequestMapping(value = "/corpus/updateCorpusSetting", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> updateCorpusSetting(int corpusId,
			String corpusName, String corpusDiscribe) {
		Corpus corpus = corpusService.getCorpusById(corpusId);
		if (corpus != null) {
			corpusService.updateCorpusById(corpusId, corpusName);
			corpusService.updateCorpusDiscribeById(corpusId, corpusDiscribe);
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}
}
