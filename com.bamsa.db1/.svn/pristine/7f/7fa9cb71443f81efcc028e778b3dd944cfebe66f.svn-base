package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;
import com.bamsa.db.beans.TaskDetails;

public class EmployeesUnderProjectRowMapper implements RowMapper<TaskDetails>{

	private static Logger logger = Logger.getLogger(EmployeesUnderProjectRowMapper.class);
	
	public TaskDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
	
		logger.info("enter into into mapRow method");
		
		TaskDetails details= new TaskDetails();
		details.setTid(rs.getInt("tid"));
		details.setUid(rs.getInt("uid"));
		details.setEmpid(rs.getString("empid"));
		details.setTasktype(rs.getString("tasktype").charAt(0));
		details.setNpid(rs.getInt("npid"));
		details.setName(rs.getString("name"));
		details.setBranchname(rs.getString("branchname"));
		details.setPercentagecompleted(rs.getFloat("percentagecompleted"));
		logger.info("exit from maprow method");
		return details;
	}
}
