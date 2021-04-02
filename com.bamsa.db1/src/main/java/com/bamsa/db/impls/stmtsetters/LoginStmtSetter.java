package com.bamsa.db.impls.stmtsetters;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;
import com.bamsa.db.beans.User;

public class LoginStmtSetter  implements PreparedStatementSetter {
	private static Logger logger = Logger.getLogger(LoginStmtSetter.class);
	User user = null;
	public LoginStmtSetter(User user){
		this.user = user;
	}
	public void setValues(PreparedStatement ps) throws SQLException {
		try{
			ps.setString(1, user.getNewpassword());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getPassword());
		}catch(Exception e)
		{
			logger.error(e.getMessage());
			throw new SQLException(e.getMessage());
		}
	}
}
