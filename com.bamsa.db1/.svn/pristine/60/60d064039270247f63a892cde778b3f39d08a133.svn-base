package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.EmployeeTask;
import com.bamsa.db.beans.NewProjectBean;
import com.bamsa.db.beans.TaskDetails;

public class ProjectDetailsRowMapper implements RowMapper<NewProjectBean> {

	private static Logger logger = Logger.getLogger(ProjectDetailsRowMapper.class);
	
	@Override 
	public NewProjectBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("enter into ProjectDetailsRowMapper");
		NewProjectBean bean = new NewProjectBean();
		bean.setNpid(rs.getInt("npid"));
		bean.setProjectname(rs.getString("projectname"));
	   logger.info("exit from ProjectDetailsRomapper");
	  return bean;
	}
	
}
