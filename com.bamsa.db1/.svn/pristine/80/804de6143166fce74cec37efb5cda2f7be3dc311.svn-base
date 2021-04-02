package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.EmployeeDetails;

public class EmpDetaiRowMapper implements RowMapper<EmployeeDetails> {
	private static Logger logger = Logger.getLogger(EmpDetaiRowMapper.class);
	@Override
	public EmployeeDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("Enter into EmpDetaiRowMapper");
		EmployeeDetails empdetails= new EmployeeDetails();
		empdetails.setName(rs.getString("name"));
		empdetails.setMobileNo(rs.getString("mobileno"));
		empdetails.setDob(rs.getDate("dob"));
		empdetails.setEmergencyMobileNo(rs.getString("emermobileno"));
		empdetails.setEmail(rs.getString("email"));
		empdetails.setGender(rs.getString("gender").charAt(0));
		empdetails.setPicture(rs.getBytes("picture"));
		logger.info(empdetails);
		logger.info("exit from EmployeeDetails");
		return empdetails;
	}	
	
}
