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

import com.bamsa.db.beans.CandidateInfoBean;
import com.bamsa.db.beans.ContactBean;
import com.bamsa.db.beans.EmployeeDetails;
import com.bamsa.db.dao.CandidateInfoDAO;
import com.bamsa.db.exceptions.DBUpdateException;
import com.bamsa.db.impls.mappers.AssignedToRowMapper;
import com.bamsa.db.impls.mappers.CandidateDetailsRowMapper;
import com.bamsa.db.impls.mappers.HotlistRowMapper;
import com.bamsa.db.impls.mappers.ReportUserRowMapper;
import com.bamsa.db.impls.stmtsetters.CandidateDetailsStmtSetter;
import com.bamsa.db.impls.stmtsetters.HotlistDetailsStmtSetter;
import com.bamsa.db.impls.stmtsetters.UserDetailStmtSetter;
import com.bamsa.db.util.DBConstants;
import com.bamsa.db.util.ErrorConstants;

@Repository
public class CandidateInfoDAOImpl implements CandidateInfoDAO{
	@Autowired
	private Properties dbProps;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private static Logger logger = Logger.getLogger(CandidateInfoDAOImpl.class);
	@Override
	public CandidateInfoBean saveCandidatedetails(CandidateInfoBean details) {
		logger.info("enter into saveCandidatedetails");
		DataSource dataSource = jdbcTemplate.getDataSource();
		
		if(null != details){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			
			Map<String,Object> recordParameters = new HashMap<String,Object>();
			recordParameters.put("firstname", details.getFirstName());
			recordParameters.put("middlename", details.getMiddleName());
			recordParameters.put("lastname", details.getLastName());
			recordParameters.put("emailid", details.getEmailid());
			recordParameters.put("contactno", details.getMobile());
			recordParameters.put("availablefrom", details.getAvailableFrom());
			recordParameters.put("visastatus", details.getVisaStatus());
			recordParameters.put("gender", details.getGender());
			recordParameters.put("createddate", details.getCreatedDate());
			recordParameters.put("primaryskills", details.getPrimaryskills());
			recordParameters.put("coverletter", details.getCoverletter());
			recordParameters.put("resume", details.getResume());
			recordParameters.put("state", details.getState());
			recordParameters.put("city", details.getCity());
			recordParameters.put("relocation", details.getRelocate());
			recordParameters.put("typeofconsultant", details.getTypeofConsultant());
			recordParameters.put("hotlist", details.getHotlist());
			recordParameters.put("ssnno", details.getSsn());
			recordParameters.put("billrate", details.getBillRateType());
			recordParameters.put("rate", details.getRate());
			recordParameters.put("createdby", details.getCreatedby());
			logger.info(recordParameters);
            jdbcInsert.withTableName("candidateinfo")
			.usingGeneratedKeyColumns("ciid");	
			details.setCiid(jdbcInsert.executeAndReturnKey(recordParameters).intValue());
		}
		
		logger.info("exit from saveCandidatedetails");
		return details;		
	}
	@Override
	public List<EmployeeDetails> getAssignedtodetails() {
		logger.info("enter into getAssignedtodetails ");
		String empdetails =dbProps.getProperty(DBConstants.SOURCE_ASSIGNTO_DETAILS);
		logger.info(empdetails);
		List<EmployeeDetails> details=jdbcTemplate.query(empdetails,new AssignedToRowMapper());
		logger.info(details);
		logger.info("exit from getAssignedtodetails ");
		return details;
	}
	@Override
	public List<CandidateInfoBean> getCandidateDetails()
	{
		logger.info("enter into getCandidateDetails ");
		String query=dbProps.getProperty(DBConstants.LOAD_CANDIDATE_DETAILS);
		logger.info(query);
		List<CandidateInfoBean> bean=jdbcTemplate.query(query,new CandidateDetailsRowMapper());
	     logger.info(bean);
	     return bean;
	}
	@Override
	public CandidateInfoBean updateCandidateDetails(CandidateInfoBean candidatedetails) throws DBUpdateException {
		logger.info("enter into updateCandidateDetails");
		
		try{
		
        String updateQuery = dbProps.getProperty(DBConstants.UPDATE_CANDIDATE_DETAILS);
        int numberRecordsUpdated = jdbcTemplate.update(updateQuery,new CandidateDetailsStmtSetter(candidatedetails));
        if(numberRecordsUpdated == 0){
            DBUpdateException dbException = new DBUpdateException("Zero Records updated");
            dbException.setErrorCode(ErrorConstants.CANDIDTAE_DETAILS_UPDATE_FAILED);
            throw dbException;
        }
		}catch(Exception e){
			logger.error(e.getMessage());
		}
        logger.info("exit from updateCandidateDetails");
        return candidatedetails;
    
	}
	@Override
	public List<CandidateInfoBean> getHotlistdetails() {
		logger.info("enter into getHotlistdetails");
		String hotlists =dbProps.getProperty(DBConstants.HOTLIST_CANDIDATES);
		logger.info(hotlists);
		List<CandidateInfoBean> hotdetails=jdbcTemplate.query(hotlists, new HotlistRowMapper());
		logger.info(hotdetails);
		logger.info("exit from getHotlistdetails");
		return hotdetails;
	}
	@Override
	public CandidateInfoBean updateHotlistDetails(CandidateInfoBean hotlistdetails) throws DBUpdateException {
		logger.info("enter into updateHotlistDetails");
        try{
        	String updatequery=dbProps.getProperty(DBConstants.UPDATE_HOTLIST_DETAILS);
        	 int numberRecordsUpdated = jdbcTemplate.update(updatequery,new HotlistDetailsStmtSetter(hotlistdetails));
        	 if(numberRecordsUpdated == 0){
                 DBUpdateException dbException = new DBUpdateException("Zero Records updated");
                 dbException.setErrorCode(ErrorConstants.HOTLIST_DETAILS_UPDATE_FAILED);
                 throw dbException;
        }
        }catch(Exception e){
			logger.error(e.getMessage());
		}
        logger.info("exit from updateCandidateDetails");
        return hotlistdetails;
    
	}
	
	

}
