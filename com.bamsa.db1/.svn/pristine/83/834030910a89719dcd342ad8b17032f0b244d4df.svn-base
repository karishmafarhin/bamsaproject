package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.ContactBean;

public class AccountDetailsRowMapper implements RowMapper<ContactBean> {
	private static Logger logger = Logger.getLogger(AccountDetailsRowMapper.class);
	@Override
	public ContactBean mapRow(ResultSet rs, int rowNum) throws SQLException {
	logger.info("enter into rowmapper");
		ContactBean bean =new ContactBean();
		bean.setAcid(rs.getInt("acid"));
		bean.setAccountName(rs.getString("accountname"));
		bean.setAccountOwner(rs.getString("accountowner"));
		bean.setCategory(rs.getString("category"));
		bean.setWebsite(rs.getString("website"));
		bean.setStatus(rs.getString("status"));
		bean.setPhoneno(rs.getString("phoneno"));
		bean.setState(rs.getString("state"));
		bean.setCity(rs.getString("city"));
		bean.setPrimaryemail(rs.getString("primaryemail"));
		bean.setDescription(rs.getString("description"));
		bean.setFirstname(rs.getString("firstname"));
		bean.setLastname(rs.getString("lastname"));
		bean.setSecondaryemail(rs.getString("secondaryemail"));
		bean.setReqlist(rs.getString("reclist").charAt(0));
		bean.setHotlist(rs.getString("hotlist").charAt(0));
		bean.setCreateddate(rs.getDate("createddate"));
		bean.setCreatedby(rs.getInt("createdby"));
		bean.setEmpId(rs.getString("empid"));
		logger.info(bean);
	logger.info("exit from rowmapper");
		return bean;	
	
	
	}

}
