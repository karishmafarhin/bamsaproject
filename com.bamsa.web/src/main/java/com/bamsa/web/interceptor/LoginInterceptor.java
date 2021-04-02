package com.bamsa.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bamsa.web.model.UserBean;
import com.bamsa.web.util.ApplicationConstants;

public class LoginInterceptor implements HandlerInterceptor {

	private static Logger log = Logger.getLogger(LoginInterceptor.class);
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		log.info("Enter into preHandle");
		try{
			if( !request.getRequestURI().equals("/bamsa/") &&  !request.getRequestURI().equals("/bamsa/login") ){
				UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
				if(userData == null)
				{
					response.sendRedirect("/bamsa");
					return false;
				}   
			}
			return true;
		}catch(Exception e){
			log.error(e.getMessage());
			response.sendRedirect("/bamsa");
			request.setAttribute("message", "Invalid");
			return false;
		}
		
	}

}
