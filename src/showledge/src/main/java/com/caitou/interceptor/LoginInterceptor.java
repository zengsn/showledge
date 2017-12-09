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

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginInterceptor.class);

	private static final String[] IGNORE_URL = {"index","search","getKaptchaImage","checkLogin","newUser"};
	
	@Autowired
	private UserService userService;
	
    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {
		
    	boolean flag = false;
        
        String url = request.getRequestURL().toString();
        //不拦截上面定义的路径
        for (String str : IGNORE_URL) {
            if (url.contains(str)) {
                flag = true;
                break;
            }
        }
        
        //是需要拦截的页面
		if (!flag) {

			//已经登陆了
			if (request.getSession().getAttribute("userIdInSession") != null){
				int userId = (int) request.getSession().getAttribute("userIdInSession");
				
				//线程公用
				User user = null;
				
				if(request.getSession().getAttribute("user") == null){
					user = userService.getUserByUserId(userId);
					
					request.getSession().setAttribute("user", user);
				}else{
					user = (User) request.getSession().getAttribute("user");
				}
				UserThreadLocal.setUser(user);
				
				return true;
			}else{
				LOGGER.debug("拦截到非法访问");
				
				//没有登录,跳转到login
				response.sendRedirect("/index.do");
				return false;
			}
		}

		//访问index的时候如果是登录状态也要把User放进本地线程
		if(request.getSession().getAttribute("user") != null){
			User user = (User) request.getSession().getAttribute("user");
			UserThreadLocal.setUser(user);
		}
		
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
    	
    	//如果用户是注册成功或者登陆成功需要把用户放在session里面
    	if (request.getRequestURL().toString().contains("checkLogin") || request.getRequestURL().toString().contains("newUser")) {
    		if (request.getSession().getAttribute("userIdInSession") != null){
    			User user = null;
    			if(request.getSession().getAttribute("user") == null){
					user = userService.getUserByUserId((int)request.getSession().getAttribute("userIdInSession"));
					
					request.getSession().setAttribute("user", user);
				}
    		}
		}
    	
    	UserThreadLocal.setUser(null);
    }

	
}












