package com.caitou.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.caitou.bean.Key;
import com.caitou.dao.IUserDao;
import com.caitou.dao.KeysDao;

/**
 * Applistion应用启动的时候调用
 * 
 * 
 * 
 * @author _wind
 *
 */

@WebListener
public class PreServletContextListener implements ServletContextListener {
	
	private static final Logger logger = LoggerFactory.getLogger(PreServletContextListener.class);
	
	private KeysDao keysDao;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		logger.debug("监听ServletContext启动");
		keysDao = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext()).getBean(KeysDao.class);
		
		ServletContext servletContext = sce.getServletContext();
		
		List<Key> select = keysDao.select(null);
		logger.debug("关键词的大小是:" + select.size());
		
		servletContext.setAttribute("key", select);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		logger.debug("监听ServletContext启动");
	}

}
















