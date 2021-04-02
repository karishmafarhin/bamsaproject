package com.bamsa.db.impls.stmtsetters;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.bamsa.db.beans.AssetTicketBean;

public class RepairStatusUpdateStmtSetter implements PreparedStatementSetter{

	private static Logger logger = Logger.getLogger(RepairStatusUpdateStmtSetter.class);
   
	AssetTicketBean assetTicketBean;
	public RepairStatusUpdateStmtSetter(AssetTicketBean assetTicketBean) {
		
		this.assetTicketBean = assetTicketBean;
	}
	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
		logger.info("enter into prepared statement in RepairStatusUpdateStmtSetter");
		ps.setInt(1, assetTicketBean.getApprovedby());
		ps.setDate(2, new java.sql.Date(assetTicketBean.getApproveddate().getTime()));
        ps.setInt(3,assetTicketBean.getAtid()); 		
		logger.info(ps);
		logger.info("exit from RepairStatusUpdateStmtSetter");
	}
}
