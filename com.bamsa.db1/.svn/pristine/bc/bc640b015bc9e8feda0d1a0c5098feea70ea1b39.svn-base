package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.CandidateInfoBean;
import com.bamsa.db.beans.ContactBean;

public class HotlistRowMapper implements RowMapper<CandidateInfoBean> {
	private static Logger logger = Logger.getLogger(HotlistRowMapper.class);

	@Override
	public CandidateInfoBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("enter into rowmapper");
		CandidateInfoBean bean =new CandidateInfoBean();
			bean.setCiid(rs.getInt("ciid"));
			bean.setFirstName(rs.getString("firstname"));
			bean.setMiddleName(rs.getString("middlename"));
			bean.setLastName(rs.getString("lastname"));
			bean.setEmailid(rs.getString("emailid"));
			bean.setMobile(rs.getString("contactno"));
			bean.setState(rs.getString("state"));
			bean.setCity(rs.getString("city"));
			bean.setVisaStatus(rs.getString("visastatus"));
			bean.setAvailableFrom(rs.getDate("availablefrom"));
			bean.setRelocate(rs.getString("relocation").charAt(0));
			bean.setGender(rs.getString("gender").charAt(0));
			bean.setTypeofConsultant(rs.getString("typeofconsultant"));
			bean.setSsn(rs.getString("ssnno"));
			bean.setBillRateType(rs.getString("billrate"));
			bean.setRate(rs.getFloat("rate"));
			bean.setCoverletter(rs.getString("coverletter"));
			bean.setResume(rs.getString("resume"));
			bean.setPrimaryskills(rs.getString("primaryskills"));
			bean.setCreatedDate(rs.getDate("createddate"));
			bean.setCreatedby(rs.getInt("createdby"));
			bean.setEmpId(rs.getString("empid"));
			bean.setHotlist(rs.getString("hotlist").charAt(0));
		logger.info("exit from rowmapper");
			return bean;	
	}

}
