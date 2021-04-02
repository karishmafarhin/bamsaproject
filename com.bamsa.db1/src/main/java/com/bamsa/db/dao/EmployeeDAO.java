package com.bamsa.db.dao;

import java.util.List;


import com.bamsa.db.beans.Employee;
import com.bamsa.db.beans.EmployeeDetails;
import com.bamsa.db.beans.User;

public interface EmployeeDAO {
	/**
	 * creates user
	 * @param User bean
	 * @return User bean
	 */
	public User createUser(User user);
	/**
	 * get list of  employeedetails(uid,name)
	 * @param 
	 * @returnList<EmployeeDetails>(uid,name)
	 */
	public List<EmployeeDetails> getEmployees();
	/**
	 * gets Employee
	 * @param 
	 * @returnList<Employee>
	 */
	public List<Employee> getEmployeesunderuser(int uid);

	
	public List<EmployeeDetails> getEmployeesDepartmentDetails();
	 public List<EmployeeDetails> getEmployeesReportingDetals();
	
	
}
    