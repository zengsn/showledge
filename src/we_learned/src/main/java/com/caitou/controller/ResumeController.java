package com.caitou.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caitou.bean.Essay;
import com.caitou.bean.Label;
import com.caitou.bean.User;
import com.caitou.common.CheckUtil;
import com.caitou.common.CountUtil;
import com.caitou.dto.LabelData;
import com.caitou.service.EssayService;
import com.caitou.service.LabelService;
import com.caitou.service.UserService;

@Controller
public class ResumeController {

	@Resource
	UserService userService;

	@Resource
	EssayService essayService;

	@Resource
	LabelService labelService;

	@RequestMapping(value = "/resume/{userId}")
	public String initResume(@PathVariable("userId") int userId, Model model) {
		User user = userService.getUserByUserId(userId);
		if (user != null) {
			List<Label> labelList = labelService.getLabelByUserId(userId);
			ArrayList<String> thirdLabelArrayList = new ArrayList<String>();
			Map<String, ArrayList<String>> secondLabelToThirdLabelMap = new LinkedHashMap<String, ArrayList<String>>();

			// 得出二级标签下所有的三级标签,并与之一一对应
			for (int i = 0; i < labelList.size(); i++) {
				Label label = labelList.get(i);
				if (secondLabelToThirdLabelMap.isEmpty()) {
					ArrayList<String> thirdLabelArrayList2 = new ArrayList<String>();
					thirdLabelArrayList2.add(label.getThirdLabel());
					secondLabelToThirdLabelMap.put(label.getSecondLabel(),
							thirdLabelArrayList2);
				} else {
					boolean isExist = false;
					for (Entry<String, ArrayList<String>> entry : secondLabelToThirdLabelMap
							.entrySet()) {
						if (entry.getKey().equals(label.getSecondLabel())) {
							ArrayList<String> thirdLabelArrayList3 = entry
									.getValue();
							boolean isExist2 = false;
							for (int j = 0; j < thirdLabelArrayList3.size(); j++) {
								if (thirdLabelArrayList3.get(j).equals(
										label.getThirdLabel())) {
									isExist2 = true;
									j = thirdLabelArrayList3.size();
								}
							}
							if (!isExist2) {
								thirdLabelArrayList3.add(label.getThirdLabel());
							}
							secondLabelToThirdLabelMap.put(entry.getKey(),
									thirdLabelArrayList3);
							isExist = true;
						}
					}
					if (!isExist) {
						ArrayList<String> thirdLabelArrayList2 = new ArrayList<String>();
						thirdLabelArrayList2.add(label.getThirdLabel());
						secondLabelToThirdLabelMap.put(label.getSecondLabel(),
								thirdLabelArrayList2);
					}
				}
				thirdLabelArrayList = CheckUtil.checkIfContainString(
						thirdLabelArrayList, label.getThirdLabel());
			}

			// 得出该三级标签下每个对应的文章 —— essayMap
			Map<String, List<Essay>> essayMap = new LinkedHashMap<String, List<Essay>>();
			for (int i = 0; i < thirdLabelArrayList.size(); i++) {
				List<Essay> essayList = new ArrayList<Essay>();
				List<Label> labelList2 = labelService.getLabelByThirdLabel(
						userId, thirdLabelArrayList.get(i));
				for (int j = 0; j < labelList2.size(); j++) {
					Essay essay = essayService.getEssayById(labelList2.get(j)
							.getEssayId());
					essayList.add(essay);
				}
				essayMap.put(thirdLabelArrayList.get(i), essayList);
			}

			// 得出用户所创建的所有三级标签下总的喜欢数,阅读数 —— thirdLabelMap
			Map<String, LabelData> thirdLabelMap = new LinkedHashMap<String, LabelData>();
			for (Entry<String, List<Essay>> entry : essayMap.entrySet()) {
				List<Essay> essayList = entry.getValue();
				LabelData labelData2 = new LabelData();
				for (int i = 0; i < essayList.size(); i++) {
					Essay essay = essayList.get(i);
					int essayGoodNumber = 0;
					int essayReadingNumber = 0;
					if (essay != null) {
						essayGoodNumber = essay.getEssayGoodNumber();
						essayReadingNumber = essay.getEssayReadingNumber();
					}
					if (i == 0) {
						labelData2.setLabelGoodNumber(essayGoodNumber);
						labelData2.setLabelReadingNumber(essayReadingNumber);
					} else {
						int labelGoodNumber = labelData2.getLabelGoodNumber();
						int labelReadingNumber = labelData2
								.getLabelReadingNumber();
						labelData2.setLabelGoodNumber(labelGoodNumber
								+ essayGoodNumber);
						labelData2.setLabelReadingNumber(labelReadingNumber
								+ essayReadingNumber);
					}
				}
				double labelSkillPercentage = ((labelData2.getLabelGoodNumber() + labelData2
						.getLabelReadingNumber() * 0.5) * 0.7 + essayList
						.size() * 100) * 0.01;
				labelData2.setLabelSkillPercentage(labelSkillPercentage);
				thirdLabelMap.put(entry.getKey(), labelData2);
			}

			// 根据二级标签与三级标签的对应关系,匹配二级标签对应的 thirdLabelMap ,得出 labelMap
			Map<String, Map<String, LabelData>> labelMap = new LinkedHashMap<String, Map<String, LabelData>>();
			for (Entry<String, ArrayList<String>> entry : secondLabelToThirdLabelMap
					.entrySet()) {
				Map<String, LabelData> thirdLabelMap2 = new LinkedHashMap<String, LabelData>();
				for (int i = 0; i < entry.getValue().size(); i++) {
					for (Entry<String, LabelData> entry2 : thirdLabelMap
							.entrySet()) {
						if (entry2.getKey().equals(entry.getValue().get(i))) {
							thirdLabelMap2.put(entry2.getKey(),
									entry2.getValue());
						}
					}
				}
				labelMap.put(entry.getKey(), thirdLabelMap2);
			}

			user.setUserFormatCreateTime(CountUtil
					.formatUserTimestampInTimeLine(user.getUserCreateTime()));
			user.setUserLevel(CountUtil.countUserLevel(user));
			model.addAttribute("user", user);
			model.addAttribute("essayMap", essayMap);
			model.addAttribute("labelMap", labelMap);

			return "resume";
		} else {
			return "404";
		}
	}
}
