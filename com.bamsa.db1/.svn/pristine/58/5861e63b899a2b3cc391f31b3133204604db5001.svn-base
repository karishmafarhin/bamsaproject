package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.TaskDetails;

public class ProjectTypeDetailsRowMapper implements RowMapper<TaskDetails>{
	private static Logger logger = Logger.getLogger(ProjectTypeDetailsRowMapper.class);
	public TaskDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		logger.info("enter into into mapRow method");
		TaskDetails details= new TaskDetails();
		details.setTasktype(rs.getString("tasktype").charAt(0));
		details.setEmpid(rs.getString("empid"));
		details.setNpid(rs.getInt("npid"));
		logger.info(details);
		logger.info("exit from maprow method");
		return details;
	}
}
