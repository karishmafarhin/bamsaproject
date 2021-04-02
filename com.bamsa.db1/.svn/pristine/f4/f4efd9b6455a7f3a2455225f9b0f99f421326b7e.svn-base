package com.bamsa.db.impls.stmtsetters;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.bamsa.db.beans.EmployeeDetails;
import com.bamsa.db.beans.TaskDetails;

public class TaskUpdateDetailsStmtSetter implements PreparedStatementSetter  {
	
	private static Logger logger = Logger.getLogger(TaskUpdateDetailsStmtSetter.class);
	
	TaskDetails taskdetails;
	public TaskUpdateDetailsStmtSetter(TaskDetails taskdetails){
		this.taskdetails=taskdetails;
	}
	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
		logger.info("enter into prepared statement in TaskUpdateDetailsStmtSetter");
		ps.setString(1,taskdetails.getStatus());
		ps.setFloat(2, taskdetails.getPercentagecompleted());
		ps.setString(3, taskdetails.getQueries());
		ps.setString(4, taskdetails.getBacklogs());
		ps.setInt(5, taskdetails.getTid());
		logger.info(ps);
		logger.info("exit from TaskUpdateDetailsStmtSetter");
	}
}
