package com.bamsa.db.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.bamsa.db.beans.ClockTimeBean;
import com.bamsa.db.dao.TimeSheetsDAO;
import com.bamsa.db.impls.mappers.ClockDetailsRowMapper;
import com.bamsa.db.impls.stmtsetters.ClockTimeStmtSetter;
import com.bamsa.db.util.DBConstants;
import com.bamsa.db.exceptions.DBUpdateException;
import com.bamsa.db.util.ErrorConstants;
@Repository
public class TimeSheetsDAOImpl implements TimeSheetsDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private Properties dbProps;
	private static Logger logger = Logger.getLogger(TimeSheetsDAOImpl.class);
	public ClockTimeBean saveClockInDetails(ClockTimeBean bean){
		logger.info("Enter into saveClockInDetails");
		DataSource dataSource = jdbcTemplate.getDataSource();
		if(bean!=null){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			Map<String,Object> recordParameters = new HashMap<String,Object>();
			logger.info(recordParameters);
			recordParameters.put("uid",bean.getUid());
			recordParameters.put("inip",bean.getClockInipAddress());
			recordParameters.put("indate", bean.getClockInDay());
			jdbcInsert.withTableName("clocktimedetails")
			.usingGeneratedKeyColumns("ctid");
			logger.info("clocktimedetails inserted");
			bean.setCtid(jdbcInsert.executeAndReturnKey(recordParameters).intValue());
		}
		logger.info("Exit from saveClockInDetails");
		return bean;
	}
	public List<ClockTimeBean> getClockTimeDetails(int uid){
		logger.info("enter into getClockTimeDetails");
		String clockDetailsQuery = dbProps.getProperty(DBConstants.LOAD_CLOCK_DETAILS);
		List<ClockTimeBean> clockDetails = jdbcTemplate.query(clockDetailsQuery, new Object[]{uid}, new ClockDetailsRowMapper());
		logger.info(clockDetails);
		logger.info("exit from getClockTimeDetails");
		return clockDetails;
	}
	public ClockTimeBean saveClockOutDetails(ClockTimeBean bean) throws DBUpdateException{
		logger.info("enter into saveClockOutDetails");
        String clockInUpdateDetailsQuery =dbProps.getProperty(DBConstants.UPDATE_CLOCK_DETAILS);
		int numberRecordsUpdated = jdbcTemplate.update(clockInUpdateDetailsQuery,new ClockTimeStmtSetter(bean));
			if(numberRecordsUpdated == 0){
			DBUpdateException dbException = new DBUpdateException("Zero Records updated");
			dbException.setErrorCode(ErrorConstants.CLOCK_DETAILS_UPDATE_FAILED);
			throw dbException;
		}
			logger.info("exit from saveClockOutDetails");	
	return bean;	
	}
}
