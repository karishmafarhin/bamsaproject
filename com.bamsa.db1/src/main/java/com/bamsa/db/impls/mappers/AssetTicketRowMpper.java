package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.AssetTicketBean;

public class AssetTicketRowMpper implements RowMapper<AssetTicketBean>{
	private static Logger logger = Logger.getLogger(AssetTicketRowMpper.class);
	@Override
	public AssetTicketBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("enter into AssetTicketBean");
		AssetTicketBean ticket=new AssetTicketBean();
		ticket.setAtid(rs.getInt("atid"));
		ticket.setAssettype(rs.getString("assettype"));
		ticket.setTag(rs.getString("tag"));
		ticket.setRequestto(rs.getInt("requestto"));
		ticket.setPurpose(rs.getString("purpose"));
		ticket.setRemarks(rs.getString("remarks"));
		ticket.setFromdate(rs.getDate("fromdate"));
		ticket.setTodate(rs.getDate("todate"));
		ticket.setRisedby(rs.getInt("risedby"));
		ticket.setRiseddate(rs.getDate("riseddate"));
		ticket.setThstatus(rs.getString("thstatus"));
		ticket.setApprovedby(rs.getInt("approvedby"));
		ticket.setApproveddate(rs.getDate("approveddate"));
		ticket.setBstatus(rs.getString("bstatus"));
		ticket.setRstatus(rs.getString("rstatus"));
		ticket.setEmpid(rs.getString("empid"));
		logger.info(ticket);
        logger.info("exit from AssetTicketBean");
        return ticket;
	}

}
