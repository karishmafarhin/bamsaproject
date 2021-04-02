package com.bamsa.db.dao;

import java.util.List;

import com.bamsa.db.beans.EmployeeDetails;
import com.bamsa.db.beans.GrievanceDetails;
import com.bamsa.db.exceptions.DBUpdateException;

public interface GrievanceDetailsDAO {

	
	
	 public GrievanceDetails  saveGrievanceDetails(GrievanceDetails grievancedt);
  
	 public List<GrievanceDetails> getAllGrievances();
	 
	 public List<String> getAllEmployeeEmails();
	 
	 public GrievanceDetails updateGrievanceTicketStatus(GrievanceDetails bean)throws DBUpdateException;
      


}
