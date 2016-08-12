package com.caitou.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.caitou.common.FileUploadUtil;
import com.caitou.entity.ResultDTO;
import com.caitou.entity.User;
import com.caitou.service.UserService;

@Controller
public class SettingController {

	@Resource
	UserService userService;

	@RequestMapping(value = "setting")
	public String goToSetting(HttpServletRequest request, HttpSession session) {
		String userName = (String) session.getAttribute("userNameInSession");
		User user = userService.getUser(userName);
		request.setAttribute("user", user);
		return "setting";
	}

	@ResponseBody
	@RequestMapping(value = "updateBasicSetting.do", produces = "application/json")
	public ResultDTO updateBasicSetting(String userName, HttpSession session) {
		ResultDTO result = new ResultDTO();
		String oldUserName = (String) session.getAttribute("userNameInSession");
		boolean success = userService.isExistUserName(userName);
		if (success) {
			result.setSuccess(false);
			return result;
		} else {
			userService.updateUserName(oldUserName, userName);
			session.setAttribute("userNameInSession", userName);
			result.setSuccess(true);
			return result;
		}
	}

	@ResponseBody
	@RequestMapping(value = "updatePassword.do", produces = "application/json")
	public ResultDTO updatePassword(String oldPassword, String newPassword,
			HttpSession session) {
		ResultDTO result = new ResultDTO();
		String userName = (String) session.getAttribute("userNameInSession");
		User user = userService.getUser(userName);
		if ((user.getUserPassword()).equals(oldPassword)) {
			user.setUserPassword(newPassword);
			userService.updateUserPassword(user);
			result.setSuccess(true);
			return result;
		} else {
			result.setSuccess(false);
			return result;
		}
	}

	@ResponseBody
	@RequestMapping(value = "uploadHeadImage.do", method = RequestMethod.POST)
	public void uploadHeadImage(HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "imgFile") MultipartFile imageFile)
			throws Exception {
		System.out.println("==========Start=============");
		String realPath = request.getSession().getServletContext()
				.getRealPath("/");
		String resourcePath = "images/uploadImages/";
		String userName = (String) request.getSession().getAttribute(
				"userNameInSession");
		User user = userService.getUser(userName);
		String deleteImgPath = realPath + user.getUserImagePath();
		File file = new File(deleteImgPath);
		if (file.isFile() && file.exists()) {
			file.delete();
		}
		if (imageFile != null) {
			if (FileUploadUtil.allowUpload(imageFile.getContentType())) {
				String fileName = FileUploadUtil.rename(imageFile
						.getOriginalFilename());
				int end = fileName.lastIndexOf(".");
				String saveName = fileName.substring(0, end);
				File dir = new File(realPath + resourcePath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				file = new File(dir, saveName + "_src.jpg");
				imageFile.transferTo(file);
				// String srcImagePath = realPath + resourcePath + saveName;
				/*
				 * request.setAttribute("imgSrc", resourcePath + saveName +
				 * "_src.jpg");// 成功之后显示用
				 */
				String srcImagePath = resourcePath + saveName + "_src.jpg";
				userService.saveUserImage(userName, srcImagePath);
				user = userService.getUser(userName);
				request.setAttribute("user", user);
				System.out.println("==========End=============");
			}
		}
	}
}
