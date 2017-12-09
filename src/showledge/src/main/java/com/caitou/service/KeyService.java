package com.caitou.service;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.ContextLoader;

import com.caitou.bean.Key;

/**
 * 获取key的服务
 * 
 * @author _wind
 *
 */

@Service
public class KeyService {

	public List<Key> getKeys(){
		ServletContext servletContext = ContextLoader.getCurrentWebApplicationContext().getServletContext();
		return (List<Key>) servletContext.getAttribute("key");
	}
	
	
}

















