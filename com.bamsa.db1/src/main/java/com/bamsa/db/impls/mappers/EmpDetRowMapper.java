package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.EmployeeDetails;

public class EmpDetRowMapper implements RowMapper<EmployeeDetails>  {
	private static Logger logger = Logger.getLogger(EmpDetRowMapper.class);
	@Override
	public EmployeeDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("Enter into EmpDetRowMapper");
		EmployeeDetails empdet= new EmployeeDetails();
		empdet.setEmpId(rs.getString("empid"));
		empdet.setName(rs.getString("name"));
		empdet.setDob(rs.getDate("dob"));
		empdet.setDoj(rs.getDate("doj"));
		empdet.setMobileNo(rs.getString("mobileno"));
		empdet.setEmergencyMobileNo(rs.getString("emermobileno"));
		empdet.setEmail(rs.getString("email"));
		empdet.setGender(rs.getString("gender").charAt(0));
		empdet.setSalary(rs.getFloat("salary"));
		empdet.setInTime(rs.getDate("intime"));
		empdet.setOutTime(rs.getDate("outtime"));
		empdet.setStreamId(rs.getInt("streamid"));
		empdet.setHierarchyId(rs.getInt("hierarchyid"));
		empdet.setDesigId(rs.getInt("desigid"));
		empdet.setBranchname(rs.getString("branchname"));
		logger.info(empdet);
		logger.info("exit from EmpDetRowMapper");
		return empdet;
	}

}
