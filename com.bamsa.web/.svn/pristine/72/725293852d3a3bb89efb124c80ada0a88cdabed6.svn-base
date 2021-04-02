package com.bamsa.web.builder;

import java.util.Date;


import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.TaskDetailsModel;
import com.bamsa.web.model.UserBean;
import com.bamsa.web.util.ApplicationConstants;
import com.bamsa.db.beans.EmployeeDetails;
import com.bamsa.db.beans.EmployeeMappings;
import com.bamsa.db.beans.TaskDetails;
import com.bamsa.db.beans.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Component
public class UserBuilder {
	private static Logger logger = Logger.getLogger(UserBuilder.class);

	public EmployeeDetails buildEmployeeDetails(EmployeeDetailsModel employeeRegDetails){
		logger.info("Enter into buildEmployeeDetails");
		EmployeeDetails details =new EmployeeDetails();
		details.setUid(employeeRegDetails.getUid());
		details.setDob(employeeRegDetails.getDob());
		details.setDoj(employeeRegDetails.getDoj());
		details.setEmail(employeeRegDetails.getEmail());
		details.setEmergencyMobileNo(employeeRegDetails.getEmergencyMobileNo());
		details.setEmpId(employeeRegDetails.getEmpId());
		details.setGender(employeeRegDetails.getGender());
		details.setInTime(employeeRegDetails.getInTime());
		details.setMobileNo(employeeRegDetails.getMobileNo());
		details.setName(employeeRegDetails.getName());
		details.setOutTime(employeeRegDetails.getOutTime());
		details.setPicture(employeeRegDetails.getPicture());
		details.setSalary(employeeRegDetails.getSalary());
		details.setBranchname(employeeRegDetails.getBranchname());
		logger.info(details);
		logger.info("Exit From buildEmployeeDetails");
		return details;
	}
	public EmployeeMappings buildEmployeeMappings(EmployeeDetailsModel employeeRegDetails){
		logger.info("Enter into buildEmployeeMappings");
		EmployeeMappings mappings = new EmployeeMappings();
		mappings.setUid(employeeRegDetails.getUid());
		mappings.setDesigId(employeeRegDetails.getDesigId());
		mappings.setHierarchyId(employeeRegDetails.getHierarchyId());
		mappings.setStreamId(employeeRegDetails.getStreamId());
		logger.info(mappings);
		logger.info("Exit From buildEmployeeMappings");
		return mappings;
		
	}
	
	public User buildUser(EmployeeDetailsModel employeeRegDetails,HttpServletRequest request){
		logger.info("Enter into buildUser");
		User user= new User();
		user.setUid(employeeRegDetails.getUid());
		user.setLocked(0);
		user.setStatus(ApplicationConstants.USER_STATUS_ACTIVE);
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		user.setCreatedBy(userData.getUid());
		user.setCreatedDate(new Date());
		user.setUsername(employeeRegDetails.getEmpId());
		logger.info(user);
		logger.info("Exit From builduser");
		int firstthree =Integer.valueOf(employeeRegDetails.getMobileNo().substring(0, 3));
		int lastthree =Integer.valueOf(employeeRegDetails.getMobileNo().substring(employeeRegDetails.getMobileNo().length()-3));
		int total =(firstthree*3)+(lastthree*3);
		StringBuilder sb = new StringBuilder();
		sb.append(Integer.toString(total));
		sb.append(employeeRegDetails.getEmpId());
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(sb.toString());
		user.setPassword(hashedPassword);	
		
	return user;
	}
	public EmployeeDetailsModel buildUserRegDetails(EmployeeDetails details){
		logger.info("Enter into buildUserRegDetails");
		EmployeeDetailsModel regDetails =new EmployeeDetailsModel();
		if(null!=details){
		regDetails.setUid(details.getUid());
		regDetails.setDob(details.getDob());
		regDetails.setDoj(details.getDoj());
		regDetails.setEmail(details.getEmail());
		regDetails.setEmergencyMobileNo(details.getEmergencyMobileNo());
		regDetails.setEmpId(details.getEmpId());
		regDetails.setGender(details.getGender());
		regDetails.setInTime(details.getInTime());
		regDetails.setMobileNo(details.getMobileNo());
		regDetails.setName(details.getName());
		regDetails.setOutTime(details.getOutTime());
		regDetails.setPicture(details.getPicture());
		regDetails.setSalary(details.getSalary());	
		regDetails.setBranchname(details.getBranchname());
		}
		
		logger.info(regDetails);
		logger.info("Exit From buildUserRegDetails");
	return regDetails;
	}
	
	public EmployeeDetailsModel buildUpdateUserDetails(EmployeeDetails details)
	{
		logger.info("Enter into buildUpdateUserDetails");
		EmployeeDetailsModel updatedDetails =new EmployeeDetailsModel();
		if(null !=details){
			
			updatedDetails.setUid(details.getUid());
			updatedDetails.setDob(details.getDob());
			updatedDetails.setEmail(details.getEmail());
			updatedDetails.setMobileNo(details.getMobileNo());
			updatedDetails.setEmergencyMobileNo(details.getEmergencyMobileNo());
			updatedDetails.setGender(details.getGender());
			updatedDetails.setMobileNo(details.getMobileNo());
			
		}
		logger.info(updatedDetails);
		logger.info("Exit From buildUpdateUserDetails");
		return updatedDetails;
		
		
	}
	
	public EmployeeDetails buildUpdateReporttoDetails(EmployeeDetailsModel employeeRegDetails)
	{
		logger.info("enter into buildUpdateReporttoDetails");
		EmployeeDetails details =new EmployeeDetails();
		details.setUid(employeeRegDetails.getUid());
		details.setHierarchyId(employeeRegDetails.getHierarchyId());
		details.setStreamId(employeeRegDetails.getStreamId());
		details.setDesigId(employeeRegDetails.getDesigId());
		details.setSalary(employeeRegDetails.getSalary());
		details.setBranchname(employeeRegDetails.getBranchname());
		logger.info(details);
		logger.info("exit fro buildUpdateReporttoDetails");
		return details;
		
		
	}
	public EmployeeDetailsModel buildUpdateReporttoDetails(EmployeeDetails bean)
	{
		logger.info("enter into buildUpdateReporttoDetails");
		EmployeeDetailsModel model= new EmployeeDetailsModel();
		model.setUid(bean.getUid());
		model.setHierarchyId(bean.getHierarchyId());
		model.setStreamId(bean.getStreamId());
		model.setDesigId(bean.getDesigId());
		model.setSalary(bean.getSalary());
		model.setBranchname(bean.getBranchname());
		logger.info(model);
		logger.info("exit from buildUpdateReporttoDetails");
		
		return model;
		
	}
	
	
	
	
	

}
