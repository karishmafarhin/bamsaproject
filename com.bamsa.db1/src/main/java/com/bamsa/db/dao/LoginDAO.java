package com.bamsa.db.dao;

import com.bamsa.db.beans.User;
import com.bamsa.db.exceptions.DBUpdateException;

public interface LoginDAO {

	/**
	 * loads user login credentials.
	 * @param User bean
	 * @return User bean
	 */
	public User loadUserLogin(User user);

	/**
	 * Reset/Update the password against a given user id.
	 * @param User bean
	 * @return update new password
	 */
	public String resetPassword(User user) throws DBUpdateException;
	

}
