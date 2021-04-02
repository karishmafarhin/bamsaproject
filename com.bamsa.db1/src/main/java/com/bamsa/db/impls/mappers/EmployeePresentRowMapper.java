package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.EmployeeDetails;

public class EmployeePresentRowMapper implements RowMapper<EmployeeDetails> {
	private static Logger logger = Logger.getLogger(EmployeePresentRowMapper.class);

	@Override
	public EmployeeDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("Enter into EmployeePresentDetails");
		EmployeeDetails presentempdetails= new EmployeeDetails();
		presentempdetails.setUid(rs.getInt("uid"));
		presentempdetails.setEmpId(rs.getString("empid"));
		presentempdetails.setName(rs.getString("name"));
		logger.info(presentempdetails);
		logger.info("exit from EmployeePresentDetails");
		return presentempdetails;
		
		
	
	
	}
}
