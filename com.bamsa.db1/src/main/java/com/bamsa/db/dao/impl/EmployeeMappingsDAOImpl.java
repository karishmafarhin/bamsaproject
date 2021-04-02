package com.bamsa.db.dao.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.bamsa.db.beans.EmployeeMappings;
import com.bamsa.db.dao.EmployeeMappingsDAO;

@Repository
public class EmployeeMappingsDAOImpl implements EmployeeMappingsDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private Properties dbProps;
	private static Logger logger = Logger.getLogger(EmployeeMappingsDAOImpl.class);
	@Override
	public EmployeeMappings saveEmployeeMappings(EmployeeMappings mappings) {
		logger.info("enter into saveEmployeeMappings");
		DataSource dataSource = jdbcTemplate.getDataSource();
		if(null != mappings){
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			jdbcInsert.withTableName("employeemappings");
			Map<String,Object> recordParameters = new HashMap<String,Object>();
			recordParameters.put("uid",mappings.getUid());
			recordParameters.put("streamid",mappings.getStreamId());
			recordParameters.put("desigid",mappings.getDesigId());
			recordParameters.put("hierarchyid",mappings.getHierarchyId()); 
			jdbcInsert.execute(recordParameters);
			logger.info(recordParameters);
			logger.info("exit from saveEmployeeMappings");
		}
		
		return mappings;
	}
}
