package com.bamsa.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bamsa.web.model.AssetTicketModel;
import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.EmployeeModel;
import com.bamsa.web.model.EmployeeTaskModel;
import com.bamsa.web.model.GrievanceDetailsModel;
import com.bamsa.web.model.TaskDetailsModel;
import com.bamsa.web.model.UserBean;
import com.bamsa.web.service.UserService;
import com.bamsa.web.util.ApplicationConstants;

@Controller
public class ExcelAndPdfController {
	@Autowired
	UserService userServiceImpl;
	private static Logger logger = Logger.getLogger(GrievanceController.class);
	@RequestMapping("/EmployesTaskExcel")
	public ModelAndView EmployesTaskExcel(HttpServletRequest request){
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid=0;
		if(null!=userData){
		 uid= userData.getUid();
		}
		List<TaskDetailsModel> detailsModelTask= userServiceImpl.getTaskDetails(uid);
	
		return new ModelAndView ("BamsaProfilesExcel","TaskDetails",detailsModelTask );
		
	}
	@RequestMapping("/EmployeeTaskpdf")
	public ModelAndView getPdf(HttpServletRequest request) {
		
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid=0;
		if(null!=userData){
		 uid= userData.getUid();
		}
		List<TaskDetailsModel> detailsModelTask= userServiceImpl.getTaskDetails(uid);
		return new ModelAndView("Pdfgenerate", "taskstatus",detailsModelTask);
	}
	@RequestMapping("/GrievanceExcel")
	public ModelAndView GrievanceDetailsExcel(HttpServletRequest request)
	{
		UserBean userdata=(UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid=0;
		if(null!=userdata){
			uid=userdata.getUid();
		}
		List<GrievanceDetailsModel> grievance=userServiceImpl.getAllGrievances();
		return new ModelAndView("BamsaGrievanceExcel","grievancedetails",grievance);
	}
	@RequestMapping("/GrievancePdf")
    public ModelAndView GrievancePdf(HttpServletRequest request) {
		
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid=0;
		if(null!=userData){
		 uid= userData.getUid();
		}
		List<GrievanceDetailsModel> grievance=userServiceImpl.getAllGrievances();
		return new ModelAndView("GrievancePdfgenerate", "grievancedetails",grievance);
	}
	@RequestMapping("/MytaskExcel")
	public ModelAndView MyTaskExcel(HttpServletRequest request)
	{
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid = userData.getUid();
		List<EmployeeTaskModel> empModelTask= userServiceImpl.getEmployeetask(uid);
		return new ModelAndView("BamsaTaskExcel","mytaskexcel",empModelTask);
	}
	@RequestMapping("/TaskPdf")
    public ModelAndView TaskPdf(HttpServletRequest request) {
		
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid = userData.getUid();
		List<EmployeeTaskModel> empModelTask= userServiceImpl.getEmployeetask(uid);
		return new ModelAndView("TaskPdfgenerate", "mytaskpdf",empModelTask);
	}
	@RequestMapping("/TicketDetailsExcel")
	public String TicketDetailsExcel(HttpServletRequest request)
	{
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid =userData.getUid();
		EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);
		int sid =empModel.getStreamId();
	
		List<AssetTicketModel> assetmodel = userServiceImpl.getAssetTicket();
		 List<EmployeeModel> reportdetails = userServiceImpl.getEmployeesReportingDetails();
		 if(sid == 6){
				request.setAttribute("ticketDetails", assetmodel);
				}
			else{
				List<AssetTicketModel> individual = new ArrayList<AssetTicketModel>();
				
				for(AssetTicketModel ticket :assetmodel)
				{
					if(ticket.getRisedby()==uid)
					{
						individual.add(ticket);
					}
				request.setAttribute("ticketDetails",individual);
				}
			    }
			
		  request.setAttribute("empdetails",reportdetails);
		return "TicketDetailsExcel";
	}
	@RequestMapping("/TicketDetailsPdf")
	public ModelAndView TicketDetailsPdf(HttpServletRequest request)
	{
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid =userData.getUid();
		EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);
		int sid =empModel.getStreamId();
	
		List<AssetTicketModel> assetmodel = userServiceImpl.getAssetTicket();
		 List<EmployeeModel> reportdetails = userServiceImpl.getEmployeesReportingDetails();
		 if(sid == 6){
				request.setAttribute("ticketDetails", assetmodel);
				}
			else{
				List<AssetTicketModel> individual = new ArrayList<AssetTicketModel>();
				
				for(AssetTicketModel ticket :assetmodel)
				{
					if(ticket.getRisedby()==uid)
					{
						individual.add(ticket);
					}
				request.setAttribute("ticketDetails",individual);
				}
			    }
		 request.setAttribute("empdetails",reportdetails);
		 return new ModelAndView("TicketDetailsPdfgenerate");
	}
}
