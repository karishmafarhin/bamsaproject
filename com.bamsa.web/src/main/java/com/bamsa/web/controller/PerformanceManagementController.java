package com.bamsa.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.EmployeeTaskModel;
import com.bamsa.web.model.GrievanceDetailsModel;
import com.bamsa.web.model.NewProjectModel;
import com.bamsa.web.model.PerformanceChartBean;
import com.bamsa.web.model.TaskDetailsModel;
import com.bamsa.web.model.UserBean;
import com.bamsa.web.service.UserService;
import com.bamsa.web.util.ApplicationConstants;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class PerformanceManagementController {
	@Autowired
	UserService userServiceImpl;
	private static Logger logger = Logger.getLogger(PerformanceManagementController.class);
	@RequestMapping("/empperformance")
	public String ShowEmpTaksPerformance(HttpServletRequest request) throws JsonProcessingException
	{
		try{
		logger.info("Enter into ShowEmpTaksPerformance");
		String empid=request.getParameter("empid");
		int npid= Integer.valueOf(request.getParameter("npid"));
		List<EmployeeTaskModel> emptasksperformance =userServiceImpl.getEmployeeTasksPerformance(empid,npid);
		float totalpercentage=0;
		logger.info(emptasksperformance.size());
		List<PerformanceChartBean> beanlist = new ArrayList<PerformanceChartBean>();
		if(emptasksperformance.size()>0)
		{
		for(EmployeeTaskModel emppercentage:emptasksperformance)
		{
			if(Character.toString(emppercentage.getTasktype()).equals("T"))
			{
			PerformanceChartBean bean =new PerformanceChartBean();
			bean.setDate(emppercentage.getGivendate());
			bean.setValue(emppercentage.getPercentagecompleted());
			beanlist.add(bean);
			 totalpercentage=totalpercentage+emppercentage.getPercentagecompleted();
			
			}
			
		}
		
		}
	
		logger.info(beanlist);
		ObjectMapper objMapper = new ObjectMapper();
		String performancejson = objMapper.writeValueAsString(beanlist);
		logger.info(totalpercentage);
		float average=totalpercentage/beanlist.size();
		logger.info(empid);
		logger.info(average);
		logger.info(emptasksperformance);
		request.setAttribute("empid", empid);
		request.setAttribute("average", average);
		request.setAttribute("empperformance", emptasksperformance);
		request.setAttribute("empperformancejson", performancejson);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		logger.info("exit from ShowEmpTaksPerformance ");
	  return "performance";
	}
	@RequestMapping(value="/empperformancedashboard",produces="application/json")
	public  @ResponseBody String ShowEmpTaksPerformancefordashboard(HttpServletRequest request) throws JsonProcessingException
	{	
		String performancejson =null;
		try{
		logger.info("Enter into ShowEmpTaksPerformance");
		String empid=request.getParameter("empid");
		int npid= Integer.valueOf(request.getParameter("npid"));
		List<EmployeeTaskModel> emptasksperformance =userServiceImpl.getEmployeeTasksPerformance(empid,npid);
		float totalpercentage=0;
		logger.info(emptasksperformance.size());
		List<PerformanceChartBean> beanlist = new ArrayList<PerformanceChartBean>();
		if(emptasksperformance.size()>0)
		{
		for(EmployeeTaskModel emppercentage:emptasksperformance)
		{
			if(Character.toString(emppercentage.getTasktype()).equals("T"))
			{
			PerformanceChartBean bean =new PerformanceChartBean();
			bean.setDate(emppercentage.getGivendate());
			bean.setValue(emppercentage.getPercentagecompleted());
			beanlist.add(bean);
			 totalpercentage=totalpercentage+emppercentage.getPercentagecompleted();
			
			}
			
		}
		
		}
	
		logger.info(beanlist);
		ObjectMapper objMapper = new ObjectMapper();
		performancejson= objMapper.writeValueAsString(beanlist);
		logger.info(totalpercentage);
		float average=totalpercentage/beanlist.size();
		logger.info(empid);
		logger.info(average);
		logger.info(emptasksperformance);
		//request.setAttribute("empid", empid);
		request.setAttribute("average", average);
		request.setAttribute("empperformance", emptasksperformance);
		request.setAttribute("empperformancejson", performancejson);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		logger.info("exit from ShowEmpTaksPerformance ");
	  return performancejson;
	}
	
	@RequestMapping(value="/performanceofprojectdashboard",produces="application/json")
	public  @ResponseBody TaskDetailsModel Showperformanceofprojectdashboard(HttpServletRequest request) throws JsonProcessingException
	{	
		TaskDetailsModel m= new TaskDetailsModel();
		try{
		logger.info("Enter into ShowEmpTaksPerformance");
		
		int npid= Integer.valueOf(request.getParameter("npid"));
		
		List<TaskDetailsModel> detailsModelProj= userServiceImpl.getEmpMilestones();
		for(TaskDetailsModel model: detailsModelProj){
			if(model.getNpid()==npid){
				m=model;
			}
		}
		
		
		
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		logger.info("exit from ShowEmpTaksPerformance ");
	  return m;
	}
	@RequestMapping("/ganttcharts")
	public String generateGanttCharts(HttpServletRequest request)
	{
		try{
		logger.info("Enter into ShowEmpTaksPerformance");
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid =userData.getUid();
		List<NewProjectModel> projectDetails=userServiceImpl.getEmployeeProjectDetails();
		request.setAttribute("projectdetails",projectDetails);
		List<EmployeeTaskModel> emptasksperform = new ArrayList<EmployeeTaskModel>();
		String empid= request.getParameter("empid");
		logger.info(empid);
		int npid = Integer.valueOf(request.getParameter("npid"));
		logger.info(npid);
		if(uid == 0 && null!=empid && npid!=0){
		
		emptasksperform =userServiceImpl.getEmployeeTasksPerformance(empid,npid);
		logger.info(emptasksperform);
		
		}else{
			EmployeeDetailsModel empData =(EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);
			empid=empData.getEmpId();
			logger.info(empid);
			emptasksperform =userServiceImpl.getEmployeeTasksPerformance(empid,npid);  		
			
		}
		int c=0;
		int nc=0;
		int ip=0;
		logger.info(emptasksperform.size());
		if(emptasksperform.size()>0)
		{
		for(EmployeeTaskModel emppercentage:emptasksperform)
		{
			if(emppercentage.getPercentagecompleted()==100){
				c++;
			}
			else if(emppercentage.getPercentagecompleted()<100 && emppercentage.getPercentagecompleted()>0){
				ip++;
			}
			else{
				nc++;
			}
		
		}
		request.setAttribute("c", c);
		request.setAttribute("nc", nc);
		request.setAttribute("ip", ip);
		
		request.setAttribute("employeeid",emptasksperform.get(0).getEmpid());
		request.setAttribute("projectname", emptasksperform.get(0).getProjectname());
		//request.setAttribute("total",emptasksperformance.size() );
		request.setAttribute("total", emptasksperform.size());
		}
		else if(emptasksperform.size()==0){
				request.setAttribute("error", "No results found");
			}
		
		logger.info(c);
		
		logger.info(nc);
		logger.info(ip);
		
		
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		logger.info("exit from ShowEmpTaksPerformance ");
	  return "ganttcharts";
	}
	
}
