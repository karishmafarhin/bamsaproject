package com.bamsa.db.impls.stmtsetters;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.bamsa.db.beans.ClockTimeBean;

public class ClockTimeStmtSetter implements PreparedStatementSetter {
	private static Logger logger = Logger.getLogger(ClockTimeStmtSetter.class);
	
		ClockTimeBean bean =null;
		public ClockTimeStmtSetter(ClockTimeBean bean){
			this.bean=bean;
		}

		@Override
		public void setValues(PreparedStatement ps) throws SQLException {
			logger.info("enter into prepared statement in ClockTimeStmtSetter" );
			
			try{
				ps.setString(1, bean.getClockOutipAddress());
				ps.setTimestamp(2, new java.sql.Timestamp(bean.getClockOutDay().getTime()));
				ps.setInt(3, bean.getUid());
			}catch(Exception e){
				throw new SQLException(e.getMessage());
			}
			
			logger.info("enter into prepared statement in ClockTimeStmtSetter" );
		}
}
