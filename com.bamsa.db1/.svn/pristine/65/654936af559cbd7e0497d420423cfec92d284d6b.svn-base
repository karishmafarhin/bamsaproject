package com.bamsa.db.dao;

import java.util.List;

import com.bamsa.db.beans.OpeningInfoBean;
import com.bamsa.db.exceptions.DBUpdateException;

public interface OpeningInfoDAO {

	/**
	 * creates Requirement info
	 * @param OpeningInfoBean bean
	 * @return OpeningInfo bean
	 */
	public OpeningInfoBean saveOpeningdetails(OpeningInfoBean openings);
	public OpeningInfoBean getOpeningdetails(int rqid);
	public List<OpeningInfoBean> getAllOpeningdetails();
	public OpeningInfoBean updatedOpeningDetails(OpeningInfoBean openingdetails)throws DBUpdateException;
}
