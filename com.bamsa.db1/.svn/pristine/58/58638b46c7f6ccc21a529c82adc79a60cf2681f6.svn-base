package com.bamsa.db.dao.impl;

import java.util.List;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bamsa.db.beans.User;
import com.bamsa.db.dao.LoginDAO;
import com.bamsa.db.exceptions.DBUpdateException;
import com.bamsa.db.impls.mappers.LoginRowMapper;
import com.bamsa.db.impls.stmtsetters.LoginStmtSetter;
import com.bamsa.db.util.DBConstants;
import com.bamsa.db.util.ErrorConstants;

@Repository
public class LoginDAOImpl implements LoginDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private Properties dbProps;
	private static Logger logger = Logger.getLogger(LoginDAOImpl.class);


	public User loadUserLogin(User user){	
		logger.info("Enter into loadUserLogin");
			User userData = null;
			String loadUserLoginQuery = dbProps.getProperty(DBConstants.LOAD_USER_LOGIN);
			List<User> users = jdbcTemplate.query(loadUserLoginQuery,new Object[]{user.getUsername()}, new LoginRowMapper());
			logger.info(users);
			if(users != null && users.size() > 0){
				userData = users.get(0);
			}
			logger.info("Exit from loadUserLogin");
			return userData;
}
	public String resetPassword(User user) throws DBUpdateException{
		logger.info("Enter into resetPassword");
		String resetQuery = dbProps.getProperty(DBConstants.RESET_PASSWORD);
		int numberRecordsUpdated = jdbcTemplate.update(resetQuery,new Object[]{user.getNewpassword(),user.getUsername()});
		if(numberRecordsUpdated == 0){
			DBUpdateException dbException = new DBUpdateException("Reset password failed");
			dbException.setErrorCode(ErrorConstants.RESET_PASSWORD_FAILED);
			throw dbException;
		}
		String upassword=user.getPassword();
		logger.info("Exit from resetPassword");
		return upassword;
	}
}