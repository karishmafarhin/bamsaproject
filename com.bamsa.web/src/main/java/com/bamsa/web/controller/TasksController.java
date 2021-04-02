package com.bamsa.web.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bamsa.db.dao.impl.EmployeeDAOImpl;

import com.bamsa.web.model.EmployeeTaskModel;
import com.bamsa.web.model.NewProjectModel;
import com.bamsa.web.model.TaskDetailsModel;
import com.bamsa.web.model.CompanyLicenseModel;
import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.EmployeeModel;
import com.bamsa.web.model.UserBean;
import com.bamsa.web.service.UserService;
import com.bamsa.web.util.ApplicationConstants;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;


@Controller
public class TasksController {
	@Autowired
	UserService userServiceImpl;
	 @Autowired
	 private JavaMailSender mailSender;
	private static Logger logger = Logger.getLogger(TasksController.class);
	@RequestMapping("/Mytask")
	public String getEmployeetask(HttpServletRequest request){
		try{
		logger.info("enter into getEmpTaskDetails");
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid = userData.getUid();
		List<EmployeeTaskModel> empModelTask= userServiceImpl.getEmployeetask(uid);
		logger.info(empModelTask);
		
		int count=0;

		Date presentdate=new Date();

		Long timebefore=presentdate.getTime();

		for(EmployeeTaskModel alert:empModelTask){
			logger.info(alert.getDeadline());
			Date sDate1=alert.getDeadline();
			Long timetoday=sDate1.getTime();
			logger.info("Exp date"+timetoday);

			if(((timetoday-timebefore)<=259200000)&&((timetoday-timebefore)>=0)) {
				count++;
				logger.info(count);
			
			
		}
	        
		
		}
		
			
		
		
		logger.info(count);
		request.setAttribute("empdeadline", count);
		request.setAttribute("EmployeeTask",empModelTask );
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		logger.info("exit from getEmpTaskDetails");
		return "MyTask";
	}
	@RequestMapping("/Newtask")
	public String AssignTasks(HttpServletRequest request){
		logger.info("enter into AssignTasks");
		String ResultPage ="NewTask";
		List<NewProjectModel> projectDetails=userServiceImpl.getEmployeeProjectDetails();
		try{
		
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid = userData.getUid();
		if(uid==0){
			ResultPage ="departments";
		}
		logger.info(uid);
		List<EmployeeModel> allEmployees = userServiceImpl.getEmployeesUnderUser(uid);
		List<EmployeeModel> streamofEmployees = new ArrayList<EmployeeModel>();
		
			
		if(null!=request.getParameter("sid")&& uid==0){
			int sid=Integer.valueOf(request.getParameter("sid"));
			for(EmployeeModel emp :allEmployees){
				if(sid==emp.getStreamid()){
					streamofEmployees.add(emp);
				}
			}
			
				switch(sid)
				{
					case 1:if(sid==1)
			           {
						request.setAttribute("stream", " for JAVA Developers");
				
			           }
						break;
					case 2: if(sid==2)
			            {
				  		request.setAttribute("stream", " for PHP Developers");  			
			            }
			  			break;
					case  3:if(sid==3)
			  			{
				  	request.setAttribute("stream", " for Mobile Application Developer");  			
			  			}
			  			break;
					case  4:if(sid==4)
			  			{
				  		request.setAttribute("stream", " for UI Developer");  			
			  			}
	          			break;
					case  5:if(sid==5)
			  			{
				  		request.setAttribute("stream", " for ACCOUNTS Department");  			
			  			}
			  			break;
			  		case  6:if(sid==6)
			  				{
			  				request.setAttribute("stream", " for ADMINISTRATION & OPERATION Department");  			
			  				}
			  			break;
			  		case  7:if(sid==7)
			  				{
			  				request.setAttribute("stream", " for BENCH SALES RECRUITMENT Department");  			
			  				}
			  				break;
			  		case  8:if(sid==8)
	  				{
	  					request.setAttribute("stream", " for US IT RECRUITMENT Department");  			
	  				}
	  				break;      
			  		case  9:if(sid==9)
			  				{
			  					request.setAttribute("stream", " for PAYROLL & COMPENSATION Department");  			
			  				}
			  				break;        
			  		case  10:if(sid==10)
			  				{
			  					request.setAttribute("stream", " for TRAINING & DEVELOPMENT Department");  			
			  				}
			  				break;
	        
			  		case  11:if(sid==11)
			  				{
			  					request.setAttribute("stream", " for BUSINESS DEVELOPMENT Department");  			
			  				}
			  				break;
			  		case  12:if(sid==12)
	  				{
	  					request.setAttribute("stream", " for Testing Department");  			
	  				}
	  				break;
			  		case  13:if(sid==13)
					{
						request.setAttribute("stream", " of HR Executive Department");  			
					}
					break;
	        
					}
			
				
			request.setAttribute("Employees", streamofEmployees);
		
		
			ResultPage="NewTask";
			
		}
		else{
		request.setAttribute("Employees", allEmployees);
		}
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		logger.info("exit from AssignTasks");
		request.setAttribute("projectdetails",projectDetails);
		return ResultPage;
	}
	
	@RequestMapping(value="/assignTask",method=RequestMethod.POST,produces = "application/json")
	public  @ResponseBody ResponseEntity<Object> insertTaskofEmployee(HttpServletRequest request,HttpServletResponse response){

		try{


		int uid = Integer.valueOf(request.getParameter("userid"));
		String empid = request.getParameter("empid");
		String taskDescription = request.getParameter("taskdescription");
		
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy",Locale.ENGLISH);
		Date deadLine =format.parse(request.getParameter("deadline"));
	
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int givenby = userData.getUid();
		Date givenDate =new Date();
		logger.info(uid);
		logger.info(empid);
		logger.info(taskDescription);
		logger.info(deadLine);
		logger.info(request.getParameter("taskorproject"));
		logger.info(request.getParameter("projectnamee"));
		EmployeeTaskModel employeeTaskDetails = new EmployeeTaskModel();
		employeeTaskDetails.setUid(uid);
		employeeTaskDetails.setEmpid(empid);
		employeeTaskDetails.setGivenby(givenby);
		employeeTaskDetails.setGivendate(givenDate); 
		employeeTaskDetails.setDeadline(deadLine);
		employeeTaskDetails.setTaskdescription(taskDescription);
		employeeTaskDetails.setNpid(Integer.valueOf(request.getParameter("projectnamee")));
		String s=request.getParameter("taskorproject");
		int pid=Integer.valueOf(request.getParameter("projectnamee"));
		
EmployeeDetailsModel empdet=userServiceImpl.getEmplDetails(uid);
if(null!=empdet){
    String recipientAddress = empdet.getEmail();
    StringBuilder sb=new StringBuilder();
    sb.append(empdet.getEmail());
    String subject = "New Task has been assigned!";
    String message = "Hi "+empdet.getName()+", Your New Task has been assigned to you "
    		+ ". please refer your dashboard";
    
    logger.info("To: " + recipientAddress);
    logger.info("Subject: " + subject);
    logger.info("Message: " + message);
    
    SimpleMailMessage email = new SimpleMailMessage();

    email.setTo(recipientAddress);
	email.setSubject(subject);
    email.setText(message);
   
     
    // sends the e-mail
    mailSender.send(email);
     
  



}
		
		
		List<TaskDetailsModel> projects=userServiceImpl.getProjectTypeDetails();
		int count=0;
		if((request.getParameter("taskorproject")).equals("P")){
			employeeTaskDetails.setTasktype('P');
			for(TaskDetailsModel project:projects)
			{
				if(s.equals(Character.toString(project.getTasktype())) && empid.equals(project.getEmpid()) && pid==project.getNpid())
				{
					count++;
					 			   
				}
				
				
			}
				
		}
		else{
			employeeTaskDetails.setTasktype('T');
		}
		
		
	   
		
		
		if(count>=1)
		{
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		else{
			EmployeeTaskModel model = userServiceImpl.saveEmployeeTask(employeeTaskDetails);

		  }
		}catch(Exception e){
			logger.info(e.getMessage());

		}
		return new ResponseEntity<>(HttpStatus.OK);

		
	
		
	}
	@RequestMapping("/Taskstatus")
	public String getTaskDetails(HttpServletRequest request){
		logger.info("enter into getTaskDetails");
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid=0;
		if(null!=userData){
		 uid= userData.getUid();
		}
		List<TaskDetailsModel> detailsModelTask= userServiceImpl.getTaskDetails(uid);
		request.setAttribute("TaskDetails",detailsModelTask );
		logger.info("exit from getTaskDetails");
		return "TaskStatus";
		
	}
			
	@RequestMapping(value="/submittaskStatus",method=RequestMethod.POST)
	public  String submitTaskStatus(HttpServletRequest request,HttpServletResponse response)throws JsonParseException
	, JsonMappingException, IOException, Exception{
		try{
		int tid = Integer.valueOf(request.getParameter("tid"));
		float percentagecompleted = Integer.valueOf(request.getParameter("percentagecompleted"));
		String query = request.getParameter("query");
		String backlog = request.getParameter("backlog");
		logger.info("enter into submitTaskStatus");
		logger.info(tid);
		logger.info(percentagecompleted);
		logger.info(query);
		logger.info(backlog);
		
		TaskDetailsModel taskdetailsmodel = new TaskDetailsModel();
		if(percentagecompleted == 0)
		{taskdetailsmodel.setTid(tid);
		taskdetailsmodel.setBacklogs(backlog);
		taskdetailsmodel.setStatus("NC");
		taskdetailsmodel.setPercentagecompleted(percentagecompleted);
		}
		else if(percentagecompleted ==100){
			
		taskdetailsmodel.setTid(tid);
		taskdetailsmodel.setStatus("C");
		taskdetailsmodel.setPercentagecompleted(percentagecompleted);
		
		}
		else{
			taskdetailsmodel.setTid(tid);
			taskdetailsmodel.setStatus("IP");
			taskdetailsmodel.setPercentagecompleted(percentagecompleted);
			taskdetailsmodel.setQueries(query);			
		}
		
		   userServiceImpl.updateTaskDetails(taskdetailsmodel);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		   logger.info("exit from submitTaskStatus");
		   return "forward:/Mytask";
	}
	@RequestMapping("/Milestones")
	public String getEmpMilestones(HttpServletRequest request) {
		logger.info("enter into getEmpMilestones");
		List<TaskDetailsModel> detailsModelProj= userServiceImpl.getEmpMilestones();
		
		
		
		
		request.setAttribute("projectdetails", detailsModelProj);
		logger.info("exit from getEmpMilestones");
		return "Milestones";
		
	}
	
	@RequestMapping(value="/updatePercentage",method=RequestMethod.POST)
	public  String updatePercentage(HttpServletRequest request,HttpServletResponse response)throws JsonParseException
	, JsonMappingException, IOException, Exception{
		float percentage = Integer.valueOf(request.getParameter("percentagecompleted"));
		String updatereason = request.getParameter("updatereason");
		logger.info(percentage);
		logger.info(updatereason);
		int tid = Integer.valueOf(request.getParameter("tid"));
		logger.info(tid);
		String status = "IP";
		if(percentage==100){
			status="C";
		}
		else if(percentage==0){
			status="NC";
		}
		else{
			status="IP";
		}
		
		percentage=userServiceImpl.updatePercentage(tid, percentage,status,updatereason);
		
		
		 return "forward:/Taskstatus";
		
	}
	@RequestMapping(value="/projectperformance",produces = "application/json")
	public @ResponseBody TaskDetailsModel getprojectDetails(HttpServletRequest request){
	
		int npid =Integer.valueOf(request.getParameter("npid"));
		logger.info(npid);
		List<TaskDetailsModel> detailsModelProj= userServiceImpl.getEmpMilestones();
		logger.info(detailsModelProj);
		TaskDetailsModel model = new TaskDetailsModel();
		for(TaskDetailsModel task:detailsModelProj){
			if(task.getNpid()==npid){
				model=task;
			}
		}
		
		return model;
		
	}
	@RequestMapping("/createProject")
	public String createprojectform(){
		return "createproject";
	}
	@RequestMapping("/saveproject")
	public String saveNewproject(@RequestParam("picture")MultipartFile file,HttpServletRequest request) throws ParseException{
		
			logger.info("Enter into registerLicense");
			NewProjectModel project = buildNewProjectDetails(request);
			
			logger.info(project);
			try{
				if (!file.isEmpty()) {
					
					 byte[] pictureBytes = file.getBytes();	
					 
					
						 project.setPicture(pictureBytes);
						
				}else{
					
					request.setAttribute("message", "Select Appropriate Picture");
					return "forward:/createProject";
				}
				
				project=userServiceImpl.saveNewproject(project);
			
		}catch(Exception e)
		{
			
			request.setAttribute("errormessage", "Not registered");
			return "forward:/createProject";
		
			}
request.setAttribute("successmessage", "Project Created Successfully");
	
	logger.info("Exit From registerLicense");
	return "forward:/createProject";
}
	
		
	private NewProjectModel buildNewProjectDetails(HttpServletRequest request) {
		logger.info("enter into buildNewProjectDetails");
         NewProjectModel project=new NewProjectModel();
         try{
		project.setProjectname(request.getParameter("pname"));
		project.setProjectdescription(request.getParameter("pdescription"));
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		project.setDeadline(format.parse(request.getParameter("deadline")));
		Date createddate =new Date();
		project.setCreateddate(createddate);
		logger.info(project);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		logger.info("Exit From buildNewProjectDetails");
		return project;
	}
		
}
