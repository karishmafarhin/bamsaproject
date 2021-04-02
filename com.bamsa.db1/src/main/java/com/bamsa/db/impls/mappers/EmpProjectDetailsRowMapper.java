package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.TaskDetails;



public class EmpProjectDetailsRowMapper implements RowMapper<TaskDetails> {
	private static Logger logger = Logger.getLogger(EmpProjectDetailsRowMapper.class);

	@Override
	public TaskDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("enter into EmpProjectDetailsRowMapper ");
		TaskDetails taskdetails = new TaskDetails();
		taskdetails.setNpid(rs.getInt("npid"));
		taskdetails.setProjectname(rs.getString("projectname"));
		taskdetails.setTaskDescription(rs.getString("projectdescription"));
		taskdetails.setDeadline(rs.getDate("projectdeadline"));
		taskdetails.setPicture(rs.getBytes("picture"));
		
		logger.info(taskdetails);
		logger.info("exit from EmpProjectDetailsRowMapper");
		return taskdetails;
		
		
	}
	

	
	}

