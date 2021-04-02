package com.bamsa.web.builder;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;


import com.bamsa.db.beans.EmployeeTask;
import com.bamsa.db.beans.NewProjectBean;
import com.bamsa.db.beans.TaskDetails;
import com.bamsa.web.model.EmployeeTaskModel;
import com.bamsa.web.model.NewProjectModel;
import com.bamsa.web.model.TaskDetailsModel;

@Component
public class EmployeeTaskBuilder {
	
	private static Logger logger = Logger.getLogger(EmployeeTaskBuilder.class);
	public EmployeeTask buildEmployeetask(EmployeeTaskModel employeeTaskDetails){
		logger.info("Enter into buildEmployeeTask");
		EmployeeTask bean = new EmployeeTask();
		bean.setUid(employeeTaskDetails.getUid());
		bean.setEmpid(employeeTaskDetails.getEmpid());
		bean.setTaskdescription(employeeTaskDetails.getTaskdescription());
		bean.setGivenby(employeeTaskDetails.getGivenby());
		bean.setDeadline(employeeTaskDetails.getDeadline());
		bean.setGivendate(employeeTaskDetails.getGivendate());
		bean.setTasktype(employeeTaskDetails.getTasktype());
		bean.setNpid(employeeTaskDetails.getNpid());
		
		
		logger.info(bean);
		logger.info("Exit From buildEmployeeTask");
		return bean;
	}
	

public EmployeeTaskModel buildEmployeetaskModel(EmployeeTask employeetask ){
	logger.info("Enter into buildEmployeeTask");
	EmployeeTaskModel model = new EmployeeTaskModel();
	model.setUid(employeetask.getUid());
	model.setEmpid(employeetask.getEmpid());
	model.setTaskdescription(employeetask.getTaskdescription());
	model.setGivenby(employeetask.getGivenby());
	model.setDeadline(employeetask.getDeadline());
	model.setGivendate(employeetask.getGivendate());
	model.setTasktype(employeetask.getTasktype());
	model.setNpid(employeetask.getNpid());
	logger.info(model);
	logger.info("Exit From buildEmployeetaskModel");
	return model;
}

public TaskDetails buildUpdateTaksDetails(TaskDetailsModel details)
{
	logger.info("Enter into buildUpdateTaksDetails");
	TaskDetails taskDetails = new TaskDetails();
	if(null != details)
	{
		taskDetails.setStatus(details.getStatus());
		taskDetails.setPercentagecompleted(details.getPercentagecompleted());
		taskDetails.setQueries(details.getQueries());
		taskDetails.setBacklogs(details.getBacklogs());
		taskDetails.setTid(details.getTid());
	}
	logger.info(taskDetails);
	logger.info("Exit from buildUpdateTaksDetails");
	return taskDetails;
}
public NewProjectBean buildNewProjectDetailsBean(NewProjectModel projectdetails){
	logger.info("buildNewProjectDetails");
	NewProjectBean bean=new NewProjectBean();
	bean.setNpid(projectdetails.getNpid());
	bean.setProjectname(projectdetails.getProjectname());
	bean.setProjectdescription(projectdetails.getProjectdescription());
	bean.setDeadline(projectdetails.getDeadline());
	bean.setCreateddate(projectdetails.getCreateddate());
	bean.setPicture(projectdetails.getPicture());
	logger.info(bean);
logger.info("exit from buildNewProjectDetails");	
return bean;
	
}
public NewProjectModel buildNewProjectDetailsModel(NewProjectBean project){
	logger.info("enter into buildNewProjectDetails");
	NewProjectModel model=new NewProjectModel();
	model.setNpid(project.getNpid());
	model.setProjectname(project.getProjectname());
	model.setProjectdescription(project.getProjectdescription());
	model.setDeadline(project.getDeadline());
	model.setCreateddate(project.getCreateddate());
	model.setPicture(project.getPicture());
	logger.info(model);
	logger.info("exit from buildNewProjectDetails");
	return model;
	
}

}
