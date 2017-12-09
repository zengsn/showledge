package com.caitou.threadlocal;

import com.caitou.bean.User;

/**
 * 将用户放到本地线程中
 * 
 * @author _wind
 *
 */

public class UserThreadLocal {
	
	private static final ThreadLocal<User> THREAD_LOCAL = new ThreadLocal<User>();
	
	public static void setUser(User user){
		THREAD_LOCAL.set(user);
	}
	
	public static User getUser(){
		return THREAD_LOCAL.get();
	}
	
	
	
}












