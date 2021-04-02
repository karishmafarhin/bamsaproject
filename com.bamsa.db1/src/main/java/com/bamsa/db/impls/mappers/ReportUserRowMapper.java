package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.EmployeeDetails;

public class ReportUserRowMapper implements RowMapper<EmployeeDetails> { 
	private static Logger logger = Logger.getLogger(ReportUserRowMapper.class);

	@Override
	public EmployeeDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
	
		logger.info("Enter into ReportUserRowMapper");
		EmployeeDetails department =new EmployeeDetails();
		department.setEmpId(rs.getString("empid"));
	    department.setUid(rs.getInt("uid"));
		logger.info("exit into ReportUserRowMapper");
		return department ;		
	}
}
