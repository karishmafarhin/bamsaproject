package com.bamsa.db.impls.stmtsetters;


import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.bamsa.db.beans.CandidateInfoBean;

public class CandidateDetailsStmtSetter implements PreparedStatementSetter {
	private static Logger logger = Logger.getLogger(CandidateDetailsStmtSetter.class);
	
	CandidateInfoBean candidateinfobean;
	
	public CandidateDetailsStmtSetter(CandidateInfoBean candidateinfobean){
		this.candidateinfobean=candidateinfobean;
	}
	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
		try{
		logger.info("enter into prepared statement in CandidateDetailsStmtSetter");
		ps.setString(1,candidateinfobean.getFirstName());
		ps.setString(2,candidateinfobean.getMiddleName());
		ps.setString(3, candidateinfobean.getLastName());
		ps.setString(4,candidateinfobean.getEmailid());
		ps.setString(5, candidateinfobean.getMobile());
		ps.setString(6,candidateinfobean.getState());
		ps.setString(7,candidateinfobean.getCity());
		ps.setString(8, candidateinfobean.getVisaStatus());
		ps.setDate(9, new java.sql.Date( candidateinfobean.getAvailableFrom().getTime()));
		ps.setString(10,String.valueOf( candidateinfobean.getRelocate()) );
		ps.setString(11, String.valueOf(candidateinfobean.getGender()));
		ps.setString(12, candidateinfobean.getTypeofConsultant());
		ps.setString(13, String.valueOf(candidateinfobean.getHotlist()));
		ps.setString(14, candidateinfobean.getSsn());
		ps.setString(15, candidateinfobean.getBillRateType());
		ps.setFloat(16, candidateinfobean.getRate());
		ps.setString(17, candidateinfobean.getResume());
		
		ps.setString(18, candidateinfobean.getPrimaryskills());
		ps.setInt(19,candidateinfobean.getCiid() );
		logger.info(ps);
		logger.info("enter into prepared statement in CandidateDetailsStmtSetter");
		}catch(Exception e){
			logger.error(e.getMessage());
		
	}

}
}
