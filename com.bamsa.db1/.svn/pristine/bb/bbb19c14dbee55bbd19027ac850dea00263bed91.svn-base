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

import com.bamsa.db.beans.ContactBean;
import com.bamsa.db.dao.ContactDAO;
import com.bamsa.db.exceptions.DBUpdateException;
import com.bamsa.db.impls.mappers.AccountDetailsRowMapper;
import com.bamsa.db.impls.mappers.AccountOwnerRowMapper;
import com.bamsa.db.impls.mappers.HotlistRowMapper;
import com.bamsa.db.impls.mappers.SubconractEmailsRowmapper;
import com.bamsa.db.impls.stmtsetters.AccountDetailsStmtSetter;
import com.bamsa.db.util.DBConstants;
import com.bamsa.db.util.ErrorConstants;
@Repository
public class ContactDAOImpl implements ContactDAO{
	@Autowired
	private Properties dbProps;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private static Logger logger = Logger.getLogger(ContactDAOImpl.class);
	@Override
	public ContactBean saveContactdetails(ContactBean contactdetails) {
		logger.info("enter into saveContactdetails");
		DataSource dataSource = jdbcTemplate.getDataSource();
		
		if(null != contactdetails){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			
			Map<String,Object> recordParameters = new HashMap<String,Object>();
			recordParameters.put("accountname", contactdetails.getAccountName());
			recordParameters.put("accountowner", contactdetails.getAccountOwner());
			recordParameters.put("category", contactdetails.getCategory());
			recordParameters.put("website", contactdetails.getWebsite());
			recordParameters.put("status", contactdetails.getStatus());
			
			recordParameters.put("phoneno", contactdetails.getPhoneno());
			recordParameters.put("state", contactdetails.getState());
			recordParameters.put("city", contactdetails.getCity());
			recordParameters.put("primaryemail", contactdetails.getPrimaryemail());
			recordParameters.put("firstname", contactdetails.getFirstname());
			recordParameters.put("lastname", contactdetails.getLastname());
			recordParameters.put("secondaryemail", contactdetails.getSecondaryemail());
			recordParameters.put("reclist", contactdetails.getReqlist());
			recordParameters.put("hotlist", contactdetails.getHotlist());
			recordParameters.put("createddate", contactdetails.getCreateddate());
			recordParameters.put("createdby", contactdetails.getCreatedby());
			logger.info(recordParameters);
            jdbcInsert.withTableName("accountinfo")
			.usingGeneratedKeyColumns("acid");	
			contactdetails.setAcid(jdbcInsert.executeAndReturnKey(recordParameters).intValue());
		}
		
		logger.info("exit from saveContactdetails");
		return contactdetails;		
	}
	@Override
	public List<ContactBean> getAccountDetails()
	{
		logger.info("enter into getaccountdetails");
		String accountquery=dbProps.getProperty(DBConstants.LOAD_ACCOUNT_DETAILS);
		logger.info(accountquery);
		List<ContactBean> accountno=jdbcTemplate.query(accountquery,new AccountDetailsRowMapper());
		logger.info(accountno);
		logger.info("exit from getaccountdetails");
		return accountno;
	}
	@Override
	public ContactBean getAccountOwnerdetails(String accountowner) {
		logger.info("enter into getAccountOwnerdetails");
		String ownerdetails=dbProps.getProperty(DBConstants.LOAD_ACCOUNTOWNER_DETAILS);
		logger.info(ownerdetails);
		List<ContactBean> ownerdet=jdbcTemplate.query(ownerdetails, new Object[]{accountowner}, new AccountOwnerRowMapper());
		logger.info(ownerdet);
		logger.info("exit from getAccountOwnerdetails");
		return ownerdet.get(0);
	}
	@Override
	public List<ContactBean> getSubcontractEmails() {
		logger.info("enter into getSubcontactEmails");
		String emailquery=dbProps.getProperty(DBConstants.LOAD_SUBCONTRACT_EMAILS);
		List<ContactBean> allemails=jdbcTemplate.query(emailquery,new SubconractEmailsRowmapper());
		logger.info(allemails);
		logger.info("exit  from getSubcontactEmails");
		return allemails;
	}
	@Override
	public ContactBean updateContactDetails(ContactBean contactdetails) throws DBUpdateException {
		logger.info("enter into updateContactDetails");
		  try{
		String accountdetails=dbProps.getProperty(DBConstants.UPDATE_ACCOUNTINFO_DETAILS);
		int numberofrecords=jdbcTemplate.update(accountdetails,new AccountDetailsStmtSetter(contactdetails));
		if(numberofrecords==0){
			DBUpdateException dbexception=new DBUpdateException("Zero Records updated");
			dbexception.setErrorCode(ErrorConstants.ACCOUNT_DETAILS_UPDATE_FAILED);
		}
		  }catch(Exception e){
				logger.error(e.getMessage());
			}
		logger.info("exit from updateContactDetails");
		return contactdetails;
	}
	
	
	
	
	

		}
