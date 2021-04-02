package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.EmployeeDetails;

public class EmployeeDetailsRowMapper implements RowMapper<EmployeeDetails>{
	private static Logger logger = Logger.getLogger(EmployeeDetailsRowMapper.class);
	@Override
	public EmployeeDetails mapRow(ResultSet rs, int rownum) throws SQLException {
		logger.info("Enter into EmployeeDetails");

		EmployeeDetails details= new EmployeeDetails();
		details.setUid(rs.getInt("uid"));
		details.setName(rs.getString("name"));
		details.setEmpId(rs.getString("empid"));
		logger.info(details);
		logger.info("exit from EmployeeDetails");
		return details;
	}

}
