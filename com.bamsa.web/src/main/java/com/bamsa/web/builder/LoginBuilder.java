package com.bamsa.web.builder;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.bamsa.db.beans.User;
import com.bamsa.web.model.UserBean;

@Component
public class LoginBuilder {
     
	private static Logger logger = Logger.getLogger(LoginBuilder.class);
	public User buildUser(UserBean userBean){
		logger.info("Enter into buildUser");
		User user= new User();
		if(userBean != null){
		user.setUid(userBean.getUid());
		user.setUsername(userBean.getUsername());
		user.setPassword(userBean.getPassword());
		}
		logger.info(user);
		logger.info("Exit From builduser");
		return user;
	}
	public UserBean buildUserBean(User user){
		logger.info("Enter into buildUserBean");
		UserBean userBean = new UserBean();
		if(user != null){
		userBean.setUid(user.getUid());
		userBean.setUsername(user.getUsername());
		userBean.setPassword(user.getPassword());
		}
		logger.info(userBean);
		logger.info("Exit From buildUserBean");
		return userBean;
	}
	public User buildResetUser(UserBean userBean){
		logger.info("Enter into buildresetUser");
		User user = new User();
		
		if(userBean != null){
			
			user.setUid(userBean.getUid());
			user.setUsername(userBean.getUsername());
			user.setPassword(userBean.getOldpassword());
			user.setNewpassword(userBean.getNewpassword());
		}
		logger.info("Exit from buildResetUser");
		return user;
	}

}
