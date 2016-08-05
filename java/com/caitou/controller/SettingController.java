package com.caitou.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.caitou.common.FileUploadUtil;

@Controller
public class SettingController {

	@RequestMapping(value = "setting")
	public String goToSetting() {
		return "setting";
	}

	@RequestMapping(value = "uploadHeadImage.do", method = RequestMethod.POST)
	public String uploadHeadImage(HttpServletRequest request,
			@RequestParam(value = "imgFile") MultipartFile imageFile)
			throws Exception {
		System.out.println("==========Start=============");
		String realPath = request.getSession().getServletContext()
				.getRealPath("/");
		String resourcePath = "images/uploadImages/";
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
				File file = new File(dir, saveName + "_src.jpg");
				imageFile.transferTo(file);
				// String srcImagePath = realPath + resourcePath + saveName;
				System.out.println("==========End=============");
				request.setAttribute("imgSrc", resourcePath + saveName
						+ "_src.jpg");// 成功之后显示用
			}
		}
		return "setting";
	}
}
