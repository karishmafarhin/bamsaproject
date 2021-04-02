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

import com.bamsa.db.beans.AssetTicketBean;
import com.bamsa.db.beans.CompanyAccessoryBean;
import com.bamsa.db.beans.CompanyAssetsBean;
import com.bamsa.db.beans.CompanyComponentBean;
import com.bamsa.db.beans.CompanyConsumableBean;
import com.bamsa.db.beans.CompanyLicensesBean;
import com.bamsa.db.beans.EmployeeDetails;
import com.bamsa.db.beans.NewBranchBean;
import com.bamsa.db.dao.AssetsDAO;
import com.bamsa.db.exceptions.DBUpdateException;
import com.bamsa.db.impls.mappers.CompanyConsumableRowMapper;
import com.bamsa.db.impls.mappers.CompanyLicenseRowMapper;
import com.bamsa.db.impls.mappers.ReportUserRowMapper;
import com.bamsa.db.impls.stmtsetters.BrokenStatusUpdateStmtSetter;
import com.bamsa.db.impls.stmtsetters.RepairStatusUpdateStmtSetter;
import com.bamsa.db.impls.stmtsetters.UserDetailStmtSetter;
import com.bamsa.db.impls.mappers.AssetTicketRowMpper;
import com.bamsa.db.impls.mappers.CompanyAccessoryRowMapper;
import com.bamsa.db.impls.mappers.CompanyAssetsRowMapper;
import com.bamsa.db.impls.mappers.CompanyComponentRowMapper;
import com.bamsa.db.impls.mappers.EmployeeDetailsRowMapper;
import com.bamsa.db.util.DBConstants;
import com.bamsa.db.util.ErrorConstants;
import com.bamsa.db.impls.stmtsetters.AssetTakeHomeStmtSetter;
@Repository
public class AssetsDAOImpl implements AssetsDAO{
	@Autowired
	private Properties dbProps;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private static Logger logger = Logger.getLogger(AssetsDAOImpl.class);
	@Override
	public CompanyAssetsBean createAsset(CompanyAssetsBean bean){
		logger.info("enter into createAsset");
		DataSource dataSource = jdbcTemplate.getDataSource();
		
		if(null != bean){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			jdbcInsert.withTableName("companyassets")
			.usingGeneratedKeyColumns("caid");
			Map<String,Object> recordParameters = new HashMap<String,Object>();
			recordParameters.put("assetname",bean.getAssetName());
			recordParameters.put("assettag",bean.getAssetTag());
			recordParameters.put("createdby", bean.getCreatedBy());
			recordParameters.put("createddate",bean.getCreatedDate());
			recordParameters.put("assetstatus",bean.getAssetStatus());
			recordParameters.put("branchname", bean.getBranchname());
			recordParameters.put("assetserial",bean.getAssetSerial());
			recordParameters.put("purchasedate",bean.getPurchasedDate());
			recordParameters.put("supplier",bean.getSupplier());
			recordParameters.put("orderno",bean.getOrderNo());
			recordParameters.put("purchasecost",bean.getPurchaseCost());
			recordParameters.put("warranty",bean.getWarranty());
			recordParameters.put("notes",bean.getNotes());
			recordParameters.put("assetimage",bean.getAssetImage());
			recordParameters.put("model",bean.getModel());
			logger.info(recordParameters);
			bean.setCaid(jdbcInsert.executeAndReturnKey(recordParameters).intValue());
			logger.info("asset created");
			
		}
		logger.info("exit from createAsset");
		return bean;
	}
	@Override
	 public CompanyAccessoryBean createAccessory(CompanyAccessoryBean bean)
	{
		logger.info("enter into createAccessory");
		DataSource dataSource = jdbcTemplate.getDataSource();		
		if(null != bean){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			jdbcInsert.withTableName("companyaccessories")
			.usingGeneratedKeyColumns("caid");
			
			Map<String,Object> recordParameters = new HashMap<String,Object>();
			recordParameters.put("createdby", bean.getUserid());
			recordParameters.put("createddate", bean.getCreatedDate());
			recordParameters.put("accessoryname",bean.getAccessoryname());
			recordParameters.put("accessorycategory", bean.getCategory());
			recordParameters.put("manufacturer",bean.getManufacturer());
			recordParameters.put("modelno",bean.getModelno());
			recordParameters.put("orderno", bean.getOrderno());
			recordParameters.put("purchasedate", bean.getPurchaseDate());
			recordParameters.put("purchasecost", bean.getPurchasecost());
			recordParameters.put("quantity",bean.getQuantity());
			recordParameters.put("accessoriestag", bean.getAccessorytag());
			recordParameters.put("branchname", bean.getBranchname());
			logger.info(recordParameters);
			int caid=jdbcInsert.executeAndReturnKey(recordParameters).intValue();
		}
		logger.info("exit from createAccessory");
		return bean;
	}
	
	public CompanyComponentBean createComponent(CompanyComponentBean bean){
		
		logger.info("enter into createComponent");
		DataSource dataSource = jdbcTemplate.getDataSource();		
		if(null != bean){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			jdbcInsert.withTableName("companycomponents")
			.usingGeneratedKeyColumns("ccmid");

			Map<String,Object> recordParameters = new HashMap<String,Object>();
			recordParameters.put("createdby", bean.getUserid());
			recordParameters.put("createddate", bean.getCreatedDate());
			recordParameters.put("componentname",bean.getComponentName());
			recordParameters.put("branchname", bean.getBranchname());
			recordParameters.put("category", bean.getCategory());
			recordParameters.put("serialno",bean.getSerialNo());
			recordParameters.put("orderno",bean.getOrderNo());
			recordParameters.put("purchaseddate", bean.getPurchasedDate());
			recordParameters.put("purchasecost", bean.getPurchaseCost());
			recordParameters.put("componenttag", bean.getComponenttag());
			logger.info(recordParameters);
			int ccmid=jdbcInsert.executeAndReturnKey(recordParameters).intValue();
		   
		}
		logger.info("exit from createComponent");
		return bean;
		
	}
	
	@Override
	public CompanyLicensesBean createLicense(CompanyLicensesBean bean) {
		logger.info("enter into createLicense");
		DataSource dataSource = jdbcTemplate.getDataSource();
		if(null != bean){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			


			Map<String,Object> recordParameters = new HashMap<String,Object>();
			recordParameters.put("softwarename",bean.getSoftwareName());
			recordParameters.put("createdby",bean.getCreatedBy());
			recordParameters.put("createddate",bean.getCreatedDate());
			recordParameters.put("licensetag",bean.getLicenseTag());
			recordParameters.put("branchname", bean.getBranchname());
			recordParameters.put("seats",bean.getSeats());
			recordParameters.put("manufacturer",bean.getManufacturer());
			recordParameters.put("licensedto",bean.getLicensedTo());
			recordParameters.put("licensedmail",bean.getLicensedMail());
			recordParameters.put("productkey",bean.getProductKey());
			recordParameters.put("orderno",bean.getOrderNo());
			recordParameters.put("purchasecost",bean.getPurchaseCost());
			recordParameters.put("purchasedate",bean.getPurchasedDate());
			recordParameters.put("notes",bean.getNotes());
			recordParameters.put("expirationdate",bean.getExpirationDate());
			logger.info(recordParameters);
			jdbcInsert.withTableName("companylicenses")
			.usingGeneratedKeyColumns("clid");
			bean.setClid(jdbcInsert.executeAndReturnKey(recordParameters).intValue());

		}
		
		logger.info("exit from createLicenses");
		return bean;
	}
	@Override
	public CompanyConsumableBean createConsumable(CompanyConsumableBean bean) {
		logger.info("enter into createConsumable");
		DataSource dataSource = jdbcTemplate.getDataSource();
		
		if(null != bean){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			
			Map<String,Object> recordParameters = new HashMap<String,Object>();
			recordParameters.put("consumablename",bean.getConsumableName());
			recordParameters.put("consumabletag",bean.getConsumableTag());
			recordParameters.put("branchname", bean.getBranchname());
			recordParameters.put("createdby",bean.getCreatedBy());
			recordParameters.put("createddate",bean.getCreatedDate());
			recordParameters.put("consumablecategory",bean.getCategory());
			recordParameters.put("manufacturer",bean.getManufacturer());
			recordParameters.put("modelno",bean.getModelNo());
			recordParameters.put("itemno",bean.getItemNo());
			recordParameters.put("orderno",bean.getOrderNo());
			recordParameters.put("purchasecost",bean.getPurchaseCost());
			recordParameters.put("purchasedate",bean.getPurchasedDate());
			recordParameters.put("quantity",bean.getQuantity());
		    logger.info(recordParameters);
		    jdbcInsert.withTableName("companyconsumables")
			.usingGeneratedKeyColumns("ccid");
			bean.setCcid(jdbcInsert.executeAndReturnKey(recordParameters).intValue());

		}
		
		logger.info("exit from createConsumables");
		return bean;
	}
	@Override
	public List<CompanyAssetsBean> getCompanyAsset() {
		logger.info("enter into getCompanyAsset");
		String getAssets=dbProps.getProperty(DBConstants.LOAD_COMPANY_ASSETS);
		List<CompanyAssetsBean> details=jdbcTemplate.query(getAssets, new CompanyAssetsRowMapper());
		logger.info(details);
        logger.info("exit from getCompanyAsset");
		return details;		

	}
	@Override
	public List<CompanyLicensesBean>  getCompanyLicensesDetails()
	{
		logger.info("enter into getCompanyLicensesDetails");
		String licensequery=dbProps.getProperty(DBConstants.LOAD_LICENSE_DETAILS);
		List<CompanyLicensesBean> details =jdbcTemplate.query(licensequery, new CompanyLicenseRowMapper());	
	    logger.info("exit from getCompanyLicensesDetails");
	    return details;
	}
	@Override
	public List<CompanyAccessoryBean> getCompanyAccessory() {
		logger.info("enter into getCompanyAccessory");
		String getAccessory=dbProps.getProperty(DBConstants.LOAD_COMPANY_ACCESSORY);
		List<CompanyAccessoryBean> details=jdbcTemplate.query(getAccessory, new CompanyAccessoryRowMapper());
		logger.info(details);
		logger.info("exit from getCompanyAccessory");
		return details;
	}
	@Override
	public List<CompanyConsumableBean> getCompanyConsumableDetails(){
		logger.info("enter into getCompanyConsumableDetails");
      String conusmablequery =dbProps.getProperty(DBConstants.LOAD_CONSUMABLE_DETAILS);
      List<CompanyConsumableBean> details=jdbcTemplate.query(conusmablequery, new CompanyConsumableRowMapper());	
      logger.info("exit from getCompanyConsumableDetails");
      return details;
	   
	}
	@Override
	public List<CompanyComponentBean> getCompanyComponent() {
		logger.info("enter into getCompanyComponent");
		String getComponent=dbProps.getProperty(DBConstants.LOAD_COMPANY_COMPONENT);
		List<CompanyComponentBean> details=jdbcTemplate.query(getComponent, new CompanyComponentRowMapper());
		logger.info(details);
		logger.info("exit from getCompanyComponent");
		return details;
	}
	
	@Override
	public AssetTicketBean createAssetTicket(AssetTicketBean bean)
	{
		logger.info("enter into createAssetTicket");
		DataSource dataSource = jdbcTemplate.getDataSource();
		try
		{
		if(null != bean){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			Map<String,Object> recordParameters = new HashMap<String,Object>();
			recordParameters.put("risedby",bean.getRisedby());
			recordParameters.put("riseddate",bean.getRiseddate());
			recordParameters.put("assettype",bean.getAssettype());
			recordParameters.put("tag", bean.getTag());
			recordParameters.put("requestto", bean.getRequestto());
			recordParameters.put("purpose", bean.getPurpose());
			recordParameters.put("remarks", bean.getRemarks());
			recordParameters.put("fromdate",bean.getFromdate());
			recordParameters.put("todate",bean.getTodate());
			recordParameters.put("thstatus",bean.getThstatus());
			recordParameters.put("rstatus",bean.getRstatus());
			recordParameters.put("bstatus",bean.getBstatus());
			logger.info(recordParameters);
			jdbcInsert.withTableName("assettickets")
			.usingGeneratedKeyColumns("atid");
			bean.setAtid(jdbcInsert.executeAndReturnKey(recordParameters).intValue());

		}
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		logger.info("exit from createAssetTicket");
		return bean;
		
		
	}
	
	
	@Override
	public List<AssetTicketBean> getAssetTicket() {
		logger.info("enter into getAssetTicket");
	String getTicket=dbProps.getProperty(DBConstants.LOAD_ASSET_TICKETS);
	List<AssetTicketBean> details=jdbcTemplate.query(getTicket,new AssetTicketRowMpper());
	logger.info(details);
	logger.info("exit from getAssetTicket");
		return details;
	}
	@Override
	public AssetTicketBean updateAssetStatus(AssetTicketBean bean)throws DBUpdateException {
		logger.info("Enter into updateAssetStatus");
		int atid=bean.getAtid();
		logger.info(atid);
		String updateQuery=dbProps.getProperty(DBConstants.UPDATE_ASSET_THSTATUS);
		int numberRecordsUpdated =jdbcTemplate.update(updateQuery,new AssetTakeHomeStmtSetter(bean));;
		 if(numberRecordsUpdated == 0){
			  DBUpdateException dbException = new DBUpdateException("Zero Records updated");
	            dbException.setErrorCode(ErrorConstants.UPDATE_THSTATUS_FAILED);
	            throw dbException;
	        }
	        logger.info("exit from updateAssetStatus ");
	        return bean;	
	}
	
	
	@Override
	public AssetTicketBean updateBstatusOfAssetTicket(AssetTicketBean bean) throws DBUpdateException
	{
		logger.info("enter into updateBstatusOfAssetTicket");
		int atid=bean.getAtid();
		logger.info(atid);
		String updateQuery = dbProps.getProperty(DBConstants.UPDATE_BSTATUS);
		 int numberRecordsUpdated = jdbcTemplate.update(updateQuery,new BrokenStatusUpdateStmtSetter(bean));
		 if(numberRecordsUpdated == 0){
	            DBUpdateException dbException = new DBUpdateException("Zero Records updated");
	            dbException.setErrorCode(ErrorConstants.TICKET_DETAILS_FAILED);
	            throw dbException;
	        }
		
		logger.info("exit from updateBstatusOfAssetTicket");
		return bean;
	}
	
	@Override
	  public AssetTicketBean updateRstatusOfAssetTicket(AssetTicketBean bean) throws DBUpdateException{
		
		try{
		logger.info("enter into updateRstatusOfAssetTicket");
		int atid=bean.getAtid();
		logger.info(atid);
		String updateQuery = dbProps.getProperty(DBConstants.UPDATE_RSTATUS);
		 int numberRecordsUpdated = jdbcTemplate.update(updateQuery,new RepairStatusUpdateStmtSetter(bean));
		 if(numberRecordsUpdated == 0){
	            DBUpdateException dbException = new DBUpdateException("Zero Records updated");
	            dbException.setErrorCode(ErrorConstants.TICKET_DETAILS_FAILED);
	            throw dbException;
	        }
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		logger.info("exit from updateRstatusOfAssetTicket");
		return bean;
		
		
	}
	@Override
	public NewBranchBean saveBranchDetails(NewBranchBean branch) {
		logger.info("enter into saveBranchDetails");
		DataSource dataSource = jdbcTemplate.getDataSource();
		try{
		if(branch!=null){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			Map<String,Object> recordParameters = new HashMap<String,Object>();
			recordParameters.put("branchname", branch.getBranchname());
			recordParameters.put("state", branch.getState());
			recordParameters.put("createddate", branch.getCreateddate());
			jdbcInsert.withTableName("createbranch")
			.usingGeneratedKeyColumns("nbid");
			logger.info("branch details inserted");
			jdbcInsert.executeAndReturnKey(recordParameters).intValue();
			
	}
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		logger.info(branch);
		logger.info("exit from saveBranchDetails");
		return branch;
	}
	@Override
	public List<String> getBranchNameDetails() {
		logger.info("enter into getBranchNameDetails");
		String assetdetails=dbProps.getProperty(DBConstants.BRANCHNAME_DETAILS);
		List<String> allbranch=jdbcTemplate.queryForList(assetdetails, String.class);
		logger.info(allbranch);
		return allbranch;
	}

}
