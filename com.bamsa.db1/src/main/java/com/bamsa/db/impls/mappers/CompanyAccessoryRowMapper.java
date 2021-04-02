package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.CompanyAccessoryBean;

public class CompanyAccessoryRowMapper implements RowMapper<CompanyAccessoryBean> {
	private static Logger logger = Logger.getLogger(CompanyAccessoryRowMapper.class);
	@Override
	public CompanyAccessoryBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("enter into CompanyAccessoryBean");
		CompanyAccessoryBean accessory=new CompanyAccessoryBean();
		accessory.setAccessoryname(rs.getString("accessoryname"));
		accessory.setAccessorytag(rs.getString("accessoriestag"));
		accessory.setBranchname(rs.getString("branchname"));
		accessory.setCaid(rs.getInt("caid"));
		accessory.setCategory(rs.getString("accessorycategory"));
		accessory.setCreatedDate(rs.getDate("createddate"));
		accessory.setManufacturer(rs.getString("manufacturer"));
		accessory.setModelno(rs.getString("modelno"));
		accessory.setOrderno(rs.getString("orderno"));
		accessory.setPurchasecost(rs.getFloat("purchasecost"));
		accessory.setPurchaseDate(rs.getDate("purchasedate"));
		accessory.setQuantity(rs.getInt("quantity"));
		accessory.setUserid(rs.getInt("createdby"));
		accessory.setEmpid(rs.getString("empid"));
		logger.info(accessory);
        logger.info("exit from CompanyAccessoryBean");
        return accessory;
	}

}
