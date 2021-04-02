package com.bamsa.web.builder;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.bamsa.db.beans.OpeningInfoBean;
import com.bamsa.web.model.OpeningInfoModel;

@Component
public class OpeningInfoBuilder {
	private static Logger logger = Logger.getLogger(OpeningInfoBuilder.class);
	public OpeningInfoBean buildOpeningInfoBean(OpeningInfoModel model)
	{
		logger.info("enter into buildOpeningInfoBean");
		OpeningInfoBean bean = new OpeningInfoBean();
		bean.setPositionid(model.getPositionid());
		bean.setPositiontitle(model.getPositiontitle());
		bean.setState(model.getState());
		bean.setCity(model.getCity());
		bean.setPrimaryskill(model.getPrimaryskill());
		bean.setSecondaryskill(model.getSecondaryskill());
		bean.setDescription(model.getDescription());
		bean.setRate(model.getRate());
		bean.setPrimevendor(model.getPrimevendor());
		bean.setEndclient(model.getEndclient());
		bean.setCreatedby(model.getCreatedby());
		bean.setCreateddate(model.getCreateddate());
		bean.setBilltype(model.getBilltype());
		bean.setRqid(model.getRqid());
		bean.setContactperson(model.getContactperson());
		logger.info(bean);
        logger.info("exit from buildContactdetails");
        return bean;
		}
		public OpeningInfoModel buildOpeningInfoModel(OpeningInfoBean bean)
		{
			logger.info("enter into buildOpeningInfoModel");
			
			OpeningInfoModel model=new OpeningInfoModel();
			model.setRqid(bean.getRqid());
			model.setPositionid(bean.getPositionid());
			model.setPositiontitle(bean.getPositiontitle());
			model.setState(bean.getState());
			model.setCity(bean.getCity());
			model.setPrimaryskill(bean.getPrimaryskill());
			model.setSecondaryskill(bean.getSecondaryskill());
			model.setDescription(bean.getDescription());
			model.setRate(bean.getRate());
			model.setPrimevendor(bean.getPrimevendor());
			model.setEndclient(bean.getEndclient());
			model.setCreatedby(bean.getCreatedby());
			model.setCreateddate(bean.getCreateddate());
			model.setBilltype(bean.getBilltype());
			model.setContactperson(bean.getContactperson());
			logger.info(model);
	        logger.info("exit from buildContactdetailsmodel");
	        return model;
			}
}
