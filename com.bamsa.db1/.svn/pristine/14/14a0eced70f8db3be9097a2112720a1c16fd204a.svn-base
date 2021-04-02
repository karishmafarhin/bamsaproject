package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;
import com.bamsa.db.beans.User;


public class LoginRowMapper implements RowMapper<User> {
	private static Logger logger = Logger.getLogger(LoginRowMapper.class);
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("Enter into mapRow");
		User user = new User();
		user.setUid(rs.getInt("uid"));		
		user.setUsername(rs.getString("username"));	
		user.setPassword(rs.getString("password"));
		logger.info(user);
		logger.info("Exit from mapRow");
		return user;
	}
}
