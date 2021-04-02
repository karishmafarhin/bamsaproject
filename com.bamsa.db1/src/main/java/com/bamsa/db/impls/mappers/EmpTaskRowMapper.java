package com.bamsa.db.impls.mappers;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.EmployeeTask;

public class EmpTaskRowMapper implements RowMapper<EmployeeTask> {
	private static Logger logger = Logger.getLogger(EmpTaskRowMapper.class);

	@Override
	public EmployeeTask mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("Enter into EmployeeTask");
		EmployeeTask emptask = new EmployeeTask();
		emptask.setTid(rs.getInt("tid"));
		emptask.setUid(rs.getInt("uid"));
		emptask.setEmpid(rs.getString("empid"));
		emptask.setProjectname(rs.getString("projectname"));
		emptask.setTaskdescription(rs.getString("taskdescription"));
		emptask.setTasktype(rs.getString("tasktype").charAt(0));
		emptask.setGivenbyname(rs.getString("givenby"));
		emptask.setDeadline(rs.getDate("deadline"));
		emptask.setGivendate(rs.getDate("givendate"));
		emptask.setStatus(rs.getString("status"));
		emptask.setReason(rs.getString("reason"));
		
		
		logger.info(emptask);
		logger.info("exit from EmployeeTask");
		return emptask;
		
	}

}
