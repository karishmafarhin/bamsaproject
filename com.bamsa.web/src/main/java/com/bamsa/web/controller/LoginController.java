     package com.bamsa.web.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.bamsa.web.service.UserService;
import com.bamsa.web.model.ClockTimeModel;
import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.EmployeeTaskModel;
import com.bamsa.web.model.NewProjectModel;
import com.bamsa.web.model.TaskDetailsModel;
import com.bamsa.web.model.UserBean;

import com.bamsa.db.exceptions.DBUpdateException;

import com.bamsa.web.exceptions.UserLoginException;

import com.bamsa.web.util.ApplicationConstants;



@Controller
public class LoginController {
	private static Logger logger = Logger.getLogger(LoginController.class);
	@Autowired
	UserService userServiceImpl;
	@Autowired
    private JavaMailSender mailSender;
	@RequestMapping("/login")
	public String userLogin(@ModelAttribute("user") UserBean user,HttpServletRequest request,Model model) throws ParseException, DBUpdateException{
		logger.info("Entry into userLogin");
		
		String resultPage="login";
	
	if(validateUserData(user)){
		
		try{
			String password=user.getPassword();
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); 
			user = userServiceImpl.authenticateUser(user);
			
				
			if(user != null && encoder.matches(password, user.getPassword()) ){
				String uname=request.getParameter("username");
				
				request.getSession().setAttribute("uName",uname);
				
				
				request.getSession().setAttribute(ApplicationConstants.LOGIN_BEAN, user);
				UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
				int uid = userData.getUid();
				EmployeeDetailsModel empModelDetails= userServiceImpl.getEmplDetails(uid);
				request.getSession().setAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS, empModelDetails);
				List<ClockTimeModel> clockTimeDetails = userServiceImpl.getClockDetials(uid);
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date cdate = new Date();
				String currdate = dateFormat.format(cdate);
				Date currentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(currdate);  
				for (ClockTimeModel clockDetails : clockTimeDetails){
					
					if (clockDetails.getClockOutipAddress()==null && (currentDate.getTime() - clockDetails.getClockInDay().getTime())>=4320000){
					Date updatedDate= new Date(clockDetails.getClockInDay().getTime()+43200000);
					String udate = dateFormat.format(updatedDate);
					Date updated = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(udate);  
					ClockTimeModel clock = new ClockTimeModel();
					clock.setUid(uid);
					clock.setClockOutDay(updated);
					clock.setClockOutipAddress(request.getRemoteAddr());
					clock = userServiceImpl.saveClockOutDetails(clock);
					}
				}
				
				List<ClockTimeModel> updatedclockTimeDetails = userServiceImpl.getClockDetials(uid);
				int count = 0;
				for (ClockTimeModel clockDetails : updatedclockTimeDetails){
					
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
		        request.setAttribute("empgivendate", counts);
		        List<NewProjectModel> projectDetails=userServiceImpl.getEmployeeProjectDetails();
				request.setAttribute("projectdetails",projectDetails);
				resultPage="dashBoard";
				
			}
			
			else{
				request.setAttribute("message", "Invalid Username or password");
				return "login";
			}
			List<TaskDetailsModel> detailsModelProj= new ArrayList<TaskDetailsModel>();
			detailsModelProj=userServiceImpl.getEmpMilestones();
			int num =detailsModelProj.size();
			request.setAttribute("messagethree", num);
		}catch(UserLoginException loginException){
			resultPage = "login";
			request.setAttribute("message", "Invalid user Credentials");
			logger.error(loginException.getMessage()); 

		}
	}
	logger.info("Exit from userLogin ");
	return resultPage;
}

private boolean validateUserData(UserBean user){

	logger.info("Entry into validateUserData");
	boolean valid = true;
	try{
		if(StringUtils.isBlank(user.getUsername())){
			return false;
		}
		if(StringUtils.isBlank(user.getPassword())){
			return false;
		}
	}catch(Exception e){
		logger.error(e.getMessage()); 
	}
	logger.info("Exit from validateUserData");
	return valid;
}

@RequestMapping("/logout")
public String logoutUser(HttpServletRequest request){

	logger.info("Entry into logoutUser");
	
	HttpSession session =  request.getSession(false);
    if (session != null) {
      session.invalidate();
    }
    // rebuild session
    request.getSession();

	logger.info("Exit from logoutUser");
	return "login";
	
}
@RequestMapping("/reset")
public String resetPassword(HttpServletRequest req,HttpServletResponse res) throws IOException{

	logger.info("Entry into resetPassword");

	try{
		String uname=req.getParameter("username");
		String oldpwd=req.getParameter("oldpassword");
		String newpswd=req.getParameter("newpassword");
		String cpswd=req.getParameter("renewpassword");
		if (newpswd.equals("") || cpswd.equals("")) {
			req.setAttribute("message", "New password and Confirm password both are required");  
			return "login";
		}
		else if (!newpswd.equals(cpswd)){
			req.setAttribute("message", "New password and Confirm password doesn't match ");  
			return "login";
		}
		else{
		try {
			UserBean ub = new UserBean();
			ub.setUsername(uname);
			
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); 
			ub = userServiceImpl.authenticateUser(ub);
			String op = ub.getPassword();
			EmployeeDetailsModel empModelDetails= userServiceImpl.getEmplDetails(ub.getUid());
			if(encoder.matches(oldpwd, op)){
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(newpswd);
			ub.setNewpassword(hashedPassword);
			
			userServiceImpl.resetPassword(ub);
			
				try{
					  // takes input from e-mail form
					
			        String recipientAddress = empModelDetails.getEmail();
			        String subject = "Greetings..! Your password reset successful for BAMSA";
			        String message = "Hi, You had successfully reset the password"
			        		+ ". Here are your new credentials for login into the BAMSA application.\n"
			        		+ "Username:"+empModelDetails.getEmpId()+"\nPassword:"+newpswd+"\nPlease check the below link for login"
			        				+ "http://124.123.41.5:8081/bamsa/";
			       
			             
			        // prints debug info
			        logger.info("To: " + recipientAddress);
			        logger.info("Subject: " + subject);
			        logger.info("Message: " + message);
			         
			        // creates a simple e-mail object
			        SimpleMailMessage email = new SimpleMailMessage();
			       
			        	email.setTo(recipientAddress);
			        	email.setSubject(subject);
			        
			            email.setText(message);
			           
			             
			            // sends the e-mail
			            mailSender.send(email);
					}catch(Exception e){
						logger.info(e.getMessage());
					}
			}
			else{
				req.setAttribute("message", "Invalid Username or Password");
				return "login";
			}
			
			req.setAttribute("success", "Password Reset Successful");
			return "login";
		} catch (DBUpdateException e) {
			logger.error(e.getMessage()); 
			req.setAttribute("message", "Invalid Username or Password");  
			return "login";
			
			
		}
		}

	}catch(Exception e){
		logger.error(e.getMessage()); 
		req.setAttribute("message", "Invalid Username or Password");  
		return "login";
	}
	
	
}

}
