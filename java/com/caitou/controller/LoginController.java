package com.caitou.controller;

import java.awt.image.BufferedImage;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.caitou.entity.ResultDTO;
import com.caitou.entity.User;
import com.caitou.service.UserService;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

@Controller
public class LoginController {

	@Autowired
	private Producer captchaProducer = null;

	@Resource
	UserService userService;

	@RequestMapping(value = "login")
	public String goToLogin() {
		return "login";
	}

	@ResponseBody
	@RequestMapping(value = "checkLogin.do", produces = "application/json")
	public ResultDTO checkLogin(String userEmail, String userPassword,
			String kaptcha, HttpServletRequest request, HttpSession session)
			throws Exception {
		ResultDTO result = new ResultDTO();
		User user = new User();
		user.setUserEmail(userEmail);
		user.setUserPassword(userPassword);
		String code = (String) request.getSession().getAttribute(
				com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if (!kaptcha.equals(code)) {
			result.setSuccess(false);
			result.setMessage("code"); // 说明是验证码错误
			return result;
		}
		if (userService.checkLogin(user)) {
			String userName = userService.getUserNameByUserEmail(user);
			session.setAttribute("userNameInSession", userName);
			String userImagePath = userService.selectByUserName(userName)
					.getUserImagePath();
			session.setAttribute("userImagePathInSession", userImagePath);
			// 设置session有效时间为无限长
			session.setMaxInactiveInterval(0);
			result.setSuccess(true);
			return result;
		} else {
			result.setSuccess(false);
			result.setMessage("userFalse"); // 说明是用户名或密码错误
			return result;
		}
	}

	@RequestMapping("getKaptchaImage.do")
	public ModelAndView getKaptchaImage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String code = (String) session
				.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		System.out.println("******************验证码是: " + code
				+ "******************");

		response.setDateHeader("Expires", 0);

		// Set standard HTTP/1.1 no-cache headers.
		response.setHeader("Cache-Control",
				"no-store, no-cache, must-revalidate");

		// Set IE extended HTTP/1.1 no-cache headers (use addHeader).
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");

		// Set standard HTTP/1.0 no-cache header.
		response.setHeader("Pragma", "no-cache");

		// return a jpeg
		response.setContentType("image/jpeg");

		// create the text for the image
		String capText = captchaProducer.createText();

		// store the text in the session
		session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);

		// create the image with the text
		BufferedImage bi = captchaProducer.createImage(capText);
		ServletOutputStream out = response.getOutputStream();

		// write the data out
		ImageIO.write(bi, "jpg", out);
		try {
			out.flush();
		} finally {
			out.close();
		}
		return null;
	}
}
