package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.CompanyAssetsBean;


public class CompanyAssetsRowMapper implements RowMapper<CompanyAssetsBean>{

private static Logger logger = Logger.getLogger(CompanyAssetsRowMapper.class);
	@Override
	public CompanyAssetsBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("enter into CompanyAssetsBean");
		
		CompanyAssetsBean assetsbean = new CompanyAssetsBean();
		assetsbean.setCaid(rs.getInt("caid"));
		assetsbean.setAssetName(rs.getString("assetname"));
		assetsbean.setAssetTag(rs.getString("assettag"));
		assetsbean.setCreatedBy(rs.getInt("createdby"));
		assetsbean.setCreatedDate(rs.getDate("createddate"));
		assetsbean.setAssetSerial(rs.getString("assetserial"));
		assetsbean.setAssetStatus(rs.getString("assetstatus"));
		assetsbean.setBranchname(rs.getString("branchname"));
		assetsbean.setModel(rs.getString("model"));
		assetsbean.setPurchaseCost(rs.getFloat("purchasecost"));
        assetsbean.setPurchasedDate(rs.getDate("purchasedate"));
        assetsbean.setOrderNo(rs.getString("orderno"));
        assetsbean.setSupplier(rs.getString("supplier"));
        assetsbean.setWarranty(rs.getInt("warranty"));
        assetsbean.setAssetImage(rs.getBytes("assetimage"));
        assetsbean.setNotes(rs.getString("notes"));
        assetsbean.setEmpid(rs.getString("empid"));
        logger.info(assetsbean);
        logger.info("exit from CompanyAssetsBean");
        return assetsbean;
	}

}
