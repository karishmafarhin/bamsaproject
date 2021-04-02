package com.bamsa.web.builder;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.bamsa.db.beans.CandidateInfoBean;

import com.bamsa.web.model.CandidateInfoModel;


@Component
public class CandidateInfoBuilder {
	private static Logger logger = Logger.getLogger(CandidateInfoBuilder.class);
	public CandidateInfoBean buildCandidateInfoBeandetails(CandidateInfoModel model)
	{
		logger.info("enter into buildCandidateInfoBeandetails");
		CandidateInfoBean bean=new CandidateInfoBean();
		bean.setCiid(model.getCiid());
		bean.setFirstName(model.getFirstName());
		bean.setMiddleName(model.getMiddleName());
		bean.setLastName(model.getLastName());
		bean.setEmailid(model.getEmailid());
		bean.setMobile(model.getMobile());
		bean.setAvailableFrom(model.getAvailableFrom());
		bean.setVisaStatus(model.getVisaStatus());
		bean.setGender(model.getGender());
		bean.setCreatedDate(model.getCreatedDate());
        bean.setPrimaryskills(model.getPrimaryskills());
        bean.setCoverletter(model.getCoverletter());
        bean.setResume(model.getResume());
        bean.setState(model.getState());
        bean.setCity(model.getCity());
        bean.setCreatedby(model.getCreatedby());
        bean.setBillRateType(model.getBillRateType());
        bean.setRate(model.getRate());
        bean.setRelocate(model.getRelocate());
        bean.setHotlist(model.getHotlist());
        bean.setTypeofConsultant(model.getTypeofConsultant());
        bean.setSsn(model.getSsn());
       
       
        logger.info(bean);
        logger.info("exit from buildCandidateInfoBeandetails");
        return bean;
		}
        public CandidateInfoModel buildCandidateInfoModeldetails(CandidateInfoBean bean)
        {
        	logger.info("enter into buildCandidateInfoModeldetails");
    		CandidateInfoModel model=new CandidateInfoModel();
    		model.setFirstName(bean.getFirstName());
    		model.setMiddleName(bean.getMiddleName());
    		model.setLastName(bean.getLastName());
    		model.setEmailid(bean.getEmailid());
    		model.setMobile(bean.getMobile());
    		model.setAvailableFrom(bean.getAvailableFrom());
    		model.setVisaStatus(bean.getVisaStatus());
    		model.setGender(bean.getGender());
    		model.setCreatedDate(bean.getCreatedDate());
    		model.setPrimaryskills(bean.getPrimaryskills());
    		model.setCoverletter(bean.getCoverletter());
    		model.setResume(bean.getResume());
    		model.setState(bean.getState());
    		model.setCity(model.getCity());
    		model.setCreatedby(bean.getCreatedby());
    		model.setBillRateType(bean.getBillRateType());
    		model.setRate(bean.getRate());
    		model.setRelocate(bean.getRelocate());
    		model.setHotlist(bean.getHotlist());
    		model.setTypeofConsultant(bean.getTypeofConsultant());
    		model.setSsn(bean.getSsn());
    		model.setCiid(bean.getCiid());
    		
           
            
            logger.info(model);
            logger.info("exit from buildCandidateInfoModeldetails");
            return model;
        }
        
        public CandidateInfoBean buildUpdateCandidateDetails(CandidateInfoModel model){
        	logger.info("enter into buildUpdateCandidateDetails");
        	CandidateInfoBean bean=new CandidateInfoBean();
    		bean.setFirstName(model.getFirstName());
    		bean.setMiddleName(model.getMiddleName());
    		bean.setLastName(model.getLastName());
    		bean.setEmailid(model.getEmailid());
    		bean.setMobile(model.getMobile());
    		bean.setAvailableFrom(model.getAvailableFrom());
    		bean.setVisaStatus(model.getVisaStatus());
    		bean.setGender(model.getGender());
    		bean.setCreatedDate(model.getCreatedDate());
            bean.setPrimaryskills(model.getPrimaryskills());
            bean.setResume(model.getResume());
            bean.setState(model.getState());
            bean.setCity(model.getCity());
            bean.setBillRateType(model.getBillRateType());
            bean.setRate(model.getRate());
            bean.setRelocate(model.getRelocate());
            bean.setHotlist(model.getHotlist());
            bean.setTypeofConsultant(model.getTypeofConsultant());
            bean.setSsn(model.getSsn());
            logger.info(bean);
            logger.info("exit from buildUpdateCandidateDetails");
            return bean;
    		
        }
        public CandidateInfoModel buildCandidateModelDetails(CandidateInfoBean bean){
        	logger.info("enter into buildCandidateModelDetails");
        	CandidateInfoModel model=new CandidateInfoModel();
    		model.setFirstName(bean.getFirstName());
    		model.setMiddleName(bean.getMiddleName());
    		model.setLastName(bean.getLastName());
    		model.setEmailid(bean.getEmailid());
    		model.setMobile(bean.getMobile());
    		model.setAvailableFrom(bean.getAvailableFrom());
    		model.setVisaStatus(bean.getVisaStatus());
    		model.setGender(bean.getGender());
    		model.setCreatedDate(bean.getCreatedDate());
    		model.setPrimaryskills(bean.getPrimaryskills());
    		model.setResume(bean.getResume());
    		model.setState(bean.getState());
    		model.setCity(model.getCity());
    		model.setCreatedby(bean.getCreatedby());
    		model.setBillRateType(bean.getBillRateType());
    		model.setRate(bean.getRate());
    		model.setRelocate(bean.getRelocate());
    		model.setHotlist(bean.getHotlist());
    		model.setTypeofConsultant(bean.getTypeofConsultant());
    		model.setSsn(bean.getSsn());

            logger.info(model);
            logger.info("exit from buildCandidateModelDetails");
            return model;
        }
}
