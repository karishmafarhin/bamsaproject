package com.bamsa.web.builder;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.bamsa.db.beans.ContactBean;
import com.bamsa.web.model.ContactModel;

@Component
public class ContactBuilder {
	private static Logger logger = Logger.getLogger(ContactBuilder.class);
	public ContactBean buildContactdetails(ContactModel model)
	{
		logger.info("enter into buildContactdetails");
		ContactBean bean = new ContactBean();
		bean.setAcid(model.getAcid());
		bean.setAccountName(model.getAccountName());
		bean.setAccountOwner(model.getAccountOwner());
		bean.setCategory(model.getCategory());
		bean.setWebsite(model.getWebsite());
		bean.setStatus(model.getStatus());
		bean.setPhoneno(model.getPhoneno());
		bean.setState(model.getState());
		bean.setCity(model.getCity());
		bean.setPrimaryemail(model.getPrimaryemail());
		bean.setDescription(model.getDescription());
		bean.setFirstname(model.getFirstname());
		bean.setLastname(model.getLastname());
		bean.setSecondaryemail(model.getSecondaryemail());
		bean.setReqlist(model.getReqlist());
		bean.setHotlist(model.getHotlist());
		bean.setCreateddate(model.getCreateddate());
		bean.setCreatedby(model.getCreatedby());
	
		 logger.info(bean);
	        logger.info("exit from buildContactdetails");
	        return bean;
			}
	public ContactModel buildContactdetailsmodel(ContactBean bean)
	{
		logger.info("enter into buildContactdetailsmodel");
		ContactModel model=new ContactModel();
		model.setAcid(bean.getAcid());
		model.setAccountName(bean.getAccountName());
		model.setAccountOwner(bean.getAccountOwner());
		model.setCategory(bean.getCategory());
		model.setWebsite(bean.getWebsite());
		model.setStatus(bean.getStatus());
		model.setPhoneno(bean.getPhoneno());
		model.setState(bean.getState());
		model.setCity(bean.getCity());
		model.setPrimaryemail(bean.getPrimaryemail());
		model.setDescription(bean.getDescription());
		model.setFirstname(bean.getFirstname());
		model.setLastname(bean.getLastname());
		model.setSecondaryemail(bean.getSecondaryemail());
		model.setReqlist(bean.getReqlist());
		model.setHotlist(bean.getHotlist());
		model.setCreateddate(bean.getCreateddate());
		model.setCreatedby(bean.getCreatedby());
		
		logger.info(model);
        logger.info("exit from buildContactdetailsmodel");
        return model;
		}
}
