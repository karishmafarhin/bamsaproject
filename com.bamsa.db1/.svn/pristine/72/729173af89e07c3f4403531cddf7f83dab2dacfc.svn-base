package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;


import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.EmployeeDetails;


public class EmpIdRowMapper implements RowMapper<EmployeeDetails> {
	private static Logger logger = Logger.getLogger(EmpIdRowMapper.class);
	@Override
	public EmployeeDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		logger.info("Enter into EmpIdRowMapper");
		EmployeeDetails department =new EmployeeDetails();
		department.setEmpId(rs.getString("empid"));
		department.setName(rs.getString("name"));
		department.setStreamId(rs.getInt("streamid"));
	    department.setDesigId(rs.getInt("desigid"));
	    department.setHierarchyId(rs.getInt("hierarchyid"));
		logger.info("exit into EmpIdRowMapper");
		return department ;		
	}
}
