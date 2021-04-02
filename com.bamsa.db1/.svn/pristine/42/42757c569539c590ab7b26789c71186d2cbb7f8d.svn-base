package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.CompanyComponentBean;

public class CompanyComponentRowMapper implements RowMapper<CompanyComponentBean>{
	private static Logger logger = Logger.getLogger(CompanyComponentRowMapper.class);
	@Override
	public CompanyComponentBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("enter into CompanyComponentBean");
		
		CompanyComponentBean componentbean=new CompanyComponentBean();
		componentbean.setCcmid(rs.getInt("ccmid"));
		componentbean.setComponentName(rs.getString("componentname"));
		componentbean.setCategory(rs.getString("category"));
		componentbean.setComponenttag(rs.getString("componenttag"));
		componentbean.setBranchname(rs.getString("branchname"));
		componentbean.setCreatedDate(rs.getDate("createddate"));
		componentbean.setOrderNo(rs.getString("orderno"));
		componentbean.setPurchaseCost(rs.getFloat("purchasecost"));
		componentbean.setPurchasedDate(rs.getDate("purchaseddate"));
		componentbean.setUserid(rs.getInt("createdby"));
		componentbean.setSerialNo(rs.getString("serialno"));
		componentbean.setEmpid(rs.getString("empid"));
		logger.info(componentbean);
        logger.info("exit from CompanyComponentBean");
        return componentbean;
	}

}
