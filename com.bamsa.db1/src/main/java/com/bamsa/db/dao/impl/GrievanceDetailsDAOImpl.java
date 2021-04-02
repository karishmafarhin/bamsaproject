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

import com.bamsa.db.beans.GrievanceDetails;
import com.bamsa.db.dao.GrievanceDetailsDAO;
import com.bamsa.db.exceptions.DBUpdateException;
import com.bamsa.db.impls.mappers.GrievanceDetailsRowMapper;
import com.bamsa.db.impls.stmtsetters.GrievancesTicketUpdateStmtSetter;
import com.bamsa.db.util.DBConstants;
import com.bamsa.db.util.ErrorConstants;
@Repository
public class GrievanceDetailsDAOImpl implements GrievanceDetailsDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private Properties dbProps;
	private static Logger logger = Logger.getLogger(GrievanceDetailsDAOImpl.class);
	@Override
	 public GrievanceDetails  saveGrievanceDetails(GrievanceDetails grievancedt)
	 {
		logger.info("enter into saveGrievanceDetails");
		DataSource dataSource = jdbcTemplate.getDataSource();
		try{
		 if(null != grievancedt )
		 {
			 SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			 Map<String,Object> recordParameters = new HashMap<String,Object>();
			 recordParameters.put("uid",grievancedt.getUid());
			 recordParameters.put("grievancetype",grievancedt.getGrievancetype() );
			 recordParameters.put("grievancesevere", grievancedt.getGrievancesevere());
			 recordParameters.put("mobileNo",grievancedt.getMobileNo());
			 recordParameters.put("grievancedetails",grievancedt.getGrievancedetails());
			 recordParameters.put("status", "NF");
			 logger.info(recordParameters);
			 jdbcInsert.withTableName("grievancedetails").usingGeneratedKeyColumns("gid");
			 grievancedt.setGid(jdbcInsert.executeAndReturnKey(recordParameters).intValue());	 
		 }
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		 logger.info("exit from saveGrievanceDetails");
		 return grievancedt;	 
	 }
	@Override
	 public List<GrievanceDetails> getAllGrievances()
	 {
		 logger.info("enter into getAllGrievances");
		 String allgrievancesquery = dbProps.getProperty(DBConstants.LOAD_ALL_GRIEVANCE_DETAILS); 
		 List<GrievanceDetails> allgrievances = jdbcTemplate.query(allgrievancesquery,new GrievanceDetailsRowMapper());
		 logger.info(allgrievances);
		 logger.info("exit from getAllGrievances");
		 return allgrievances;
	 }
	@Override
	public List<String> getAllEmployeeEmails()
	{
		logger.info("enter into getAllEmployeeEmails");
		String emailquery=dbProps.getProperty(DBConstants.LOAD_EMAILS_EMPLOYEE);
		List<String> allemails=jdbcTemplate.queryForList(emailquery, String.class);
		logger.info(allemails);
        return allemails;		
	}
	
	@Override
	 public GrievanceDetails updateGrievanceTicketStatus(GrievanceDetails bean)throws DBUpdateException
	 {
		logger.info("enter into updategrievanceticketstatus");
		try{
		String ticketupdate=dbProps.getProperty(DBConstants.UPDATE_GRIEVCETICKET);
		int numberRecordsUpdated=jdbcTemplate.update(ticketupdate, new GrievancesTicketUpdateStmtSetter(bean));
		 if(numberRecordsUpdated == 0){
	            DBUpdateException dbException = new DBUpdateException("Zero Records updated");
	            dbException.setErrorCode(ErrorConstants.UPDATE_GRIEVANCETICKET_FAILED);
	            throw dbException;
	        }
		
		
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		logger.info("exit from updateGrievanceTicketStatus details");
        return bean;	
	 }
	
}
