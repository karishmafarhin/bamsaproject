package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.OpeningInfoBean;

public class OpeningDetailsRowMapper implements RowMapper<OpeningInfoBean>{
	private static Logger logger = Logger.getLogger(OpeningDetailsRowMapper.class);
	@Override
	public OpeningInfoBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("enter into OpeningDetailsRowMapper");
		OpeningInfoBean bean=new OpeningInfoBean();
		bean.setPositionid(rs.getString("positionid"));
		bean.setPositiontitle(rs.getString("positiontitle"));
		bean.setState(rs.getString("state"));
		bean.setCity(rs.getString("city"));
		bean.setPrimaryskill(rs.getString("primaryskill"));
		bean.setSecondaryskill(rs.getString("secondaryskill"));
		bean.setDescription(rs.getString("description"));
		bean.setRate(rs.getInt("rate"));
		bean.setPrimevendor(rs.getString("primevendor"));
		bean.setEndclient(rs.getString("endclient"));
		bean.setCreatedby(rs.getInt("createdby"));
		bean.setCreateddate(rs.getDate("createddate"));
		bean.setEmpId(rs.getString("empid"));
		bean.setContactperson(rs.getString("contactperson"));
		bean.setBilltype(rs.getInt("billtype"));
		logger.info(bean);
		logger.info("exit from OpeningDetailsRowMapper");
		return bean;
	}

}
