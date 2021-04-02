package com.bamsa.web.builder;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.bamsa.db.beans.GrievanceDetails;
import com.bamsa.web.model.GrievanceDetailsModel;

@Component
public class GrievanceBuilder {

	
	private static Logger logger = Logger.getLogger(GrievanceBuilder.class);

    public GrievanceDetails buildGrievanceDetails(GrievanceDetailsModel reggrievance)
    {
    	logger.info("Enter into buildGrievanceDetails");
    	GrievanceDetails  grievancedetails = new GrievanceDetails();
    	grievancedetails.setGrievancetype(reggrievance.getGrievancetype());
    	grievancedetails.setGrievancesevere(reggrievance.getGrievancesevere());
    	grievancedetails.setMobileNo(reggrievance.getMobileNo());
    	grievancedetails.setGrievancedetails(reggrievance.getGrievancedetails());
    	grievancedetails.setUid(reggrievance.getUid());
    	logger.info(grievancedetails);
        logger.info("exit into buildGrievanceDetails");
    	return grievancedetails;
    }
   
     public GrievanceDetailsModel buildGrievanceDetailsModel(GrievanceDetails grievancedetails )
     {   logger.info("enter into buildGrievanceDetailsModel ");
    	 GrievanceDetailsModel model = new GrievanceDetailsModel();
    	 model.setUid(grievancedetails.getUid());
    	 model.setGrievancetype(grievancedetails.getGrievancetype());
    	 model.setGrievancesevere(grievancedetails.getGrievancesevere());
    	 model.setMobileNo(grievancedetails.getMobileNo());
    	 model.setGrievancedetails(grievancedetails.getGrievancedetails());
    	 logger.info(model);
    	 logger.info("exit from buildGrievanceDetailsModel");
         return model;
     }
     
     public GrievanceDetails buildUpdateGrievnaceTicketUpdateStatus(GrievanceDetailsModel updateticket)
     {
    	 
    	 logger.info("enter into buildUpdateGrievnaceTicketUpdateStatus");
    	 GrievanceDetails grievancedetials= new GrievanceDetails();
    	 grievancedetials.setStatus(updateticket.getStatus());
    	 grievancedetials.setGid(updateticket.getGid());
    	 logger.info(grievancedetials);
    	 logger.info("exit from buildUpdateGrievnaceTicketUpdateStatus");
    	 return grievancedetials;
     }
     
     public GrievanceDetailsModel buildUpdateGrievanceTicketUpdateStatus(GrievanceDetails bean)
     {
    	 logger.info("enter into buildUpdateGrievanceTicketUpdateStatus");
    	 GrievanceDetailsModel model = new GrievanceDetailsModel();
    	 model.setStatus(bean.getStatus());
    	 model.setGid(bean.getGid());
    	 logger.info("exit from buildUpdateGrievanceTicketUpdateStatus");
    	 return model;
    	 
    	 
    	 
     }
     
    
    

}
