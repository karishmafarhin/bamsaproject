package com.bamsa.web.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bamsa.web.model.ClockTimeModel;
import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.EmployeeTaskModel;
import com.bamsa.web.service.UserService;
import com.bamsa.web.model.UserBean;
import com.bamsa.web.util.ApplicationConstants;


@Controller
public class TimeSheetsController {
	@Autowired
	UserService userServiceImpl;

	private static Logger logger = Logger.getLogger(TimeSheetsController.class);
	@RequestMapping("/clockin")
	public String SaveClockInInfo(HttpServletRequest request,Model model) throws Exception{
		try{
		logger.info("Entry into SaveClockInInfo ");
		ClockTimeModel clockInDetails = buildClockInTimeDetails(request);
		logger.info(clockInDetails);
		clockInDetails = userServiceImpl.saveClockInDetails(clockInDetails);
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid = userData.getUid();
		List<ClockTimeModel> clockTimeDetails = userServiceImpl.getClockDetials(uid);
		int count = 0;
		for (ClockTimeModel clockDetails : clockTimeDetails){
			if (clockDetails.getClockOutipAddress()==null){
				count++;
			}
		}
		if(count>0 && null!=clockInDetails){
			request.setAttribute("message", "clockin");
		}
		logger.info(clockInDetails);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		logger.info("Exit From SaveClockInInfo");
		return "forward:/dashboard";
	}
	private ClockTimeModel buildClockInTimeDetails(HttpServletRequest request) throws Exception{
		logger.info("Entry into buildClockInTimeDetails");
		ClockTimeModel clock = new ClockTimeModel();
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		logger.info(userData);
		clock.setUid(userData.getUid());
		String ipAddress = request.getRemoteAddr();
		clock.setClockInipAddress(ipAddress);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String clockInDate = dateFormat.format(date);
		Date inDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(clockInDate);  
		clock.setClockInDay(inDate);
		logger.info("Exit From clock");
		logger.info("Exit from buildClockInTimeDetails");
		return clock;
	}
	@RequestMapping("/clockout")
	public String SaveClockOutInfo(HttpServletRequest request,Model model) throws Exception{
		ClockTimeModel clockOutDetails = buildClockOutTimeDetails(request);
		clockOutDetails = userServiceImpl.saveClockOutDetails(clockOutDetails);
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid = userData.getUid();
		List<ClockTimeModel> clockTimeDetails = userServiceImpl.getClockDetials(uid);
		int count = 0;
		for (ClockTimeModel clockDetails : clockTimeDetails){
			if (clockDetails.getClockOutipAddress()==null){
				count++;
			}
		}
		if(count==0 && null!=clockOutDetails){
			request.setAttribute("message", "clockout");
		}
		
		return "forward:/dashboard";
	}
	private ClockTimeModel buildClockOutTimeDetails(HttpServletRequest request) throws Exception{
		logger.info("Entry into buildClockOutTimeDetails");

		ClockTimeModel clock = new ClockTimeModel();
		try{
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		clock.setUid(userData.getUid());
		String ipAddress = request.getRemoteAddr();
		clock.setClockOutipAddress(ipAddress);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String clockOutDate = dateFormat.format(date);
		Date outDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(clockOutDate);  
		clock.setClockOutDay(outDate);
		logger.info("Exit From clock");
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		logger.info("Exit from buildClockInTimeDetails");
		return clock;
	}
	@RequestMapping("/clockDetails")
	public String getClockDetails(HttpServletRequest request,Model model){
		logger.info("Entry into getClockDetails");
try{
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid =userData.getUid();
		
          String empid=request.getParameter("empid"); 
		
		  List<EmployeeDetailsModel> employees = userServiceImpl.getAllEmployees();
		
		  List<ClockTimeModel> clockTimeDetails =new ArrayList<ClockTimeModel>();
		  if(null!= empid){
		  for(EmployeeDetailsModel employee:employees)
		 {
			 if(employee.getEmpId().equals(empid))
			 { 
				 uid=employee.getUid();
			 } 
		   }
		  logger.info(uid);
		  }
		clockTimeDetails = userServiceImpl.getClockDetials(uid);
		model.addAttribute("userclockDetails",clockTimeDetails );
		List<EmployeeDetailsModel> presentEmpDetails ;
		presentEmpDetails =userServiceImpl.presentEmployeeDetails();
		List<EmployeeDetailsModel> allemployees ;
		allemployees =userServiceImpl.getAllEmployees();
		logger.info(presentEmpDetails);
		logger.info(allemployees);
		logger.info(presentEmpDetails.size());
		
		int z =allemployees.size()-presentEmpDetails.size();
		logger.info(z);
		//absent employee names
		List<EmployeeDetailsModel> absentemployees = allemployees;
		if(presentEmpDetails.size()> 0){
			
			for(int i = 0; i<absentemployees.size(); i++){
					for(int j=0;j<presentEmpDetails.size();j++){
					
						if(absentemployees.get(i).getUid()==(presentEmpDetails.get(j).getUid())){
						absentemployees.remove(absentemployees.get(i));
									
				}
			}
			
			}
		
		logger.info(absentemployees);
		model.addAttribute("abscentempnames",absentemployees);
		}
		else{
			model.addAttribute("abscentempnames",allemployees);
			}
		logger.info(absentemployees);
		logger.info(presentEmpDetails);
		model.addAttribute("noofpresentees",presentEmpDetails.size());
		model.addAttribute("noofabsentees",z);
		model.addAttribute("EmployeeDetails",presentEmpDetails );
}catch(Exception e){
	logger.error(e.getMessage());
}
		logger.info("Exit from getClockDetails");
		return "Table";
	}
}
