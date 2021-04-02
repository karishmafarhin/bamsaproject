package com.bamsa.db.dao;

import java.util.List;

import com.bamsa.db.beans.CandidateInfoBean;
import com.bamsa.db.beans.ContactBean;
import com.bamsa.db.beans.EmployeeDetails;
import com.bamsa.db.exceptions.DBUpdateException;


public interface CandidateInfoDAO {
	/**
	 * creates candidate info
	 * @param CandidateInfoBean bean
	 * @return CandidateInfoBean bean
	 */
	public CandidateInfoBean saveCandidatedetails(CandidateInfoBean details);
	public List<EmployeeDetails> getAssignedtodetails();
	public List<CandidateInfoBean> getCandidateDetails();
	public CandidateInfoBean updateCandidateDetails(CandidateInfoBean candidatedetails)throws DBUpdateException;
	public List<CandidateInfoBean> getHotlistdetails();
	public CandidateInfoBean updateHotlistDetails(CandidateInfoBean hotlistdetails)throws DBUpdateException;
}
