package com.caitou.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.caitou.bean.User;
import com.caitou.service.UserService;
import com.caitou.threadlocal.UserThreadLocal;

public class UpdateUserInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UpdateUserInterceptor.class);

	private static final String[] UPDATE_URL = {"updateBasicSetting","updateIntroduce","updatePassword"};
	
	@Autowired
	private UserService userService;
	
    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {
		
    	return true;
    }
    
    @Override
    public void postHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
    }
    
    @Override
    public void afterCompletion(HttpServletRequest request,
            HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    	//更新一下session的内容
    	
    	boolean flag = false;
        
        String url = request.getRequestURL().toString();
        
        //不拦截上面定义的路径
        for (String str : UPDATE_URL) {
            if (url.contains(str)) {
                flag = true;
                LOGGER.debug("更新操作:" + url);
                break;
            }
        }
    	
        //更新User信息
        if (flag) {
        	User user = UserThreadLocal.getUser();
        	
        	user = userService.getUserByUserId(user.getId());
        	
        	request.getSession().setAttribute("user", user);
        	
        	LOGGER.debug("更新之后是:" + user);
        }
    	
    	UserThreadLocal.setUser(null);
    }

	
}
