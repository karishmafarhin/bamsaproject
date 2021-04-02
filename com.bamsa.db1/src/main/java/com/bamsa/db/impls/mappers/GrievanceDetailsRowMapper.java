package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.EmployeeDetails;
import com.bamsa.db.beans.GrievanceDetails;

public class GrievanceDetailsRowMapper implements RowMapper<GrievanceDetails> {
	private static Logger logger = Logger.getLogger(EmpDetaiRowMapper.class);
	@Override
	public GrievanceDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
         logger.info("enter into rowmapper of grievancedetails");
		GrievanceDetails grievancedetails = new GrievanceDetails();
		grievancedetails.setGid(rs.getInt("gid"));
		grievancedetails.setUid(rs.getInt("uid"));
		grievancedetails.setGrievancedetails(rs.getString("grievancedetails"));
		grievancedetails.setGrievancesevere(rs.getInt("grievancesevere"));
		grievancedetails.setGrievancetype(rs.getInt("grievancetype"));
		grievancedetails.setMobileNo(rs.getString("mobileno"));
		grievancedetails.setEmpId(rs.getString("empid"));
		grievancedetails.setName(rs.getString("name"));
		grievancedetails.setStatus(rs.getString("status"));
		grievancedetails.setEmpmobileno(rs.getString("mobileno"));
		logger.info(grievancedetails);
		logger.info("exit from rowmapper GrievanceDetails");
		return grievancedetails;
	}
}
