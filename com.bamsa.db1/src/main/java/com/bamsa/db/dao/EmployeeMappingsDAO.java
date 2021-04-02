package com.bamsa.db.dao;

import com.bamsa.db.beans.EmployeeMappings;

public interface EmployeeMappingsDAO {
	/**
	 * creates EmployeeMappings
	 * @param EmployeeMappings bean
	 * @return EmployeeMappings bean
	 */
	public EmployeeMappings saveEmployeeMappings(EmployeeMappings mappings);
}
