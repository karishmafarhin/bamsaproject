package com.bamsa.db.impls.mappers;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.ClockTimeBean;

public class ClockDetailsRowMapper implements RowMapper<ClockTimeBean> {

	private static Logger logger = Logger.getLogger(ClockDetailsRowMapper.class);
	public ClockTimeBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("Enter into ClockTimeBean");

		ClockTimeBean clockTimeDetails = new ClockTimeBean();
		clockTimeDetails.setUid(rs.getInt("uid"));
		clockTimeDetails.setClockInipAddress(rs.getString("inip"));
		clockTimeDetails.setClockInDay(rs.getTimestamp("indate"));
		clockTimeDetails.setClockOutipAddress(rs.getString("outip"));
		clockTimeDetails.setClockOutDay(rs.getTimestamp("outdate"));
		clockTimeDetails.setEmpid(rs.getString("empid"));
		logger.info(clockTimeDetails);
		logger.info("exit from ClockTimeBean");
			
		return clockTimeDetails;
	}

}
