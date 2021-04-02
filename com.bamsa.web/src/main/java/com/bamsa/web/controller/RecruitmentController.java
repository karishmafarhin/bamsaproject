package com.bamsa.web.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bamsa.db.exceptions.DBUpdateException;
import com.bamsa.web.model.AutoContactModel;
import com.bamsa.web.model.CalendarModal;
import com.bamsa.web.model.CandidateInfoModel;
import com.bamsa.web.model.ContactModel;
import com.bamsa.web.model.EmployeeModel;
import com.bamsa.web.model.EmployeeTaskModel;
import com.bamsa.web.model.HotlistedCandidateInfoModel;
import com.bamsa.web.model.OpeningInfoModel;
import com.bamsa.web.model.TaskDetailsModel;
import com.bamsa.web.model.UserBean;
import com.bamsa.web.service.UserService;
import com.bamsa.web.util.ApplicationConstants;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
@Controller
public class RecruitmentController {
	@Autowired
	UserService userServiceImpl;
	 @Autowired
	 private JavaMailSender mailSender;
	 @Autowired
	private Properties fileProps;
	private static Logger logger = Logger.getLogger(RecruitmentController.class);
	@RequestMapping("/rdashboard")
	public String showRecruitmentDashboard(HttpServletRequest request,Model modal) {
		List<OpeningInfoModel> alldetails ;
		alldetails=userServiceImpl.getAllOpeningdetails();
		int size=alldetails.size();
		request.setAttribute("messageone", size);
		List<CandidateInfoModel> candidatedetails;
		candidatedetails=userServiceImpl.getCandidateDetails();
		int sizec=candidatedetails.size();
		request.setAttribute("messagetwo", sizec);
		List<CandidateInfoModel> detailsHotlist;
		detailsHotlist= userServiceImpl.getHotlistdetails();
		int sizeh=detailsHotlist.size();
		request.setAttribute("messagethree", sizeh);
		List<ContactModel> detailscontact;
		detailscontact=userServiceImpl.getAccountDetails();
		int sizes=detailscontact.size();
		request.setAttribute("messagefour", sizes);
		return "recruitmentdashboard";
	}
	@RequestMapping("/addClient")
	public String showAddClientRegistration(HttpServletRequest request) throws JsonProcessingException{
		List<EmployeeModel> model = userServiceImpl.getAssignedtodetails();
		request.setAttribute("owners", model);
		List<ContactModel> accountdetails=userServiceImpl.getAccountDetails();
		List<AutoContactModel> automodels = new ArrayList<AutoContactModel>();
		for(ContactModel automodel :accountdetails){
			AutoContactModel auto = new AutoContactModel();
			auto.setLabel(automodel.getAccountName());
			auto.setValue(automodel.getAccountName());
			automodels.add(auto);
		}
		ObjectMapper objMapper = new ObjectMapper();
		String notesjson = objMapper.writeValueAsString(automodels);
        request.setAttribute("accountdetails",notesjson);
		
		return "CreateClient";
	}
	@RequestMapping("/candidateRegistration")
	public String showCandidateform( HttpServletRequest request )
	{
		return "candidateRegistrationForm";
	}
	@RequestMapping("/registerCandidate")
	public String saveCandidatedetails(@RequestParam("cl") MultipartFile coverletter,@RequestParam("resume") MultipartFile resume, HttpServletRequest request )
	{
		try{
		CandidateInfoModel information = buildCandidatedetails(request);
		
		if(null!=coverletter &&!coverletter.isEmpty()){
			
			String filename =resume.getOriginalFilename();
			logger.info(filename);
			String extension =filename.substring(filename.lastIndexOf("."));
			logger.info(extension);
			byte[] bytes = resume.getBytes();
			logger.info(bytes);

			// Creating the directory to store file
			String rootPath = fileProps.getProperty(ApplicationConstants.FILE_PATH);
			rootPath =rootPath.replace('/', File.separatorChar);
			File dir = new File(rootPath + File.separator + "COVERLETTERS");
			if (!dir.exists())
				dir.mkdirs();

			// Create the file on directory
			File localfile = new File(dir.getAbsolutePath() + File.separator + information.getEmailid()+extension);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(localfile));
			stream.write(bytes);
			stream.close();
			logger.info("local File Location="
					+ localfile.getAbsolutePath());
			
			
			information.setCoverletter(localfile.getAbsolutePath());
			
		}
		if (!resume.isEmpty()) {
			try {
				String filename =resume.getOriginalFilename();
				logger.info(filename);
				String extension =filename.substring(filename.lastIndexOf("."));
				logger.info(extension);
				byte[] bytes = resume.getBytes();
				logger.info(bytes);

				// Creating the directory to store file
				String rootPath = fileProps.getProperty(ApplicationConstants.FILE_PATH);
				rootPath =rootPath.replace('/', File.separatorChar);
				File dir = new File(rootPath + File.separator + "RESUMES");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on directory
				File localfile = new File(dir.getAbsolutePath() + File.separator + information.getEmailid()+extension);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(localfile));
				stream.write(bytes);
				stream.close();
				logger.info("local File Location="
						+ localfile.getAbsolutePath());
				information.setResume(localfile.getAbsolutePath());
				
				information = userServiceImpl.saveCandidatedetails(information);
				logger.info(information);
				if(null!=information){
					request.setAttribute("successmessage","Candidate details Successfully Uploaded");
				}
				
				return "forward:/candidateRegistration";
			} catch (Exception e) {
				logger.error(e.getMessage());
				request.setAttribute("message","Failed to upload Layout");
				return "forward:/plotlayout";
			}
		} else {
			request.setAttribute("message", "Resume is empty");
			return "forward:/candidateRegistration";
		}
		
		}catch(Exception e)
		{
			request.setAttribute("message", "Candidate details already exists");
			logger.error(e.getMessage());
			return "forward:/candidateRegistration";
			
		}
		
		
		
		
		}
	private CandidateInfoModel buildCandidatedetails(HttpServletRequest request)
	{
		
		CandidateInfoModel information=new CandidateInfoModel();
		try{
			logger.info("enter into buildCandidatedetails");
			UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
			int uid = userData.getUid();
			information.setFirstName(request.getParameter("fname"));
			information.setMiddleName(request.getParameter("mname"));
			information.setLastName(request.getParameter("lname"));
			information.setEmailid(request.getParameter("email"));
			information.setMobile(request.getParameter("mobno"));
			information.setVisaStatus(request.getParameter("vstatus"));
			information.setGender((request.getParameter("gender")).charAt(0));
			information.setState(request.getParameter("state"));
			information.setCity(request.getParameter("city"));
			DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
			information.setAvailableFrom(format.parse(request.getParameter("af")));
			information.setBillRateType(request.getParameter("ratetype"));
			information.setRate(Float.valueOf(request.getParameter("rate")));
			information.setSsn(request.getParameter("ssn"));
			if(null!=request.getParameter("hotlist")){
			information.setHotlist(request.getParameter("hotlist").charAt(0));}
			information.setPrimaryskills(request.getParameter("skills"));
			information.setRelocate(request.getParameter("reloc").charAt(0));
			information.setTypeofConsultant(request.getParameter("consultant"));
			information.setCreatedby(uid);
			information.setCreatedDate(new Date());
			
		
		logger.info(information);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		logger.info("Exit From buildCandidatedetails");
		return information;
	}
	@RequestMapping("/registerAccount")
	public String saveContactdetails(HttpServletRequest request){
		try{
			
			logger.info("Enter into saveContactdetails");
		ContactModel model = buildContactdetails(request);
		logger.info(model);
		model=userServiceImpl.saveContactdetails(model);
		logger.info(model);
		

		
	}catch(Exception e)
	{   logger.error(e.getMessage());
		request.setAttribute("errormessage", "Contact already exists");
		logger.info("Exit From saveContactdetails");
		return "forward:/addClient";
	}
		request.setAttribute("successmessage", "Contact created successfully");
		return "forward:/addClient";
	
	}
	
	private ContactModel buildContactdetails(HttpServletRequest request)
	{
		ContactModel contact=new ContactModel();
		try{
			logger.info("enter into buildContactdetails");
			UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
			int uid = userData.getUid();
			contact.setCreatedby(uid);
			contact.setAccountName(request.getParameter("accountname"));
			if(null!=request.getParameter("accowner")){
			contact.setAccountOwner(request.getParameter("accowner"));
			}
			contact.setCategory(request.getParameter("category"));
			if(null!=request.getParameter("website")){
			contact.setWebsite(request.getParameter("website"));
			}
			contact.setStatus(request.getParameter("status"));
			if(null!=request.getParameter("phone")){
			contact.setPhoneno(request.getParameter("phone"));
			}
			if(null!=request.getParameter("state")){
			contact.setState(request.getParameter("state"));
			}
			if(null!=request.getParameter("city")){
			contact.setCity(request.getParameter("city"));
			}
			contact.setPrimaryemail(request.getParameter("pemail"));
			if(null!=request.getParameter("description")){
			contact.setDescription(request.getParameter("description"));
			}
			contact.setFirstname(request.getParameter("fname"));
			if(null!=request.getParameter("lname")){
			contact.setLastname(request.getParameter("lname"));
			}
			if(null!=request.getParameter("semail")){
			contact.setSecondaryemail(request.getParameter("semail"));
			}
			if(null!=request.getParameter("reqlist")){
			contact.setReqlist(request.getParameter("reqlist").charAt(0));
			}
			else{
				contact.setReqlist('N');
			}
			if(null!=request.getParameter("hotlist")){
			contact.setHotlist(request.getParameter("hotlist").charAt(0));
			}
			else{
				contact.setHotlist('N');	
			}
			contact.setCreateddate(new Date());
			logger.info(contact);
		}catch(Exception e)
		{
			
			logger.info("Exit From buildContactdetails");
		}
		return contact;
	}
	
	@RequestMapping("/addRequirement")
	public String CreateRequirement(HttpServletRequest request) throws JsonProcessingException{
		logger.info("enter into getAllOpeningdetails" );
		List<ContactModel> contactdetails= userServiceImpl.getAccountDetails();
		
		Set<AutoContactModel> primevendor= new HashSet<AutoContactModel>();
		Set<AutoContactModel> endclient =new HashSet<AutoContactModel>();
		for(ContactModel all:contactdetails)
		{
			if(all.getCategory().equals("implementer")){
				AutoContactModel bean = new AutoContactModel();
				bean.setLabel(all.getAccountName());
				bean.setValue(all.getAccountName());
				primevendor.add(bean);
			}
			
			if(all.getCategory().equals("client")){
				AutoContactModel bean = new AutoContactModel();
				bean.setLabel(all.getAccountName());
				bean.setValue(all.getAccountName());
				endclient.add(bean);
			}
			
		}
		logger.info(primevendor);
		logger.info(endclient);
		ObjectMapper objMapper = new ObjectMapper();
		String pvs = objMapper.writeValueAsString(primevendor);
		String ecs = objMapper.writeValueAsString(endclient);
       

		request.setAttribute("vendor", pvs);
		request.setAttribute("eclient", ecs);
		logger.info("exit from getAllOpeningdetails");
		return "createRequirement";
	}
	@RequestMapping("/registerReq")
	public String saveOpeningdetails(HttpServletRequest request){
		try{
			logger.info("Enter into saveOpeningdetails");
			OpeningInfoModel model=buildOpeninginfo(request);
			logger.info(model);
			model=userServiceImpl.saveOpeningdetails(model);
			logger.info(model);
			
			if(null!=model){
				request.setAttribute("successmessage", "Requirement created successfully");
			}
			
			
		}catch(Exception e)
		{
			request.setAttribute("message", "Requirement already exists");
			logger.error(e.getMessage());
			logger.info("Exit From saveNewBranch");
			
		}
		
			return "forward:/addRequirement";
		
		}
	private OpeningInfoModel buildOpeninginfo(HttpServletRequest request)
	{
		logger.info("enter into buildOpeninginfo");
		OpeningInfoModel opening=new OpeningInfoModel();
		try{
			UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
			int uid = userData.getUid();
			opening.setPositionid(request.getParameter("pid"));
			
			opening.setPositiontitle(request.getParameter("ptitle"));
			
			opening.setState(request.getParameter("state"));
			opening.setCity(request.getParameter("city"));
			opening.setPrimaryskill(request.getParameter("pskill"));
			if(null!=request.getParameter("sskill")){
			opening.setSecondaryskill(request.getParameter("sskill"));
			}
			if(null!=request.getParameter("description")){
			opening.setDescription(request.getParameter("description"));
			}
			opening.setRate(Float.valueOf(request.getParameter("rate")));
			opening.setPrimevendor(request.getParameter("pvendor"));
			if(null!=request.getParameter("eclient")){
			opening.setEndclient(request.getParameter("eclient"));
			}
			opening.setBilltype(Integer.valueOf(request.getParameter("ratetype")));
			opening.setCreatedby(uid);
			opening.setCreateddate(new Date());
			opening.setContactperson(request.getParameter("contact"));
		
			logger.info(opening);
		}catch(Exception e)
		{
			logger.error(e.getMessage());
			logger.info("Exit From buildOpeninginfo");
		}
		return opening;
	}
		
	
	
	@RequestMapping("/viewcandidate")
	public String getCandidateDetails(HttpServletRequest request)
	{
		logger.info("enter into getcandiatedetails");
		
		List<CandidateInfoModel> candidatedetails=userServiceImpl.getCandidateDetails();

		request.setAttribute("candiatedetails",candidatedetails);
        
		
		return "viewCandidate";
		
	}
	
	@RequestMapping("/showresume")
	public void showResume(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		logger.info("enter into getcandiatedetails");
		String EXTERNAL_FILE_PATH = request.getParameter("path");
		File file =new File(EXTERNAL_FILE_PATH);
		if (!file.exists()) { 
			 String errorMessage = "Sorry. The file you are looking for does not exist";
			 logger.info(errorMessage);
	            OutputStream outputStream = response.getOutputStream();
	            outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
	            outputStream.close();
	            return;
	            }
		String mimeType= URLConnection.guessContentTypeFromName(file.getName());
        if(mimeType==null){
          logger.info("mimetype is not detectable, will take default");
            mimeType = "application/octet-stream";
        }
         
        logger.info("mimetype : "+mimeType);
         
        response.setContentType(mimeType);
         
        /* "Content-Disposition : inline" will show viewable types [like images/text/pdf/anything viewable by browser] right on browser 
            while others(zip e.g) will be directly downloaded [may provide save as popup, based on your browser setting.]*/
        response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() +"\""));
 
         
        /* "Content-Disposition : attachment" will be directly download, may provide save as popup, based on your browser setting*/
        //response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", file.getName()));
         
        response.setContentLength((int)file.length());
 
        InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
 
        //Copy bytes from source to destination(outputstream in this example), closes both streams.
        FileCopyUtils.copy(inputStream, response.getOutputStream());
		
	}
	@RequestMapping("/showcoverletter")
		public void showCoverletter(HttpServletRequest request,HttpServletResponse response)throws IOException
		{
			logger.info("enter into showCoverletter");
			String EXTERNAL_FILE_PATHC=request.getParameter("path");
			File filec = new File(EXTERNAL_FILE_PATHC);
			if(!filec.exists()){
				String errorMessage = "Sorry. The file you are looking for does not exist";
				 logger.info(errorMessage);
		            OutputStream outputStreamc = response.getOutputStream();
		            outputStreamc.write(errorMessage.getBytes(Charset.forName("UTF-8")));
		            outputStreamc.close();
		            return;
			}
			String mimeType= URLConnection.guessContentTypeFromName(filec.getName());
	        if(mimeType==null){
	          logger.info("mimetype is not detectable, will take default");
	            mimeType = "application/octet-stream";
	           
	        }
	        logger.info("mimetype : "+mimeType);
            
            response.setContentType(mimeType);
             
            /* "Content-Disposition : inline" will show viewable types [like images/text/pdf/anything viewable by browser] right on browser 
                while others(zip e.g) will be directly downloaded [may provide save as popup, based on your browser setting.]*/
            response.setHeader("Content-Disposition", String.format("inline; filename=\"" + filec.getName() +"\""));
     
             
            /* "Content-Disposition : attachment" will be directly download, may provide save as popup, based on your browser setting*/
            //response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", file.getName()));
             
            response.setContentLength((int)filec.length());
     
            InputStream inputStream = new BufferedInputStream(new FileInputStream(filec));
     
            //Copy bytes from source to destination(outputstream in this example), closes both streams.
            FileCopyUtils.copy(inputStream, response.getOutputStream());
		}
		
		
	
	@RequestMapping(value="/getcontactdetails",produces = "application/json")
	public @ResponseBody ContactModel getContactDetails(HttpServletRequest request) throws IOException{
		String name=request.getParameter("accname");
		ContactModel model=userServiceImpl.getAccountOwnerdetails(name);
		return model;
	}
	
	@RequestMapping("/viewopening")
	public String getAllOpeningdetails(HttpServletRequest request) throws JsonProcessingException
	{
		logger.info("enter into getAllOpeningdetails");
		
		
		List<OpeningInfoModel> openingmodel =userServiceImpl.getAllOpeningdetails();
		List<ContactModel> contactdetails= userServiceImpl.getAccountDetails();
		Set<AutoContactModel> primevendor= new HashSet<AutoContactModel>();
		Set<AutoContactModel> endclient =new HashSet<AutoContactModel>();
		for(ContactModel all:contactdetails)
		{
			if(all.getCategory().equals("implementer")){
				AutoContactModel bean = new AutoContactModel();
				bean.setLabel(all.getAccountName());
				bean.setValue(all.getAccountName());
				primevendor.add(bean);
			}
			
			if(all.getCategory().equals("client")){
				AutoContactModel bean = new AutoContactModel();
				bean.setLabel(all.getAccountName());
				bean.setValue(all.getAccountName());
				endclient.add(bean);
			}
			
		}
		logger.info(primevendor);
		logger.info(endclient);
		ObjectMapper objMapper = new ObjectMapper();
		String pvs = objMapper.writeValueAsString(primevendor);
		String ecs = objMapper.writeValueAsString(endclient);

		request.setAttribute("vendor", pvs);
		request.setAttribute("eclient", ecs);
		request.setAttribute("opening", openingmodel);
		logger.info(openingmodel);
		return "openingDetails";
		
	}
	@RequestMapping("/updatecandidate")
	public String updateCandidateDetails(@RequestParam("resume") MultipartFile resume, HttpServletRequest request ) throws IOException, DBUpdateException 
	{
		logger.info("enter into updateCandidateDetails");
		try{
		
			CandidateInfoModel updatecandidate=buildUpdateCandidateDetails(request);
			
		
			if(!resume.isEmpty()){
			//	updatecandidate.setResume(resume.getBytes());
				
			}
			else{
				request.setAttribute("message", "Resume is empty");
				return "forward:/viewcandidate";
			}
			updatecandidate=userServiceImpl.updateCandidateDetails(updatecandidate);
				logger.info(updatecandidate);
		
			
			request.setAttribute("userupdatedvalues",updatecandidate);
			request.setAttribute("successmessage", "Your Details Updated Successfully");
		}catch(Exception e){
			logger.error(e.getMessage());
			request.setAttribute("message","Your details not updated!");
			return "forward:/viewcandidate";
		}
			logger.info("Exit From updateCandidateDetails");
			return "forward:/viewcandidate";
	}
	public CandidateInfoModel buildUpdateCandidateDetails(HttpServletRequest request) {
		logger.info("enter into buildUpdateCandidateDetails");
		CandidateInfoModel updateddetails=new CandidateInfoModel();
		
		try {
		int ciid=Integer.valueOf(request.getParameter("ciid"));
		updateddetails.setCiid(ciid);
		updateddetails.setFirstName(request.getParameter("firstname"));
		if(null!=request.getParameter("middlename")){
		updateddetails.setMiddleName(request.getParameter("middlename"));
		}
		updateddetails.setLastName(request.getParameter("lastname"));
		updateddetails.setEmailid(request.getParameter("email"));
		updateddetails.setMobile(request.getParameter("contact"));
		updateddetails.setGender(request.getParameter("gender").charAt(0));
		updateddetails.setState(request.getParameter("state"));
		if(null!=request.getParameter("city")){
		updateddetails.setCity(request.getParameter("city"));
		}
		updateddetails.setVisaStatus(request.getParameter("vstatus"));
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		
			updateddetails.setAvailableFrom(format.parse(request.getParameter("af")));
	
		updateddetails.setTypeofConsultant(request.getParameter("consultant"));
		updateddetails.setRelocate(request.getParameter("reloc").charAt(0));
		updateddetails.setPrimaryskills(request.getParameter("skills"));
		if(null!=request.getParameter("ssn")){
		updateddetails.setSsn(request.getParameter("ssn"));
		}
		updateddetails.setBillRateType(request.getParameter("ratetype"));
		if(null!=request.getParameter("rate")){
		updateddetails.setRate(Float.valueOf(request.getParameter("rate")));
		}
		if(null!=request.getParameter("hotlist")){
			updateddetails.setHotlist(request.getParameter("hotlist").charAt(0));
		}
		else{
			updateddetails.setHotlist('N');
		}
		} catch (ParseException e) {
			e.printStackTrace();
		}
			logger.info(updateddetails);
		
		logger.info("Exit From buildUpdateCandidateDetails");
		return updateddetails;
	
	}
	@RequestMapping("/updateopening")
	public String updateOpeningDetails( HttpServletRequest request ) throws DBUpdateException 
	{
		logger.info("enter into updateOpeningDetails");
		try{
			OpeningInfoModel updateopening=buildUpdateopeningdetails(request);
			
		
		
			updateopening=userServiceImpl.updatedOpeningDetails(updateopening);
				logger.info(updateopening);
		
			
			
			request.setAttribute("successmessage", "Your Details Updated Successfully");
			
			
			}catch(Exception e){
				request.setAttribute("message", "Your Details Not Updated!");
				return "forward:/viewopening";

			}
	
		return "forward:/viewopening";
			
			
	}
	public OpeningInfoModel buildUpdateopeningdetails(HttpServletRequest request)
	{
		logger.info("enter into buildUpdateopeningdetails");
	OpeningInfoModel updateopening=new OpeningInfoModel();
	int rqid=Integer.valueOf(request.getParameter("rqid"));
	updateopening.setRqid(rqid);
	updateopening.setPositionid(request.getParameter("positionid"));
	updateopening.setPositiontitle(request.getParameter("positiontitle"));
	updateopening.setState(request.getParameter("state"));
	if(null!=request.getParameter("city")){
	updateopening.setCity(request.getParameter("city"));}
	updateopening.setPrimaryskill(request.getParameter("ps"));
	if(null!=request.getParameter("ss")){
	updateopening.setSecondaryskill(request.getParameter("ss"));}
	if(null!=request.getParameter("description")){
	updateopening.setDescription(request.getParameter("description"));}
	updateopening.setRate(Float.valueOf(request.getParameter("brate")));
	updateopening.setPrimevendor(request.getParameter("pvendor"));
	updateopening.setEndclient(request.getParameter("eclient"));
	updateopening.setContactperson(request.getParameter("contact"));
	updateopening.setBilltype(Integer.valueOf(request.getParameter("ratetype")));
	logger.info(updateopening);
	
	logger.info("Exit From buildUpdateopeningdetails");
	return updateopening;

}
	@RequestMapping("/viewhotlist")
	public String getHotlistdetails(HttpServletRequest request){
		logger.info("enter into getHotlistdetails");
		
		
		List<CandidateInfoModel> detailsHotlist= userServiceImpl.getHotlistdetails();
		request.setAttribute("hotlist",detailsHotlist );
		logger.info(detailsHotlist);
		logger.info("exit from getHotlistdetails");
		return "viewHotlistcandidates";
		
	}
	
	@RequestMapping("/updatehotlist")
	public String updateHotlistDetails(@RequestParam("resume") MultipartFile resume, HttpServletRequest request ) throws IOException, DBUpdateException 
	{
		logger.info("enter into updateHotlistDetails");
		try{
			CandidateInfoModel updatehotlist=buildUpdatehotlistDetails(request);
			
		
			if(!resume.isEmpty()){
				//updatehotlist.setResume(resume.getBytes());
				
			}
			else{
				request.setAttribute("message", "Resume is empty");
				return "forward:/viewhotlist";
			}
			updatehotlist=userServiceImpl.updateHotlistDetails(updatehotlist);
				logger.info(updatehotlist);
		
			
			request.setAttribute("userupdatedvalues",updatehotlist);
			request.setAttribute("successmessage", "Your Details Updated Successfully");
		}catch(Exception e){
			logger.error(e.getMessage());
			request.setAttribute("message", "Hotlist Candidate details not updated!");
			return "forward:/viewhotlist";
		}
			
			logger.info("Exit From updateHotlistDetails");
			return "forward:/viewhotlist";
	}
	public CandidateInfoModel buildUpdatehotlistDetails(HttpServletRequest request) {
		logger.info("enter into buildUpdatehotlistDetails");
		CandidateInfoModel updateddetails=new CandidateInfoModel();
		
		
		int ciid=Integer.valueOf(request.getParameter("ciid"));
		updateddetails.setCiid(ciid);
		updateddetails.setFirstName(request.getParameter("firstname"));
		if(null!=request.getParameter("middlename")){
		updateddetails.setMiddleName(request.getParameter("middlename"));
		}
		updateddetails.setLastName(request.getParameter("lastname"));
		updateddetails.setEmailid(request.getParameter("email"));
		updateddetails.setMobile(request.getParameter("contact"));
		updateddetails.setGender(request.getParameter("gender").charAt(0));
		updateddetails.setState(request.getParameter("state"));
		if(null!=request.getParameter("city")){
		updateddetails.setCity(request.getParameter("city"));
		}
		updateddetails.setVisaStatus(request.getParameter("vstatus"));
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		try {
			updateddetails.setAvailableFrom(format.parse(request.getParameter("af")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		updateddetails.setRelocate(request.getParameter("reloc").charAt(0));
		updateddetails.setPrimaryskills(request.getParameter("skills"));
		if(null!=request.getParameter("ssn")){
		updateddetails.setSsn(request.getParameter("ssn"));
		}
		updateddetails.setBillRateType(request.getParameter("ratetype"));
		if(null!=request.getParameter("rate")){
		updateddetails.setRate(Float.valueOf(request.getParameter("rate")));
		}
		if(null!=request.getParameter("hotlist")){
			updateddetails.setHotlist(request.getParameter("hotlist").charAt(0));
		}else{
			updateddetails.setHotlist('N');
		}
		
			logger.info(updateddetails);
		
		logger.info("Exit From buildUpdatehotlistDetails");
		return updateddetails;
	
	}
	@RequestMapping("/broadcast")
	public String composeMail(HttpServletRequest request){
		try{
		int rqid = Integer.valueOf(request.getParameter("rqid")); 
		List<ContactModel> allmails= userServiceImpl.getSubcontractEmails();
		List<OpeningInfoModel> openingmodel =userServiceImpl.getAllOpeningdetails();
		List<String> mails = new ArrayList<String>();
		
		for(OpeningInfoModel model : openingmodel){
			if(model.getRqid()==rqid){
				request.setAttribute("openingdetails", model);
			}
		}
		for(ContactModel mail:allmails){
			mails.add(mail.getPrimaryemail());
		}
		logger.info("broadcastemails"+mails);
		request.setAttribute("emails", mails);
		}
		catch(Exception e){
			
			logger.info(e.getMessage());
		}
		return "Composemail";
	}
	
	
	@RequestMapping(value="/getcontactsofpvdetails",produces = "application/json")
	public @ResponseBody String getcontactsofpv(HttpServletRequest request) throws JsonProcessingException{
		String pvname=request.getParameter("pvname");
		List<ContactModel> contactdetails= userServiceImpl.getAccountDetails();
		List<AutoContactModel> contacts = new ArrayList<AutoContactModel>();
		for(ContactModel contact:contactdetails){
			if(contact.getAccountName().equals(pvname)){
				AutoContactModel model = new AutoContactModel();
				model.setLabel(contact.getFirstname());
				model.setValue(contact.getFirstname());
				contacts.add(model);
			}
		}
		ObjectMapper mapper =new ObjectMapper();
		String contactsString =mapper.writeValueAsString(contacts);
		return contactsString;
		
	}
	@RequestMapping("/viewcontact")
	public String getContactDetail(HttpServletRequest request)
	{
		logger.info("enter into getContactDetail");
		
		List<ContactModel> contactdetails=userServiceImpl.getAccountDetails();

		request.setAttribute("contacts",contactdetails);
		List<EmployeeModel> model = userServiceImpl.getAssignedtodetails();
		request.setAttribute("owners", model);
        logger.info("exit from getContactDetail");
		
		return "viewContacts";
		
	}
	@RequestMapping("/updatecontact")
	public String updateContactDetails( HttpServletRequest request ) throws DBUpdateException 
	{
		logger.info("enter into updateOpeningDetails");
		try{
			ContactModel updatecontact=buildContactDetails(request);
			
		
		
			updatecontact=userServiceImpl.updateContactDetails(updatecontact);
				logger.info(updatecontact);
		
			
			
			request.setAttribute("successmessage", "Your Details Updated Successfully");
			
			
			}catch(Exception e){
				request.setAttribute("message", "Your Details Not Updated!");
				return "forward:/viewcontact";

			}
	
		return "forward:/viewcontact";
			
			
	}
	public ContactModel buildContactDetails(HttpServletRequest request)throws DBUpdateException
	{
		logger.info("enter into buildContactDetails");
		ContactModel updatecontact=new ContactModel();
		int acid=Integer.valueOf(request.getParameter("acid"));
		updatecontact.setAcid(acid);
		updatecontact.setFirstname(request.getParameter("firstname"));
		if(null!=request.getParameter("lastname")){
		updatecontact.setLastname(request.getParameter("lastname"));
		}
		updatecontact.setAccountName(request.getParameter("accountname"));
		if(null!=request.getParameter("accowner")){
		updatecontact.setAccountOwner(request.getParameter("accowner"));
	}
		updatecontact.setCategory(request.getParameter("category"));
		if(null!=request.getParameter("website")){
		updatecontact.setWebsite(request.getParameter("website"));
		}
		updatecontact.setStatus(request.getParameter("status"));
		if(null!=request.getParameter("phone")){
			updatecontact.setPhoneno(request.getParameter("phone"));
		}
		if(null!=request.getParameter("state")){
		updatecontact.setState(request.getParameter("state"));
		}
		if(null!=request.getParameter("city")){
		updatecontact.setCity(request.getParameter("city"));
		}
		updatecontact.setPrimaryemail("pemail");
		if(null!=request.getParameter("description")){
		updatecontact.setDescription(request.getParameter("description"));
		}
		if(null!=request.getParameter("semail")){
			updatecontact.setSecondaryemail(request.getParameter("semail"));
		}
		if(null!=request.getParameter("reqlist")){
			updatecontact.setReqlist(request.getParameter("reqlist").charAt(0));
			}
			else{
				updatecontact.setReqlist('N');
			}
			if(null!=request.getParameter("hotlist")){
				updatecontact.setHotlist(request.getParameter("hotlist").charAt(0));
			}
			else{
				updatecontact.setHotlist('N');	
			}
			logger.info(updatecontact);
			
			logger.info("Exit From buildContactDetails");
			return updatecontact;
	}
	
	@RequestMapping("/broadcastopeningmail")
	public String broadcastOpeningSendmail(HttpServletRequest request)throws Exception{
	
try{
		String tomails = request.getParameter("to");
		String ccmails = request.getParameter("cc");
		String bccmails = request.getParameter("bcc");
		String mailbody = request.getParameter("mailbody");
		String subject =request.getParameter("subject");
		tomails = tomails.replace("[","");
		tomails = tomails.replace("]","");
		String to [] = tomails.split(",");
		 MimeMessage mime = this.mailSender.createMimeMessage();
		  MimeMessageHelper helper = new MimeMessageHelper(mime, true);
		  String cc[]=null;
		  String bcc[]=null;
		if(null!=ccmails){
		 cc = ccmails.split(",");
		  }
		if(null!=bccmails){
		 bcc = bccmails.split(",");
		
		}
		// sends the e-mail 
         helper.setTo(to);
        
			  helper.setSubject(subject);
			 // helper.setBcc(bcc);
		        // helper.setCc(cc);
			  String htmlText = mailbody;
			    helper.setText(htmlText,true);
			    this.mailSender.send(mime);
			    request.setAttribute("success", true);
			    
}catch(Exception e){
	logger.error(e.getMessage());
	 request.setAttribute("success", false);
}
		
		return "successorerror";
	}
	
	
	
	
	@RequestMapping("/broadcasthotlist")
	public String broadcasthotlistmail(HttpServletRequest request)throws Exception{
	
		List<ContactModel> contactdetails= userServiceImpl.getAccountDetails();
		List<String> mails = new ArrayList<String>();
		for(ContactModel model:contactdetails){
		if(Character.toString(model.getReqlist()).equals("Y"))	{
			mails.add(model.getPrimaryemail());
		}
		}
		List<CandidateInfoModel> detailsHotlist= userServiceImpl.getHotlistdetails();
		
		
	
		ObjectMapper mapper = new ObjectMapper();
		String hstring  = mapper.writeValueAsString(detailsHotlist);
		request.setAttribute("hotlist",hstring );
		request.setAttribute("hotlistmails", mails);
		return "Composemailhotlist";
	
}
}
