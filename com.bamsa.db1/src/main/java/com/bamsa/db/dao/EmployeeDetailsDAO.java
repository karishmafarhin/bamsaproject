package com.bamsa.db.dao;


import java.util.List;

import com.bamsa.db.beans.EmployeeDetails;
import com.bamsa.db.exceptions.DBUpdateException;

public interface EmployeeDetailsDAO {
	/**
	 * creates EmployeeDetails
	 * @param EmployeeDetails bean
	 * @return EmployeeDetails bean
	 */
	public EmployeeDetails saveEmployeeDetails(EmployeeDetails empDetails);
	/**
	 * creates EmployeeDetails
	 * @param uid
	 * @return EmployeeDetails bean
	 */
	public EmployeeDetails getEmployeeDetails(int uid);
	/**
	 * creates EmployeeDetails
	 * @param EmployeeDetails bean
	 * @return EmployeeDetails bean
	 */
	public EmployeeDetails updateEmployeeDetails(EmployeeDetails employeeDetails) throws DBUpdateException;
    public List<EmployeeDetails> presentEmployeeDetails();
    /**
	 * creates EmployeeDetails
	 * @param 
	 * @return EmployeeDetails bean
	 */
    public List<EmployeeDetails> getAllEmployees();
    /**
	 * creates EmployeeDetails
	 * @param uid
	 * @return EmployeeDetails bean
	 */
    public EmployeeDetails getEmplDetails(int uid);
    
    public EmployeeDetails updateEmployeeReporttoDetails(EmployeeDetails bean)throws DBUpdateException;

}
