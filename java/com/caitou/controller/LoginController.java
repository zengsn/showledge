package com.caitou.controller;

import java.awt.image.BufferedImage;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.caitou.bean.User;
import com.caitou.dto.AjaxResult;
import com.caitou.service.UserService;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

@Controller
public class LoginController {

	@Autowired
	private Producer captchaProducer = null;

	@Resource
	UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String initLogin() {
		return "login";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userIdInSession");
		session.removeAttribute("userNameInSession");
		session.removeAttribute("userImagePathInSession");
		return "redirect:/index";
	}

	@RequestMapping(value = "/login/checkLogin", method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public AjaxResult<Object> checkLogin(String userEmail, String userPassword,
			String kaptcha, HttpSession session) throws Exception {
		String code = (String) session
				.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if (!kaptcha.equals(code)) {
			return new AjaxResult<Object>(false, "code"); // 验证码错误
		}
		if (!userService.isExistUserEmail(userEmail)) {
			return new AjaxResult<Object>(false, "userFalse"); // 用户名或密码错误
		}
		if (userService.checkLogin(userEmail, userPassword)) {
			User user = userService.getUserByUserEmail(userEmail);
			session.setAttribute("userIdInSession", user.getId());
			session.setAttribute("userNameInSession", user.getUserName());
			session.setAttribute("userImagePathInSession",
					user.getUserImagePath());
			// 设置session有效时间为无限长
			session.setMaxInactiveInterval(0);
			return new AjaxResult<Object>(true); // 登录成功
		} else {
			return new AjaxResult<Object>(false, "userFalse"); // 用户名或密码错误
		}
	}

	@RequestMapping(value = "/login/getKaptchaImage", method = RequestMethod.GET)
	public ModelAndView getKaptchaImage(HttpServletResponse response,
			HttpSession session) throws Exception {

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
		response.reset(); // 加上这句之后便不会提示IllegalStateException异常

		// write the data out
		ImageIO.write(bi, "jpg", out);

		try {
			out.flush();
		} finally {
			out.close();
			out = null;
		}

		return null;
	}
}
