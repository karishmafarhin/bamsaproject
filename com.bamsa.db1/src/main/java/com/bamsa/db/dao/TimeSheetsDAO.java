package com.bamsa.db.dao;

import java.util.List;

import com.bamsa.db.beans.ClockTimeBean;
import com.bamsa.db.exceptions.DBUpdateException;

public interface TimeSheetsDAO {
	
	/**
	 * saves the clockin details
	 * @param ClockTimeBean
	 * @return ClockTimeBean
	 */
	public ClockTimeBean saveClockInDetails(ClockTimeBean bean);

	/**
	 * saves the clocktime details
	 * @param uid
	 * @return ClockTimeBean
	 */
	public List<ClockTimeBean> getClockTimeDetails(int uid);
	/**
	 * saves the clockout details
	 * @param ClockTimeBean
	 * @return ClockTimeBean
	 */
	public ClockTimeBean saveClockOutDetails(ClockTimeBean bean)throws DBUpdateException;


}
