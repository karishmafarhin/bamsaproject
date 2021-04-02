package com.bamsa.db.impls.stmtsetters;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.bamsa.db.beans.AssetTicketBean;

public class AssetTakeHomeStmtSetter implements PreparedStatementSetter  {
	private static Logger logger = Logger.getLogger(AssetTakeHomeStmtSetter.class);

	AssetTicketBean assetdetails;
	public AssetTakeHomeStmtSetter(AssetTicketBean assetdetails){
		this.assetdetails=assetdetails;
            }
	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
		logger.info("enter into prepared statement in AssetTakeHomeStmtSetter");
		ps.setInt(1,assetdetails.getApprovedby());
		ps.setDate(2,new java.sql.Date(assetdetails.getApproveddate().getTime()));
		ps.setInt(3,assetdetails.getAtid());
		logger.info(ps);
		logger.info("exit from AssetTakeHomeStmtSetter");
	}
}
