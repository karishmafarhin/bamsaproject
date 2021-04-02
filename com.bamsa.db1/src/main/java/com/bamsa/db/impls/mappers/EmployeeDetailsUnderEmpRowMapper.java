package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.Employee;


public class EmployeeDetailsUnderEmpRowMapper implements RowMapper<Employee> {
	private static Logger logger = Logger.getLogger(EmployeeDetailsUnderEmpRowMapper.class);

	@Override
	public Employee mapRow(ResultSet resultSet, int rowNum) throws SQLException {
		logger.info("Enter into Employee");
		
		Employee bean= new Employee();
		bean.setEmpId(resultSet.getString("empid"));
		bean.setName(resultSet.getString("name"));
		bean.setHierarchyId(resultSet.getInt("hierarchyid"));
		bean.setUid(resultSet.getInt("umid"));
		bean.setStreamid(resultSet.getInt("streamid"));
		bean.setDesigid(resultSet.getInt("desigid"));
		bean.setBranchname(resultSet.getString("branchname"));
		logger.info(bean);
		logger.info("exit from Employee");
		return bean;
	}	
	

}
