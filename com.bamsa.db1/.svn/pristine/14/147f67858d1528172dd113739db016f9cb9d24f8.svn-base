package com.bamsa.db.impls.stmtsetters;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.bamsa.db.beans.GrievanceDetails;

public class GrievancesTicketUpdateStmtSetter implements  PreparedStatementSetter  {

	private static Logger logger = Logger.getLogger(GrievancesTicketUpdateStmtSetter.class);
    
	GrievanceDetails grievancedetailsbean;

	public GrievancesTicketUpdateStmtSetter(GrievanceDetails grievancedetailsbean) {
	
		this.grievancedetailsbean = grievancedetailsbean;
	}
	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
	
		logger.info("enter into grievanceticketupdatestmtsetter");
		ps.setInt(1, grievancedetailsbean.getGid());
		logger.info(ps);
		logger.info("exit from GrievancesTicketUpdateStmtSetter");
		
	}

	
}
