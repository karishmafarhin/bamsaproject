package com.bamsa.web.builder;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.bamsa.db.beans.AssetTicketBean;
import com.bamsa.db.beans.CompanyAccessoryBean;
import com.bamsa.db.beans.CompanyAssetsBean;
import com.bamsa.db.beans.CompanyComponentBean;
import com.bamsa.web.model.AssetTicketModel;
import com.bamsa.web.model.CompanyAccessoryModel;
import com.bamsa.web.model.CompanyAssetModel;
import com.bamsa.web.model.CompanyComponentModel;
import com.bamsa.db.beans.CompanyAssetsBean;
import com.bamsa.db.beans.CompanyConsumableBean;
import com.bamsa.db.beans.CompanyLicensesBean;
import com.bamsa.db.beans.NewBranchBean;
import com.bamsa.web.model.CompanyAccessoryModel;
import com.bamsa.web.model.CompanyAssetModel;
import com.bamsa.web.model.CompanyConsumableModel;
import com.bamsa.web.model.CompanyLicenseModel;
import com.bamsa.web.model.NewBranchModel;

@Component
public class AssetsBuilder {
	private static Logger logger = Logger.getLogger(AssetsBuilder.class);
	public CompanyAssetsBean buildCompanyAssetBean(CompanyAssetModel model){
		logger.info("enter into buildCompanyAssetBean");
		CompanyAssetsBean bean =new CompanyAssetsBean();
		bean.setAssetTag(model.getAssetTag());
		bean.setCreatedBy(model.getCreatedBy());
		bean.setCreatedDate(model.getCreatedDate());
		bean.setModel(model.getModel());
		bean.setAssetStatus(model.getAssetStatus());
		bean.setBranchname(model.getBranchname());
		bean.setAssetSerial(model.getAssetSerial());
		bean.setAssetName(model.getAssetName());
		bean.setPurchasedDate(model.getPurchasedDate());
		bean.setSupplier(model.getSupplier());
		bean.setOrderNo(model.getOrderNo());
		bean.setPurchaseCost(model.getPurchaseCost());
		bean.setWarranty(model.getWarranty());
		bean.setNotes(model.getNotes());
		bean.setAssetImage(model.getAssetImage());
		logger.info(bean);
		logger.info("Exit from buildCompanyAssetBean");
		return bean;
	}
	public CompanyAssetModel buildCompanyAssetModel (CompanyAssetsBean bean){
		logger.info("enter into buildCompanyAssetBean");
		CompanyAssetModel model =new CompanyAssetModel();
		model.setAssetTag(bean.getAssetTag());
		model.setCreatedBy(bean.getCreatedBy());
		model.setCreatedDate(bean.getCreatedDate());
		model.setModel(bean.getModel());
		model.setAssetStatus(bean.getAssetStatus());
		model.setBranchname(bean.getBranchname());
		model.setAssetSerial(bean.getAssetSerial());
		model.setAssetName(bean.getAssetName());
		model.setPurchasedDate(bean.getPurchasedDate());
		model.setSupplier(bean.getSupplier());
		model.setOrderNo(bean.getOrderNo());
		model.setPurchaseCost(bean.getPurchaseCost());
		model.setWarranty(bean.getWarranty());
		model.setNotes(bean.getNotes());
		model.setAssetImage(bean.getAssetImage());
		logger.info(model);
		logger.info("Exit from buildCompanyAssetBean");
		return model;
	}
	public CompanyLicensesBean buildCompanyLicensesBean (CompanyLicenseModel model){
		logger.info("enter into buildCompanyLicensesBean");
		CompanyLicensesBean bean = new CompanyLicensesBean();
		bean.setSoftwareName(model.getSoftwareName());
		bean.setLicenseTag(model.getLicenseTag());
		bean.setBranchname(model.getBranchname());
		bean.setCreatedBy(model.getCreatedBy());
		bean.setCreatedDate(model.getCreatedDate());
		bean.setSeats(model.getSeats());
		bean.setManufacturer(model.getManufacturer());
		bean.setLicensedTo(model.getLicensedTo());
		bean.setLicensedMail(model.getLicensedMail());
		bean.setProductKey(model.getProductKey());
		bean.setOrderNo(model.getOrderNo());
		bean.setPurchasedDate(model.getPurchasedDate());
		bean.setPurchaseCost(model.getPurchaseCost());
		bean.setNotes(model.getNotes());
		bean.setExpirationDate(model.getExpirationDate());
		logger.info(bean);
		logger.info("Exit from buildCompanyLicensesBean");
		return bean;
		
	}

public CompanyLicenseModel buildCompanyLicenseModel (CompanyLicensesBean bean){
	logger.info("enter into buildCompanyLicenseModel");
	CompanyLicenseModel model = new CompanyLicenseModel();
	model.setSoftwareName(bean.getSoftwareName());
	model.setLicenseTag(bean.getLicenseTag());
	model.setBranchname(bean.getBranchname());
	model.setCreatedBy(bean.getCreatedBy());
	model.setCreatedDate(bean.getCreatedDate());
	model.setSeats(bean.getSeats());
	model.setManufacturer(bean.getManufacturer());
	model.setLicensedTo(bean.getLicensedTo());
	model.setLicensedMail(bean.getLicensedMail());
	model.setProductKey(bean.getProductKey());
	model.setOrderNo(bean.getOrderNo());
	model.setPurchasedDate(bean.getPurchasedDate());
	model.setPurchaseCost(bean.getPurchaseCost());
	model.setNotes(bean.getNotes());
	model.setExpirationDate(bean.getExpirationDate());
	logger.info(model);
	logger.info("Exit from buildCompanyLicenseModel");
	return model;
}
public CompanyConsumableBean buildCompanyConsumableBean (CompanyConsumableModel model){
	logger.info("enter into buildCompanyLicensesBean");
	CompanyConsumableBean bean = new CompanyConsumableBean();
	bean.setConsumableName(model.getConsumableName());
	bean.setConsumableTag(model.getConsumableTag());
	bean.setBranchname(model.getBranchname());
	bean.setCreatedBy(model.getCreatedBy());
	bean.setCreatedDate(model.getCreatedDate());
	bean.setCategory(model.getCategory());
	bean.setManufacturer(model.getManufacturer());
	bean.setModelNo(model.getModelNo());
	bean.setItemNo(model.getItemNo());
	bean.setOrderNo(model.getOrderNo());
	bean.setPurchasedDate(model.getPurchasedDate());
	bean.setPurchaseCost(model.getPurchaseCost());
	bean.setQuantity(model.getQuantity());
	logger.info(bean);
	logger.info("Exit from buildCompanyConsumableBean");
	return bean;
}
public CompanyConsumableModel buildCompanyConsumableModel (CompanyConsumableBean bean){
	logger.info("enter into buildCompanyConsumableModel");
	CompanyConsumableModel model = new CompanyConsumableModel();
	model.setConsumableName(bean.getConsumableName());
	model.setConsumableTag(bean.getConsumableTag());
	model.setBranchname(bean.getBranchname());
	model.setCreatedBy(bean.getCreatedBy());
	model.setCreatedDate(bean.getCreatedDate());
	model.setCategory(bean.getCategory());
	model.setManufacturer(bean.getManufacturer());
	model.setModelNo(bean.getModelNo());
	model.setItemNo(bean.getItemNo());
	model.setOrderNo(bean.getOrderNo());
	model.setPurchasedDate(bean.getPurchasedDate());
	model.setPurchaseCost(bean.getPurchaseCost());
	model.setQuantity(bean.getQuantity());
	logger.info(model);
	logger.info("Exit from buildCompanyConsumableModel");
	return model;
}
	
	public CompanyAccessoryBean buildCompanyAccessoryBean(CompanyAccessoryModel model){
    
		logger.info("enter into buildCompanyAccessoryBean");
		CompanyAccessoryBean bean = new CompanyAccessoryBean();
		bean.setAccessoryname(model.getAccessoryname());
		bean.setCategory(model.getCategory());
		bean.setManufacturer(model.getManufacturer());
		bean.setModelno(model.getModelno());
		bean.setOrderno(model.getOrderno());
		bean.setPurchasecost(model.getPurchasecost());
		bean.setPurchaseDate(model.getPurchaseDate());
		bean.setQuantity(model.getQuantity());
		bean.setUserid(model.getUserid());
		bean.setCreatedDate(model.getCreatedDate());
		bean.setAccessorytag(model.getAccessorytag());
		bean.setBranchname(model.getBranchname());
		logger.info(bean);
		logger.info("exit into buildCompanyAccessoryBean");
		return bean;
}
	
	public CompanyAccessoryModel buildCompanyAccessoryModel (CompanyAccessoryBean bean){
	 
		   logger.info("enter into buildcompanyAccessoryModel");
		   CompanyAccessoryModel model = new CompanyAccessoryModel();
		   model.setAccessoryname(bean.getAccessoryname());
		   model.setCategory(bean.getCategory());
		   model.setManufacturer(bean.getManufacturer());
		   model.setModelno(bean.getModelno());
		   model.setOrderno(bean.getOrderno());
		   model.setPurchasecost(bean.getPurchasecost());
		   model.setPurchaseDate(bean.getPurchaseDate());
		   model.setQuantity(bean.getQuantity());
		   model.setUserid(bean.getUserid());
		   model.setCreatedDate(bean.getCreatedDate());
		   model.setAccessorytag(bean.getAccessorytag());
		   model.setBranchname(bean.getBranchname());
		   logger.info(model);
		   logger.info("exit into buildcompanyAccessoryModel");
		    return model;
	}
	
	public CompanyComponentBean buildCompanyComponentBean(CompanyComponentModel model)
	{
		
		logger.info("enter into buildCompanyComponentBean");
		CompanyComponentBean bean = new CompanyComponentBean();
		bean.setComponentName(model.getComponentName());
		bean.setBranchname(model.getBranchname());
		bean.setCategory(model.getCategory());
		bean.setOrderNo(model.getOrderNo());
		bean.setPurchaseCost(model.getPurchaseCost());
        bean.setPurchasedDate(model.getPurchasedDate());
        bean.setSerialNo(model.getSerialNo());
        bean.setUserid(model.getUserid());
		bean.setCreatedDate(model.getCreatedDate());
		bean.setComponenttag(model.getComponenttag());
        logger.info(bean);
		logger.info("exit into buildCompanyComponentBean");
       return bean;
	}
	
	public CompanyComponentModel buildCompanyComponentModel(CompanyComponentBean bean)
	{ 
		
		logger.info("enter into buildCompanyComponentModel");
		CompanyComponentModel model = new CompanyComponentModel();
		model.setComponentName(bean.getComponentName());
		model.setBranchname(bean.getBranchname());
		model.setCategory(bean.getCategory());
		model.setOrderNo(bean.getOrderNo());
		model.setPurchaseCost(bean.getPurchaseCost());
		model.setPurchasedDate(bean.getPurchasedDate());
		model.setSerialNo(bean.getSerialNo());
		 model.setUserid(bean.getUserid());
		   model.setCreatedDate(bean.getCreatedDate());
         model.setComponenttag(bean.getComponenttag());		
		   logger.info(model);
	    logger.info("exit into buildCompanyComponentModel");
		return model;
		
		
	}
	
	public AssetTicketBean buildAssetTicketBeanDetails(AssetTicketModel model)
	{   logger.info("enter into buildAssetTicketBeanDetails ");
		AssetTicketBean  bean = new AssetTicketBean ();
		bean.setRisedby(model.getRisedby());
		bean.setRiseddate(model.getRiseddate());
		bean.setAssettype(model.getAssettype());
		bean.setTag(model.getTag());
		bean.setRequestto(model.getRequestto());
		bean.setPurpose(model.getPurpose());
		bean.setRemarks(model.getRemarks());
		bean.setFromdate(model.getFromdate());
		bean.setTodate(model.getTodate());
		bean.setThstatus(model.getThstatus());
		bean.setRstatus(model.getRstatus());
		bean.setBstatus(model.getBstatus());
		
		logger.info("exit from buildAssetTicketBeanDetails");
	 return bean;
	}	
	
	public AssetTicketModel buildAssetTicketModelDetails(AssetTicketBean bean)
	{
		logger.info("enter into buildAssetTicketModelDetails");
		AssetTicketModel  model = new AssetTicketModel();
		model.setRisedby(bean.getRisedby());
		model.setRiseddate(bean.getRiseddate());
		model.setAssettype(bean.getAssettype());
		model.setTag(bean.getTag());
		model.setRequestto(bean.getRequestto());
		model.setPurpose(bean.getPurpose());
		model.setRemarks(bean.getRemarks());
		model.setFromdate(bean.getFromdate());
		model.setTodate(bean.getTodate());
		model.setThstatus(bean.getThstatus());
		model.setBstatus(bean.getBstatus());
		model.setRstatus(bean.getRstatus());
		logger.info("exit form buildAssetTicketModelDetails");
		return model;
	}
	
	public AssetTicketBean buildUpdateBstatusOfAssetTicketBean(AssetTicketModel model)
	{
		logger.info("enter into buildUpdateRstatusOfAssetTicketBean");
		AssetTicketBean  bean= new AssetTicketBean();
		
		bean.setApprovedby(model.getApprovedby());
		bean.setApproveddate(model.getApproveddate());
		bean.setAtid(model.getAtid());
		logger.info("exit from buildUpdateRstatusOfAssetTicketBean");
		return bean;
		
	}
	
	public AssetTicketModel buildUpdateBstatusOfAssetTicketModel(AssetTicketBean bean)
	{ 
		logger.info("enter into buildUpdateBstatusOfAssetTicketModel");
		AssetTicketModel  model = new AssetTicketModel();
		
		model.setApprovedby(bean.getApprovedby());
		model.setApproveddate(bean.getApproveddate());
		model.setAtid(bean.getAtid());
		logger.info("exit from buildUpdateBstatusOfAssetTicketModel");
		return model;
	}
	public AssetTicketBean buildUpdateRstatusOfAssetTicketBean(AssetTicketModel model)
	{
		logger.info("enter into buildUpdateRstatusOfAssetTicketBean");
		AssetTicketBean  bean= new AssetTicketBean();
		
		bean.setApprovedby(model.getApprovedby());
		bean.setApproveddate(model.getApproveddate());
		bean.setAtid(model.getAtid());
		logger.info("exit from buildUpdateRstatusOfAssetTicketBean");
		return bean;
		
	}
	
	public AssetTicketModel buildUpdateRstatusOfAssetTicketModel(AssetTicketBean bean)
	{ 
		logger.info("enter into buildUpdateBstatusOfAssetTicketModel");
		AssetTicketModel  model = new AssetTicketModel();
		
		model.setApprovedby(bean.getApprovedby());
		model.setApproveddate(bean.getApproveddate());
		model.setAtid(bean.getAtid());
		logger.info("exit from buildUpdateBstatusOfAssetTicketModel");
		return model;
	}
	
	public AssetTicketBean buildAssetStatusBeanDetails(AssetTicketModel model)
	{
		logger.info("enter into buildAssetStatusBeanDetails");
		AssetTicketBean bean=new AssetTicketBean();
		bean.setAtid(model.getAtid());
		bean.setApprovedby(model.getApprovedby());
		bean.setApproveddate(model.getApproveddate());
		logger.info("exit from buildAssetStatusBeanDetails");
		return bean;
	}
	public AssetTicketModel buildAssetStatusModelDetails(AssetTicketBean bean)
	{
		logger.info("enter into buildAssetStatusModelDetails");
		AssetTicketModel model=new AssetTicketModel();
		model.setAtid(bean.getAtid());
   model.setApprovedby(bean.getApprovedby());
    model.setApproveddate(bean.getApproveddate());
   logger.info("exit from buildAssetStatusModelDetails");
    return model;
	
	
	}
	public NewBranchBean buildBranchBeanDetails(NewBranchModel model)
	{
		logger.info("enter into buildBranchBeanDetails");
		NewBranchBean bean=new NewBranchBean();
		bean.setNbid(model.getNbid());
		bean.setBranchname(model.getBranchname());
		bean.setState(model.getState());
		bean.setCreateddate(model.getCreateddate());
		logger.info("exit from buildBranchBeanDetails");
		return bean;
		
	}
	public NewBranchModel buildBranchModelDetails(NewBranchBean bean)
	{
		logger.info("enter into buildBranchModelDetails");
		NewBranchModel model=new NewBranchModel();
		model.setNbid(bean.getNbid());
		model.setBranchname(bean.getBranchname());
		model.setState(bean.getState());
		model.setCreateddate(bean.getCreateddate());
		logger.info("exit from buildBranchModelDetails");
		return model;
	}
}