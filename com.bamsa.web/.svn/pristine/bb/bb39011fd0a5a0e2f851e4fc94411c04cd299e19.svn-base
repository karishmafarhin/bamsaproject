package com.bamsa.web.builder;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.bamsa.db.beans.ClockTimeBean;
import com.bamsa.web.model.ClockTimeModel;

@Component
public class ClockTimeBuilder {

	
	private static Logger logger = Logger.getLogger(ClockTimeBuilder.class);
	public ClockTimeBean buildClockIntimeBean(ClockTimeModel clockinModel){
		logger.info("Enter into buildClockTimeBean");
		ClockTimeBean bean = new ClockTimeBean();
		bean.setUid(clockinModel.getUid());
		bean.setClockInipAddress(clockinModel.getClockInipAddress());
		bean.setClockInDay(clockinModel.getClockInDay());
		
		logger.info(bean);
		logger.info("Exit From buildClockTimeBean");
		return bean;
	}
	public ClockTimeModel buildClockIntimeModel(ClockTimeBean clockinBean ){
		logger.info("Enter into buildClockTimeModel");
		ClockTimeModel model = new ClockTimeModel();
		model.setUid(clockinBean.getUid());
		model.setClockInipAddress(clockinBean.getClockInipAddress());
		model.setClockInDay(clockinBean.getClockInDay());
		logger.info(model);
		logger.info("Exit From buildClockTimeBean");
		return model;
	}
	public ClockTimeBean buildClockOuttimeBean(ClockTimeModel clockOutModel){
		logger.info("Enter into buildClockOuttimeBean");
		ClockTimeBean bean = new ClockTimeBean();
		bean.setUid(clockOutModel.getUid());
		bean.setClockOutipAddress(clockOutModel.getClockOutipAddress());
		bean.setClockOutDay(clockOutModel.getClockOutDay());
		logger.info(bean);
		logger.info("Exit From buildClockOuttimeBean");
		return bean;
	}
	public ClockTimeModel buildClockOuttimeModel(ClockTimeBean clockOutBean ){
		logger.info("Enter into buildClockOuttimeModel");

		ClockTimeModel model = new ClockTimeModel();
		model.setUid(clockOutBean.getUid());
		model.setClockOutipAddress(clockOutBean.getClockOutipAddress());
		model.setClockOutDay(clockOutBean.getClockOutDay());
		logger.info(model);
		logger.info("Exit From buildClockOuttimeModel");
		return model;
	}
}
