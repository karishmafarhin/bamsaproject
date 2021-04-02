package com.bamsa.db.dao;

import java.util.List;

import com.bamsa.db.beans.ContactBean;
import com.bamsa.db.exceptions.DBUpdateException;

public interface ContactDAO {

	/**
	 * creates Contact info
	 * @param ContactBean bean
	 * @return ContactBean bean
	 */
	public ContactBean saveContactdetails(ContactBean contactdetails);

	/**
	 * gets Contact info
	 * @param ContactBean bean
	 */
	public List<ContactBean> getAccountDetails();

	/**
	 * gets AccountOwner info
	 * @param ContactBean bean
	 * @return String accountowner
	 */
	public ContactBean getAccountOwnerdetails(String accountowner);
	
	public List<ContactBean> getSubcontractEmails();
	public ContactBean updateContactDetails(ContactBean contactdetails)throws DBUpdateException;
	
	
}
