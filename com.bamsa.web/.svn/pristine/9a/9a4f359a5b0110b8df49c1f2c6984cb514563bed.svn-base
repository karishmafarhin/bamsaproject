package com.bamsa.web.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bamsa.web.model.ClockTimeModel;
import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.EmployeeTaskModel;
import com.bamsa.web.model.NewProjectModel;
import com.bamsa.web.model.TaskDetailsModel;
import com.bamsa.web.model.UserBean;
import com.bamsa.web.service.UserService;
import com.bamsa.web.util.ApplicationConstants;

@Controller
public class HomeController {
	@Autowired
	UserService userServiceImpl;
	@RequestMapping("/loginuser")
	public String showLogin(){
	
		return "login";
	}
	@RequestMapping("/")
	public String showlandingpage(){
	
		return "indexlanding";
	}
	@RequestMapping("/registerreq")
	public String showCreateRequirement(){
	
		return "createRequirement";
	}
	@RequestMapping("/ndashboard")
	public String showNewDashboard(){
	
		return "newdashboard";
	}
	
	@RequestMapping("/dashboard")
	public String showDashboard(HttpServletRequest request){
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid=0;
		if(null!=userData){
		 uid = userData.getUid();
		}
		
		List<ClockTimeModel> clockTimeDetails = userServiceImpl.getClockDetials(uid);
		int count = 0;
		for (ClockTimeModel clockDetails : clockTimeDetails){
			if (clockDetails.getClockOutipAddress()==null){
				count++;
			}
		}
		if(count>0){
			request.setAttribute("message", "clockin");
		}
		List<EmployeeDetailsModel> allemployees ;
		allemployees =userServiceImpl.getAllEmployees();
		int size=allemployees.size();
		request.setAttribute("messagetwo", size);
		List<TaskDetailsModel> detailsModelProj= userServiceImpl.getEmpMilestones();
		int num =detailsModelProj.size();
		request.setAttribute("messagethree", num);
		List<EmployeeTaskModel> empModelTask= userServiceImpl.getEmployeetask(uid);
		Calendar c = Calendar.getInstance(); 
		Date date = c.getTime();
		DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		String d=dateformat.format(date);
		int counts=0;
        String givendate=null;
        if(empModelTask.size()>0){
        	for(EmployeeTaskModel empmodel:empModelTask){
        		DateFormat dateformats = new SimpleDateFormat("yyyy-MM-dd");
				String dl=dateformats.format(empmodel.getGivendate());
				if(dl.equals(d)){
					counts++;
					givendate=dl;
				}
        	}
        	
			
        }
        
        List<NewProjectModel> projectDetails=userServiceImpl.getEmployeeProjectDetails();
		request.setAttribute("projectdetails",projectDetails);
        request.setAttribute("empgivendate", counts);
		return "dashBoard";
	}
	
}
