package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.ContactBean;

public class AccountOwnerRowMapper implements RowMapper<ContactBean> {
	private static Logger logger = Logger.getLogger(AccountOwnerRowMapper.class);
	@Override
	public ContactBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("enter into AccountOwnerRowMapper");
		ContactBean bean=new ContactBean();
		bean.setAcid(rs.getInt("acid"));
		bean.setAccountName(rs.getString("accountname"));
		bean.setWebsite(rs.getString("website"));
		bean.setState(rs.getString("state"));
		bean.setCity(rs.getString("city"));
		bean.setDescription(rs.getString("description"));
		logger.info(bean);
        logger.info("exit from AccountOwnerRowMapper");
        return bean;
	}

}
