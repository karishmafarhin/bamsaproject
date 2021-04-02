package com.bamsa.db.impls.stmtsetters;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.bamsa.db.beans.ContactBean;

public class AccountDetailsStmtSetter implements PreparedStatementSetter {
	private static Logger logger = Logger.getLogger(AccountDetailsStmtSetter.class);
	
	ContactBean contactbean;
	public AccountDetailsStmtSetter(ContactBean contactbean) {
		this.contactbean=contactbean;
	}

	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
		try{
			logger.info("enter into prepared statement in AccountDetailsStmtSetter");
			ps.setString(1,contactbean.getFirstname() );
			ps.setString(2, contactbean.getLastname());
			ps.setString(3, contactbean.getAccountName());
			ps.setString(4, contactbean.getAccountOwner());
			ps.setString(5, contactbean.getCategory());
			ps.setString(6, contactbean.getWebsite());
			ps.setString(7, contactbean.getStatus());
			ps.setString(8, contactbean.getPhoneno());
			ps.setString(9, contactbean.getState());
			ps.setString(10, contactbean.getCity());
			ps.setString(11, contactbean.getPrimaryemail());
			ps.setString(12, contactbean.getDescription());
			ps.setString(13, contactbean.getSecondaryemail());
			ps.setString(14, String.valueOf(contactbean.getReqlist()));
			ps.setString(15, String.valueOf(contactbean.getHotlist()));
		    ps.setInt(16, contactbean.getAcid());
		    logger.info(ps);
			logger.info("enter into prepared statement in AccountDetailsStmtSetter");
			}catch(Exception e){
				logger.error(e.getMessage());
			
		}


}
}
