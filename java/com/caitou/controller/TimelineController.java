package com.caitou.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TimelineController {

	@RequestMapping(value = "/timeline", method = RequestMethod.GET)
	public String initTimeline(Model model, HttpSession session) {
		return "timeline";
	}
}
