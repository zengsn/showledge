package com.caitou.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.caitou.bean.User;
import com.caitou.common.FileUploadUtil;
import com.caitou.dto.AjaxResult;
import com.caitou.service.UserService;

@Controller
public class SettingController {

	@Resource
	UserService userService;

	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String initSetting(Model model, HttpSession session) {
		if (session.getAttribute("userIdInSession") != null) {
			int userIdInSession = (int) session.getAttribute("userIdInSession");
			User user = userService.getUserByUserId(userIdInSession);
			model.addAttribute("user", user);
			return "setting";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/settings/updateBasicSetting", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> updateBasicSetting(String userName,
			String userPhone, String userEmail, HttpSession session) {
		boolean updateUserName = false;
		boolean updateUserPhone = false;
		boolean updateUserEmail = false;
		if (session.getAttribute("userIdInSession") != null) {
			int userIdInSession = (int) session.getAttribute("userIdInSession");
			User user = userService.getUserByUserId(userIdInSession);
			String oldUserName = user.getUserName();
			if (userName != "" && userName != null
					&& !userName.equals(oldUserName)) {
				boolean success = userService.isExistUserName(userName);
				if (success) {
					return new AjaxResult<Object>(false, "昵称已经存在");
				} else {
					updateUserName = true;
				}
			}

			String oldUserPhone = user.getUserPhone();
			if (userPhone != "" && userPhone != null
					&& !userPhone.equals(oldUserPhone)) {
				updateUserPhone = true;
			}

			String oldUserEmail = user.getUserEmail();
			if (userEmail != "" && userEmail != null
					&& !userEmail.equals(oldUserEmail)) {
				boolean success = userService.isExistUserEmail(userEmail);
				if (success) {
					return new AjaxResult<Object>(false, "邮箱已经注册");
				} else {
					updateUserEmail = true;
				}
			}
			if (updateUserName) {
				userService.updateUserName(userIdInSession, userName);
			}
			if (updateUserPhone) {
				userService.updateUserPhone(userIdInSession, userPhone);
			}
			if (updateUserEmail) {
				userService.updateUserEmail(userIdInSession, userEmail);
			}
			return new AjaxResult<Object>(true);
		} else {
			return new AjaxResult<Object>(false);
		}
	}

	@RequestMapping(value = "/settings/uploadHeadImage", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public void uploadHeadImage(Model model, HttpSession session,
			@RequestParam(required = false) MultipartFile imgFile)
			throws Exception {
		if (imgFile != null && !imgFile.isEmpty()) {
			if (session.getAttribute("userIdInSession") != null) {
				int userIdInSession = (int) session
						.getAttribute("userIdInSession");
				String realPath = session.getServletContext().getRealPath("/");
				String resourcePath = "images/uploadImages/userHeadImage/";
				User user = userService.getUserByUserId(userIdInSession);
				String deleteImgPath = realPath + user.getUserImagePath();
				File file = new File(deleteImgPath);
				if (!user.getUserImagePath().equals(
						"images/uploadImages/userHeadImage/default.png")) {
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
						String srcImagePath = resourcePath + saveName
								+ "_src.jpg";
						userService.updateUserImage(userIdInSession,
								srcImagePath);
						user.setUserImagePath(srcImagePath);
						model.addAttribute("user", user);
						session.setAttribute("userImagePathInSession",
								srcImagePath);
					}
				}
			}
		}
	}

	@RequestMapping(value = "/settings/updateIntroduce", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> updateIntroduce(HttpSession session,
			String userIntroduce, String userWeb) throws Exception {
		if (session.getAttribute("userIdInSession") != null) {
			int userId = (int) session.getAttribute("userIdInSession");
			userService.updateUserIntroduce(userId, userIntroduce);
			userService.updateUserWeb(userId, userWeb);
			return new AjaxResult<Object>(true);
		}
		return new AjaxResult<Object>(false);
	}

	@RequestMapping(value = "/settings/updatePassword", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> updatePassword(String oldPassword,
			String newPassword, HttpSession session) {
		if (session.getAttribute("userIdInSession") != null) {
			int userIdInSession = (int) session.getAttribute("userIdInSession");
			User user = userService.getUserByUserId(userIdInSession);
			if ((user.getUserPassword()).equals(oldPassword)) {
				userService.updateUserPassword(userIdInSession, newPassword);
				return new AjaxResult<Object>(true);
			} else {
				return new AjaxResult<Object>(false);
			}
		} else {
			return new AjaxResult<Object>(false);
		}
	}
}