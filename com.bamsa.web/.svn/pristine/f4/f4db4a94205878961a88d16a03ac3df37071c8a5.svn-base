package com.bamsa.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bamsa.web.model.CalendarModal;
import com.bamsa.web.model.EmployeeTaskModel;
import com.bamsa.web.model.UserBean;
import com.bamsa.web.service.UserService;
import com.bamsa.web.util.ApplicationConstants;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
@Controller
public class AccountsController {
	@Autowired
	UserService userServiceImpl;
	private static Logger logger = Logger.getLogger(AccountsController.class);
	@RequestMapping("/calendar")
	public String showcalendar(HttpServletRequest request,Model modal) throws JsonProcessingException{
		try{
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid = userData.getUid();
		List<EmployeeTaskModel> empModelTask= userServiceImpl.getEmployeetask(uid);
		logger.info(empModelTask);
		List<CalendarModal> calendar = new ArrayList<CalendarModal>();
		for(EmployeeTaskModel model :empModelTask){
			CalendarModal assign =new CalendarModal();
			CalendarModal dl =new CalendarModal();
			assign.setNote("Task given : "+model.getTaskdescription());
			assign.setDate(model.getGivendate());
			dl.setNote("Deadline for task : "+model.getTaskdescription());
			dl.setDate(model.getDeadline());
			calendar.add(assign);
			calendar.add(dl);
			
		}
		
		logger.info(calendar);
		ObjectMapper objMapper = new ObjectMapper();
		String notesjson = objMapper.writeValueAsString(calendar);
		logger.info(notesjson);
		modal.addAttribute("calendarnotes", notesjson);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		return "calendar";
	}

}
