package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.ContactBean;

public class SubconractEmailsRowmapper implements RowMapper<ContactBean> {
	private static Logger logger = Logger.getLogger(SubconractEmailsRowmapper.class);
	@Override
	public ContactBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("enter into SubconractEmailsRowmapper");
		ContactBean bean=new ContactBean();
		bean.setAcid(rs.getInt("acid"));
		bean.setPrimaryemail(rs.getString("primaryemail"));
		return bean;
	}

}
