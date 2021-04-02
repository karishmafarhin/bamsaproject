package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.CompanyLicensesBean;


public class CompanyLicenseRowMapper  implements RowMapper<CompanyLicensesBean> {
     
	private static Logger logger = Logger.getLogger(CompanyLicenseRowMapper.class);
	@Override
	public CompanyLicensesBean mapRow(ResultSet rs, int rowNum) throws SQLException {
	
		logger.info("Enter into CompanyLicenseRowMapper");
		CompanyLicensesBean bean = new CompanyLicensesBean();
		bean.setClid(rs.getInt("clid"));
		bean.setLicenseTag(rs.getString("licensetag"));
		bean.setBranchname(rs.getString("branchname"));
		bean.setSoftwareName(rs.getString("softwarename"));
		bean.setSeats(rs.getInt("seats"));
		bean.setManufacturer(rs.getString("manufacturer"));
		bean.setLicensedTo(rs.getString("licensedto"));
		bean.setLicensedMail(rs.getString("licensedmail"));
		bean.setCreatedBy(rs.getInt("createdby"));
		bean.setProductKey(rs.getString("productkey"));
		bean.setOrderNo(rs.getString("orderno"));
		bean.setPurchaseCost(rs.getFloat("purchasecost"));
		bean.setPurchasedDate(rs.getDate("purchasedate"));
		bean.setExpirationDate(rs.getDate("expirationdate"));
		bean.setNotes(rs.getString("notes"));
		bean.setCreatedDate(rs.getDate("createddate"));
		bean.setEmpid(rs.getString("empid"));
		logger.info("exit from CompanyLicenseRowMapper ");
		return bean;
	}
}
