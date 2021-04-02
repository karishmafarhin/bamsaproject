package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.CompanyConsumableBean;

public class CompanyConsumableRowMapper implements RowMapper<CompanyConsumableBean> {

	private static Logger logger = Logger.getLogger(CompanyConsumableRowMapper.class);
	@Override
	public CompanyConsumableBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("enter into companyConsumableRowMapper");
		CompanyConsumableBean bean = new CompanyConsumableBean();
		bean.setCcid(rs.getInt("ccid"));
		bean.setConsumableTag(rs.getString("consumabletag"));
		bean.setConsumableName(rs.getString("consumablename"));
		bean.setBranchname(rs.getString("branchname"));
		bean.setCategory(rs.getString("consumablecategory"));
		bean.setManufacturer(rs.getString("manufacturer"));
		bean.setCreatedBy(rs.getInt("createdby"));
		bean.setModelNo(rs.getString("modelno"));
		bean.setItemNo(rs.getString("itemno"));
		bean.setOrderNo(rs.getString("orderno"));
		bean.setPurchasedDate(rs.getDate("purchasedate"));
		bean.setPurchaseCost(rs.getFloat("purchasecost"));
		bean.setQuantity(rs.getInt("quantity"));
		bean.setCreatedDate(rs.getDate("createddate"));
		bean.setEmpid(rs.getString("empid"));
		
		logger.info("exit from companyConsumableRowMapper");
		return bean;
	}
	
}
