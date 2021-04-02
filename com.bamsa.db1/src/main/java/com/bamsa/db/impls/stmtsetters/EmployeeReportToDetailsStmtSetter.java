package com.bamsa.db.impls.stmtsetters;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.bamsa.db.beans.EmployeeDetails;

public class EmployeeReportToDetailsStmtSetter implements PreparedStatementSetter{

	private static Logger logger = Logger.getLogger(EmployeeReportToDetailsStmtSetter.class);
	EmployeeDetails employeedetails;
	public EmployeeReportToDetailsStmtSetter(EmployeeDetails employeedetails) {
		this.employeedetails = employeedetails;
	}
	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
		logger.info("enter into prepared statement in EmployeeReportToDetailsStmtSetter");
	
		ps.setInt(1, employeedetails.getHierarchyId());
		ps.setInt(2, employeedetails.getStreamId());
		ps.setInt(3, employeedetails.getDesigId());
		ps.setFloat(4, employeedetails.getSalary());
        ps.setString(5, employeedetails.getBranchname());
        ps.setInt(6,employeedetails.getUid()); 
		logger.info(ps);
		logger.info("exit from BrokenStatusUpdateStmtSetter");
	}
	
}
