package com.bamsa.db.impls.stmtsetters;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;


import com.bamsa.db.beans.EmployeeDetails;

public class UserDetailStmtSetter implements PreparedStatementSetter {
	private static Logger logger = Logger.getLogger(UserDetailStmtSetter.class);
	
	private EmployeeDetails employeeDetails;
	
	public UserDetailStmtSetter(EmployeeDetails employeeDetails){
		this.employeeDetails=employeeDetails;
	}
	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
		
			logger.info("enter into prepared statement in statsetter");
			ps.setString(1, employeeDetails.getName());
			ps.setDate(2, new java.sql.Date(employeeDetails.getDob().getTime()));
			ps.setString(3, employeeDetails.getMobileNo());
			ps.setString(4, employeeDetails.getEmergencyMobileNo());
			ps.setString(5,employeeDetails.getEmail());
			ps.setString(6, String.valueOf(employeeDetails.getGender()));
			ps.setInt(7, employeeDetails.getUid());
			logger.info(ps);
			logger.info("exit from prepared statement in statsetter");
			
}
}

	
