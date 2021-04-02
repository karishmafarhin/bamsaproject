package com.bamsa.db.dao.impl;

import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.bamsa.db.beans.ClockTimeBean;
import com.bamsa.db.beans.EmployeeTask;
import com.bamsa.db.beans.NewProjectBean;
import com.bamsa.db.beans.TaskDetails;
import com.bamsa.db.dao.EmployeeTaskDAO;
import com.bamsa.db.exceptions.DBUpdateException;
import com.bamsa.db.impls.mappers.EmpProjectDetailsRowMapper;
import com.bamsa.db.impls.mappers.EmpTaskRowMapper;
import com.bamsa.db.impls.mappers.EmpTasksDetailsRowMapper;
import com.bamsa.db.impls.mappers.EmployeeDetailsRowMapper;
import com.bamsa.db.impls.mappers.EmployeesUnderProjectRowMapper;
import com.bamsa.db.impls.mappers.ProjectDetailsRowMapper;
import com.bamsa.db.impls.mappers.ProjectTypeDetailsRowMapper;
import com.bamsa.db.impls.mappers.TaskDetailsRowMapper;
import com.bamsa.db.impls.stmtsetters.TaskUpdateDetailsStmtSetter;
import com.bamsa.db.util.DBConstants;
import com.bamsa.db.util.ErrorConstants;

@Repository
public class EmployeeTaskDAOImpl implements EmployeeTaskDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private Properties dbProps;
	private static Logger logger = Logger.getLogger(EmployeeTaskDAOImpl.class);
	@Override
	public List<EmployeeTask> getEmployeetask(int uid){
		logger.info("Enter into getEmployeetaskdaoimpl");
		String emptaskquery =dbProps.getProperty(DBConstants.LOAD_EMPLOYEE_TASK);
		List<EmployeeTask> emp= jdbcTemplate.query(emptaskquery,new Object[]{uid}, new EmpTaskRowMapper());
		logger.info(emp);
        logger.info("exit from getEmployeetaskdaoimpl");
		return emp;
	}
	@Override
	public EmployeeTask saveEmployeeTask(EmployeeTask bean) {
		
			logger.info("Enter into saveEmployeeTask");
			DataSource dataSource = jdbcTemplate.getDataSource();
			try{
			if(bean!=null){
				SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
				Map<String,Object> recordParameters = new HashMap<String,Object>();
				logger.info(recordParameters);
				recordParameters.put("uid",bean.getUid());
				recordParameters.put("empid",bean.getEmpid());
				recordParameters.put("taskdescription", bean.getTaskdescription());
				recordParameters.put("givenby",bean.getGivenby());
				recordParameters.put("deadline",bean.getDeadline());
				recordParameters.put("givendate", bean.getGivendate());
				recordParameters.put("tasktype", bean.getTasktype());
				recordParameters.put("npid",bean.getNpid());
				jdbcInsert.withTableName("employeetasks")
				.usingGeneratedKeyColumns("tid");
				logger.info("task details inserted");
				bean.setTid(jdbcInsert.executeAndReturnKey(recordParameters).intValue());
			}
			}catch(Exception e){
				logger.error(e.getMessage());
			}
			logger.info("Exit from saveEmployeeTask");
			return bean;
	
	}
	@Override
	public List<TaskDetails> getTaskDetails(int uid) {
		logger.info("enter into getTaskDetails");
		String taskdetailsquery =dbProps.getProperty(DBConstants.LOAD_ALL_EMPLOYEE_STATUS);
		List<TaskDetails> task= jdbcTemplate.query(taskdetailsquery, new Object[]{uid}, new TaskDetailsRowMapper());
		logger.info(task);
        logger.info("exit from getTaskDetails");
		return task;
		
		
	}
	@Override
	public TaskDetails saveTask(TaskDetails bean){

		logger.info("Enter into saveTask");
		DataSource dataSource = jdbcTemplate.getDataSource();
		try{
		if(bean!=null){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			Map<String,Object> recordParameters = new HashMap<String,Object>();
			logger.info(recordParameters);
			recordParameters.put("uid",bean.getUid());
			recordParameters.put("tid",bean.getTid());
			recordParameters.put("status",bean.getStatus());
			recordParameters.put("percentagecompleted",0);
			jdbcInsert.withTableName("taskdetails")
			.usingGeneratedKeyColumns("tdid");
			logger.info("task details inserted");
			jdbcInsert.executeAndReturnKey(recordParameters).intValue();
	}
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		logger.info(bean);
		logger.info("exit from saveTask");
		return bean;
	}
	@Override
	public TaskDetails updateTaskDetails(TaskDetails bean)throws DBUpdateException
	{
		logger.info("Enter into updateTaskDetails");
		int tid=bean.getTid();
		try{
		logger.info(tid);
		String updateQuery=dbProps.getProperty(DBConstants.UPDATE_TASK_DETAILS);
		int numberRecordsUpdated =jdbcTemplate.update(updateQuery,new TaskUpdateDetailsStmtSetter(bean));
		 if(numberRecordsUpdated == 0){
	            DBUpdateException dbException = new DBUpdateException("Zero Records updated");
	            dbException.setErrorCode(ErrorConstants.TASK_DETAILS_UPDATE_FAILED );
	            throw dbException;
	        }
		}catch(Exception e){
			logger.info(e.getMessage());
		}
	        logger.info("exit from updateEmployeeDetailsdao impl");
	        return bean;	
	}
	@Override
	public float updatePercentage(int uid,float percentage,String status ,String reason) throws DBUpdateException{
		try{
		String updatePercentageQuery = dbProps.getProperty(DBConstants.UPDATE_PERCENTAGE);
		Object[] params = {percentage,status,reason,uid};
		  int[] types = {Types.FLOAT,Types.VARCHAR,Types.VARCHAR,Types.INTEGER};
		  int numberRecordsUpdated = jdbcTemplate.update(updatePercentageQuery,params,types);
			boolean result=false;
			if(numberRecordsUpdated == 0){
				DBUpdateException dbException = new DBUpdateException("Save Status Failed");
				dbException.setErrorCode(ErrorConstants.UPDATE_PERCENTAGE_FAILED);
				throw dbException;
							}
			
			else{
				result=true;
			}
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		return percentage;
	
}
	@Override
	public  List<TaskDetails> getEmpMilestones() {
		logger.info("enter into getEmpMilestones");
		
		String getquery =dbProps.getProperty(DBConstants.LOAD_EMPLOYEE_PROJECT_DETAILS);
		List<TaskDetails> projdetails =jdbcTemplate.query(getquery, new EmpProjectDetailsRowMapper());
		if(projdetails!=null){
		logger.info(projdetails);
		logger.info("exit from getEmpMilestones");
		
		}
		return projdetails;
	}
	@Override
	public List<TaskDetails> getEmployeeTasksPerformance(String empid,int npid)
	{
		logger.info("enter into getEmployeeTasksPerformance");
		Object[] params = {empid,npid};
		int[] types = {Types.VARCHAR ,Types.INTEGER};
		String getquery  = dbProps.getProperty(DBConstants.LOAD_INDIVIDUAL_TASKS_DETAILS);
		List<TaskDetails> employeetaskdetails = jdbcTemplate.query(getquery,params,types,new EmpTasksDetailsRowMapper());
		logger.info(employeetaskdetails);
		logger.info("exit from getEmployeeTasksPerformance");
		return employeetaskdetails ;
		
	}
	@Override
	public NewProjectBean saveNewProject(NewProjectBean bean) {
		logger.info("enter into saveNewProject");
		DataSource dataSource = jdbcTemplate.getDataSource();
		try{
		if(bean!=null){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			Map<String,Object> recordParameters = new HashMap<String,Object>();
			
			recordParameters.put("projectname", bean.getProjectname());
			recordParameters.put("projectdescription", bean.getProjectdescription());
			recordParameters.put("projectdeadline", bean.getDeadline());
			recordParameters.put("createddate", bean.getCreateddate());
			recordParameters.put("picture", bean.getPicture());
			jdbcInsert.withTableName("projectdetails")
			.usingGeneratedKeyColumns("npid");
			logger.info("project details inserted");
			jdbcInsert.executeAndReturnKey(recordParameters).intValue();
			
	}
		}catch(Exception e){
			logger.info(e.getMessage());
		}
		logger.info(bean);
		logger.info("exit from saveNewProject");
		return bean;
	}
	@Override
	public List<NewProjectBean> getEmployeeProjectDetails()
	{
	    logger.info("enter into getEmployeeProjectDetails");
	    String projectquery=dbProps.getProperty(DBConstants.LOAD_PROJECT_DETAILS);
		List<NewProjectBean> projectdetails=jdbcTemplate.query(projectquery, new ProjectDetailsRowMapper());
		logger.info(projectdetails);
		logger.info("exit from getEmployeeProjectDetails");
		
	  return projectdetails;
	}
	
	
	@Override
	public List<TaskDetails> getEmployeesOfProject(int npid)
	{
		logger.info("enter into getemployeesof the project");
		String employeesproject=dbProps.getProperty(DBConstants.LOAD_EMPLOYEES_UNDER_PROJECT);
		List<TaskDetails> employees=jdbcTemplate.query(employeesproject,new Object[]{npid},new EmployeesUnderProjectRowMapper());
		
		logger.info("exit from getEmployeesofProject");
		return employees;
		
	}
	@Override
	public List<TaskDetails> getProjectTypeDetails()
	{
		logger.info("enter into getProjectTypeDetails");
		String projecttype=dbProps.getProperty(DBConstants.LOAD_TYPE_PROJECTS);
		List<TaskDetails> project=jdbcTemplate.query(projecttype, new ProjectTypeDetailsRowMapper());
		
		logger.info(project);
		logger.info("exit from getProjectType Details");
		return project;
	}
	
}

