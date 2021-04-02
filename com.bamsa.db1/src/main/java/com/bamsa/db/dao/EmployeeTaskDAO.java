package com.bamsa.db.dao;

import java.util.List;

import com.bamsa.db.beans.EmployeeTask;
import com.bamsa.db.beans.NewProjectBean;
import com.bamsa.db.beans.TaskDetails;
import com.bamsa.db.exceptions.DBUpdateException;

public interface EmployeeTaskDAO {
	
	public List<EmployeeTask> getEmployeetask(int uid);
	
	public EmployeeTask saveEmployeeTask(EmployeeTask bean);
	
	public List<TaskDetails> getTaskDetails(int uid);
	
	public TaskDetails saveTask(TaskDetails bean);
    
	public TaskDetails updateTaskDetails(TaskDetails bean)throws DBUpdateException;
	public float updatePercentage(int uid,float percentage,String status,String reason)throws DBUpdateException;
	
	public List<TaskDetails> getEmpMilestones();
	public List<TaskDetails> getEmployeeTasksPerformance(String empid,int npid);
	public NewProjectBean saveNewProject(NewProjectBean bean);
	public List<NewProjectBean> getEmployeeProjectDetails();
	public List<TaskDetails> getEmployeesOfProject(int npid);
	public List<TaskDetails> getProjectTypeDetails();

}
