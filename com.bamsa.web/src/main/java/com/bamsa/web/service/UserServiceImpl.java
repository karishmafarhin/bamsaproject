
package com.bamsa.web.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.HashMap;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;

import com.bamsa.db.beans.AssetTicketBean;
import com.bamsa.db.beans.CandidateInfoBean;

import com.bamsa.db.beans.ClockTimeBean;
import com.bamsa.db.beans.CompanyAccessoryBean;
import com.bamsa.db.beans.CompanyAssetsBean;
import com.bamsa.db.beans.CompanyComponentBean;
import com.bamsa.db.beans.CompanyConsumableBean;
import com.bamsa.db.beans.CompanyLicensesBean;
import com.bamsa.db.beans.ContactBean;
import com.bamsa.db.beans.Employee;
import com.bamsa.db.beans.EmployeeDetails;
import com.bamsa.db.beans.EmployeeMappings;
import com.bamsa.db.beans.EmployeeTask;
import com.bamsa.db.beans.GrievanceDetails;
import com.bamsa.db.beans.NewBranchBean;
import com.bamsa.db.beans.NewProjectBean;
import com.bamsa.db.beans.OpeningInfoBean;
import com.bamsa.db.beans.TaskDetails;
import com.bamsa.db.beans.User;
import com.bamsa.db.exceptions.DBUpdateException;
import com.bamsa.web.controller.LoginController;
import com.bamsa.web.exceptions.ExceptionConstants;
import com.bamsa.web.exceptions.UserLoginException;
import com.bamsa.web.model.AssetTicketModel;
import com.bamsa.web.model.CandidateInfoModel;

import com.bamsa.web.model.ClockTimeModel;
import com.bamsa.web.model.CompanyAccessoryModel;
import com.bamsa.web.model.CompanyAssetModel;
import com.bamsa.web.model.CompanyComponentModel;
import com.bamsa.web.model.CompanyConsumableModel;
import com.bamsa.web.model.CompanyLicenseModel;
import com.bamsa.web.model.ContactModel;
import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.EmployeeTaskModel;
import com.bamsa.web.model.GrievanceDetailsModel;
import com.bamsa.web.model.NewBranchModel;
import com.bamsa.web.model.NewProjectModel;
import com.bamsa.web.model.OpeningInfoModel;
import com.bamsa.web.model.TaskDetailsModel;
import com.bamsa.web.model.EmployeeModel;
import com.bamsa.web.model.UserBean;
import com.bamsa.web.builder.AssetsBuilder;
import com.bamsa.web.builder.CandidateInfoBuilder;
import com.bamsa.web.builder.ClockTimeBuilder;
import com.bamsa.web.builder.ContactBuilder;
import com.bamsa.web.builder.EmployeeTaskBuilder;
import com.bamsa.web.builder.GrievanceBuilder;
import com.bamsa.web.builder.LoginBuilder;
import com.bamsa.web.builder.OpeningInfoBuilder;
import com.bamsa.web.builder.UserBuilder;
import com.bamsa.db.facade.impl.UserFunctionsFacade;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserFunctionsFacade userFunctionsFacade;
	@Autowired
	private LoginBuilder loginBuilder;
	@Autowired
	private ClockTimeBuilder clockTimeBuilder;
	@Autowired
	private UserBuilder userBuilder;
	@Autowired
	private EmployeeDetailsModel emplyoyeedetails;
	@Autowired
	private EmployeeTaskBuilder employeeTaskBuilder;
	@Autowired
	private TaskDetailsModel taskDetailsModel;
	@Autowired
	private GrievanceBuilder grievancebuilder;
	@Autowired
	private AssetsBuilder assetsBuilder;
    @Autowired
    private CandidateInfoBuilder candidateinfoBuilder;
    @Autowired
    private ContactBuilder contactBuilder;
    @Autowired
    private OpeningInfoBuilder openingInfoBuilder;
    
	private static Logger logger = Logger.getLogger(UserServiceImpl.class);
	@Override
	public UserBean authenticateUser(UserBean userBean) throws UserLoginException {
		logger.info("Enter into authenticateUser");
		User user = loginBuilder.buildUser(userBean);
		user = userFunctionsFacade.authenticateUser(user);
		userBean = loginBuilder.buildUserBean(user);

		if(user == null){
			throw new UserLoginException(ExceptionConstants.INVALID_USER_LOGIN, ExceptionConstants.INVALID_USER_LOGIN_CODE);
		}
		logger.info("Exit from authenticateUser");
		return userBean;
	}
	@Override
	public ClockTimeModel saveClockInDetails(ClockTimeModel clockInDetails){
		logger.info("Enter into saveClockInDetails");
		ClockTimeBean clockInBean = clockTimeBuilder.buildClockIntimeBean(clockInDetails);
		clockInBean = userFunctionsFacade.saveClockInDetails(clockInBean);
		ClockTimeModel clockInTimeDetais = clockTimeBuilder.buildClockIntimeModel(clockInBean);
		logger.info("Exit from saveClockInDetails");
		return clockInTimeDetais;

	}
	@Override
	public List<ClockTimeModel> getClockDetials(int uid){
		logger.info("Enter into getClockDetials");
		List<ClockTimeBean> beans = userFunctionsFacade.getClockDetails(uid);
		List<ClockTimeModel> modelbeans = new ArrayList<ClockTimeModel>();
		if(null!=beans && beans.size()>0){			
			for (ClockTimeBean bean :beans){
				ClockTimeModel model = new ClockTimeModel();
				model.setUid(bean.getUid());
				model.setClockInipAddress(bean.getClockInipAddress());
				model.setClockInDay(bean.getClockInDay());
				model.setClockOutipAddress(bean.getClockOutipAddress());
				model.setClockOutDay(bean.getClockOutDay());
				model.setEmpid(bean.getEmpid());

				modelbeans.add(model);
			}
			logger.info(modelbeans);
		}
		logger.info("exit from getClockDetials");
		return modelbeans;

	}
	@Override
	public ClockTimeModel saveClockOutDetails(ClockTimeModel clockOutDetails)throws DBUpdateException{
		logger.info("enter into buildClockOuttimeBean");
		ClockTimeBean clockOutBean = clockTimeBuilder.buildClockOuttimeBean(clockOutDetails);
		clockOutBean = userFunctionsFacade.saveClockOutDetails(clockOutBean);
		ClockTimeModel clockOutTimeDetais = clockTimeBuilder.buildClockOuttimeModel(clockOutBean);
		logger.info(clockOutTimeDetais);
		logger.info("exit from buildClockOuttimeBean");
		return clockOutTimeDetais;

	}
	@Override
	public EmployeeDetailsModel registerEmployee(EmployeeDetailsModel regDetails,HttpServletRequest request){
		logger.info("Enter into registerEmployee");

		User user = userBuilder.buildUser(regDetails, request);
		EmployeeDetails details = userBuilder.buildEmployeeDetails(regDetails);
		EmployeeMappings mappings = userBuilder.buildEmployeeMappings(regDetails);
		user.setEmployeeDetails(details);
		user.setEmployeeMappings(mappings);
		details = userFunctionsFacade.registerUser(user);
		logger.info(details);
		regDetails =userBuilder.buildUserRegDetails(details);
		logger.info("exit from registerEmployee");

		return regDetails;

	}
	@Override
	public List<EmployeeDetailsModel> getEmployees(){
		logger.info("enter into getEmployees");
		List<EmployeeDetails> beans=userFunctionsFacade.getEmployees();
		List<EmployeeDetailsModel> modelbeans=new ArrayList<EmployeeDetailsModel>();
		if(null!=beans && beans.size()>0){
			for(EmployeeDetails bean :beans){
				EmployeeDetailsModel model= new EmployeeDetailsModel();
				model.setUid(bean.getUid());
				model.setName(bean.getName());
				model.setEmpId(bean.getEmpId());
				modelbeans.add(model);

			}
		}
		logger.info(modelbeans);
		logger.info("exit from getEmployees");
		return modelbeans;
	}

	@Override
	public EmployeeDetailsModel getEmployeeDetails(int uid){
		logger.info("enter into getEmployeeDetails" );
		EmployeeDetails beans = userFunctionsFacade.getEmployeeDetails(uid);

		EmployeeDetailsModel model = new EmployeeDetailsModel();
		if(null!=beans ){			


			model.setName(beans.getName());
			model.setMobileNo(beans.getMobileNo());
			model.setDob(beans.getDob());
			model.setEmergencyMobileNo(beans.getEmergencyMobileNo());
			model.setEmail(beans.getEmail());
			model.setPicture(beans.getPicture());
			model.setGender(beans.getGender());


		}
		logger.info(model);
		logger.info("exit from getEmployeeDetails");
		return model;

	}
	@Override
	public EmployeeDetailsModel updateEmployeeDetails(EmployeeDetailsModel updatedDetails) throws DBUpdateException {
		logger.info("enter into userserviceimpl updateEmployeeDetails");
		EmployeeDetails details = userBuilder.buildEmployeeDetails(updatedDetails);
		details = userFunctionsFacade.upateEmployeeDetails(details);
		updatedDetails =userBuilder.buildUpdateUserDetails(details);
		logger.info("exit from userserviceimpl updateEmployeeDetails");
		return updatedDetails;
	}
	@Override
	public List<EmployeeModel> getEmployeesUnderUser(int uid){
		logger.info("Enter into getEmployeesUnderUser");
		List<Employee> employees = userFunctionsFacade.getEmployeesUnderUser(uid);
		List<EmployeeModel> allEmployees = new ArrayList<EmployeeModel>();
		if(null!=employees && employees.size()>0){
			for (Employee bean : employees){
				EmployeeModel model =new EmployeeModel();
				model.setEmpId(bean.getEmpId());
				model.setUid(bean.getUid());
				model.setName(bean.getName());
				model.setDesigid(bean.getDesigid());
				model.setStreamid(bean.getStreamid());
				model.setBranchname(bean.getBranchname());
				allEmployees.add(model);
			}

		}
		logger.info(allEmployees);
		logger.info("exit from userserviceimpl getEmployeesUnderUser");
		return allEmployees;


	}
	@Override
	public List<EmployeeDetailsModel> presentEmployeeDetails()
	{
		logger.info("Enter into presentEmployeeDetails");
		List<EmployeeDetails> beans=userFunctionsFacade.presentEmployeeDetails();
		List<EmployeeDetailsModel> modelbeans=new ArrayList<EmployeeDetailsModel>();
		if(null!=beans && beans.size()>0){
			for(EmployeeDetails bean :beans){
				EmployeeDetailsModel model= new EmployeeDetailsModel();
				model.setUid(bean.getUid());
				model.setEmpId(bean.getEmpId());
				model.setName(bean.getName());
				modelbeans.add(model);
			}
		}
		logger.info(modelbeans);
		logger.info("exit from userserviceimpl presentEmployeeDetails");
		return modelbeans;
	}	

	@Override
	public List<EmployeeDetailsModel> getAllEmployees()
	{

		logger.info("Enter into getAllEmployees");
		List<EmployeeDetails> beans=userFunctionsFacade.getAllEmployees();
		List<EmployeeDetailsModel> modelbeans= new ArrayList<EmployeeDetailsModel>();
		if(null!=beans && beans.size()>0){
			for(EmployeeDetails bean :beans){
				EmployeeDetailsModel model= new EmployeeDetailsModel();
				model.setUid(bean.getUid());
				model.setEmpId(bean.getEmpId());;
				model.setName(bean.getName());
				modelbeans.add(model);
			}
		}	
		logger.info("exit from userserviceimpl getAllEmployees");
		return modelbeans;
	}
	@Override
	public List<EmployeeTaskModel> getEmployeetask(int uid) {
		logger.info("Enter into getEmployeetask");
		List<EmployeeTask> employees = userFunctionsFacade.getEmployeetask(uid);
		List<EmployeeTaskModel> allEmployees = new ArrayList<EmployeeTaskModel>();
		if(null!=employees && employees.size()>0){
			for (EmployeeTask bean : employees){
				EmployeeTaskModel model =new EmployeeTaskModel();
				model.setTid(bean.getTid());
				model.setEmpid(bean.getEmpid());
				model.setGivenbyname(bean.getGivenbyname());
				model.setProjectname(bean.getProjectname());
				model.setTaskdescription(bean.getTaskdescription());
				model.setTasktype(bean.getTasktype());
				model.setDeadline(bean.getDeadline());
				model.setGivendate(bean.getGivendate());
				model.setStatus(bean.getStatus());
				model.setReason(bean.getReason());
				allEmployees.add(model);
			}

		}
		logger.info(allEmployees);
		logger.info("exit from userserviceimpl getEmployeetask");
		return allEmployees;



	}
	@Override
	public EmployeeTaskModel saveEmployeeTask(EmployeeTaskModel employeeTaskDetails) {
		EmployeeTask employeeTask = employeeTaskBuilder.buildEmployeetask(employeeTaskDetails);
		employeeTask = userFunctionsFacade.saveEmployeeTask(employeeTask);
		EmployeeTaskModel employeeTaskDet = employeeTaskBuilder.buildEmployeetaskModel(employeeTask);
		return employeeTaskDet;

	}
	@Override
	public List<TaskDetailsModel> getTaskDetails(int uid) {
		logger.info("Enter into getTaskDetails");
		List<TaskDetails> tasks = userFunctionsFacade.getTaskDetails(uid);
		List<TaskDetailsModel> alltasks =new ArrayList<TaskDetailsModel>();
		if(null!=tasks && tasks.size()>0){
			for (TaskDetails bean : tasks){
				TaskDetailsModel model = new TaskDetailsModel();
				model.setTid(bean.getTid());
				model.setEmpid(bean.getEmpid());
				model.setProjectname(bean.getProjectname());
				model.setTaskDescription(bean.getTaskDescription());
				model.setTasktype(bean.getTasktype());
				model.setDeadline(bean.getDeadline());
				model.setGivendate(bean.getGivendate());
				model.setStatus(bean.getStatus());
				model.setPercentagecompleted(bean.getPercentagecompleted());
				model.setBacklogs(bean.getBacklogs());
				model.setQueries(bean.getQueries());

				alltasks.add(model);


			}


		}
		logger.info(alltasks);
		logger.info("exit from userserviceimpl getTaskDetails");
		return alltasks;
	}
	@Override
	public TaskDetailsModel updateTaskDetails(TaskDetailsModel updatedDetails)throws DBUpdateException
	{
		logger.info("enter into updateTaskDetails ");
		TaskDetails details =employeeTaskBuilder.buildUpdateTaksDetails(updatedDetails);
		try {
			details =userFunctionsFacade.updateTaskDetails(details);
		} catch (DBUpdateException e) {

			e.printStackTrace();
		}
		logger.info("exit from updatetaskdetails");
		return updatedDetails;

	}
	@Override
	public float updatePercentage(int tid,float percentage,String status,String reason) throws DBUpdateException{
		percentage = userFunctionsFacade.updatePercentage(tid,percentage,status,reason);
		return percentage;
	}
	@Override
	public EmployeeDetailsModel getEmplDetails(int uid) {
		EmployeeDetails bean =userFunctionsFacade.getEmplDetails(uid);
		EmployeeDetailsModel model= new EmployeeDetailsModel();

		if(null!=bean ){


			model.setEmpId(bean.getEmpId());
			model.setName(bean.getName());
			model.setDob(bean.getDob());
			model.setDoj(bean.getDoj());
			model.setMobileNo(bean.getMobileNo());
			model.setEmergencyMobileNo(bean.getEmergencyMobileNo());
			model.setEmail(bean.getEmail());
			model.setGender(bean.getGender());
			model.setSalary(bean.getSalary());
			model.setInTime(bean.getInTime());
			model.setOutTime(bean.getOutTime());
			model.setStreamId(bean.getStreamId());
			model.setHierarchyId(bean.getHierarchyId());
			model.setDesigId(bean.getDesigId());
			model.setBranchname(bean.getBranchname());


		}
		return model;

	}
	@Override
	public List<TaskDetailsModel> getEmpMilestones() {
		logger.info("enter from getEmpMilestones");
		List<TaskDetails> projdetails = userFunctionsFacade.getEmpMilestones();
		List<TaskDetailsModel> allprojdetails =new ArrayList<TaskDetailsModel>();
		if(null!=projdetails && projdetails.size()>0){
			for(TaskDetails bean : projdetails){

				TaskDetailsModel model = new TaskDetailsModel();

				List<TaskDetailsModel> team = getEmployeesUnderProject(bean.getNpid());
				float pc=0.0f;
				int n=0;
				if(team.size()> 0){
					for(TaskDetailsModel mod:team){

						if(Character.toString(mod.getTasktype()).equals("P")){
							n++;
							pc=pc+mod.getPercentagecompleted();
						}
					}
				}
				HashMap<String,TaskDetailsModel> uniqueset= new HashMap<String,TaskDetailsModel>();
				if(team.size()> 0){
					for(TaskDetailsModel beans :team){

						uniqueset.put(beans.getEmpid(),beans);
					}
				}
				List<TaskDetailsModel> finallist = new ArrayList<TaskDetailsModel>(uniqueset.values());

				logger.info(uniqueset);
				logger.info(finallist);
				model.setPercentagecompleted(pc/n);
				model.setNpid(bean.getNpid());	
				model.setProjectname(bean.getProjectname());
				model.setDeadline(bean.getDeadline());
				model.setTaskDescription(bean.getTaskDescription());
				model.setTeam(finallist);
				StringBuilder sb = new StringBuilder();
				sb.append("data:image/jpeg;base64,");
				sb.append(Base64Utils.encodeToString(bean.getPicture()));
				model.setProjectpic(sb.toString());

				allprojdetails.add(model);

			}


		}
		logger.info(allprojdetails);
		logger.info("exit from getEmpMilestones");
		return allprojdetails;
	}
	@Override
	public String resetPassword(UserBean user) throws  DBUpdateException{
		logger.info("Enter into resetPassword");

		User userdb = loginBuilder.buildResetUser(user);
		String rpassword=userFunctionsFacade.resetPassword(userdb);
		user = loginBuilder.buildUserBean(userdb);
		logger.info("Exit from resetPassword");
		return rpassword;
	}
	@Override
	public GrievanceDetailsModel registergrievance(GrievanceDetailsModel reggrievance,HttpServletRequest request ){
		logger.info("enter into service registergrievance");
		logger.info(reggrievance);
		GrievanceDetails grievancedt = grievancebuilder.buildGrievanceDetails(reggrievance);
		logger.info(grievancedt);
		grievancedt= userFunctionsFacade.registerGrievance(grievancedt);
		reggrievance= grievancebuilder.buildGrievanceDetailsModel(grievancedt);
		logger.info(reggrievance);
		logger.info("exit from service registergrievance");    

		return reggrievance;
	}

	@Override
	public List<GrievanceDetailsModel> getAllGrievances()
	{

		logger.info("Enter into getAllGrievances");
		List<GrievanceDetails> beans=userFunctionsFacade.getAllGrievances();
		List<GrievanceDetailsModel> modelbeans= new ArrayList<GrievanceDetailsModel>();
		if(null!=beans && beans.size()>0){
			for(GrievanceDetails bean :beans){
				GrievanceDetailsModel model= new GrievanceDetailsModel();
				model.setGid(bean.getGid());
				model.setUid(bean.getUid());
				model.setGrievancedetails(bean.getGrievancedetails());
				model.setGrievancesevere(bean.getGrievancesevere());
				model.setGrievancetype(bean.getGrievancetype());
				model.setMobileNo(bean.getMobileNo());
				model.setEmpId(bean.getEmpId());
				model.setName(bean.getName());
				model.setStatus(bean.getStatus());
				model.setEmpmobileno(bean.getEmpmobileno());
				modelbeans.add(model);
			}
		}
		logger.info(modelbeans);
		logger.info("exit from userserviceimpl getAllGrievances");
		return modelbeans;
	}
	@Override
	public List<EmployeeTaskModel> getEmployeeTasksPerformance(String empid,int npid)
	{
		List<TaskDetails> details =userFunctionsFacade.getEmployeeTasksPerformance(empid,npid);
		List<EmployeeTaskModel> modelbeans= new ArrayList<EmployeeTaskModel>();
		if(null!=details && details.size()>0){
			for(TaskDetails bean :details){
				EmployeeTaskModel model= new EmployeeTaskModel();
				model.setPercentagecompleted(bean.getPercentagecompleted());
				model.setTasktype(bean.getTasktype());
				model.setTaskdescription(bean.getTaskDescription());
				model.setGivendate(bean.getGivendate());
				model.setReason(bean.getReason());
				model.setBacklogs(bean.getBacklogs());
				model.setQueries(bean.getQueries());
				model.setEmpid(bean.getEmpid());
				model.setProjectname(bean.getProjectname());
				
				modelbeans.add(model);
			}
		}
		logger.info(modelbeans);
		logger.info("exit from userserviceimpl getEmployeeTasksPerformance ");
		return modelbeans;
	}
	@Override
	public List<EmployeeModel> getEmployeesDepartmentDetails()
	{    logger.info("enter into getEmployeesDepartmentDetails ");
	List<EmployeeDetails> beans = userFunctionsFacade.getEmployeesDepartmentDetails();
	List<EmployeeModel>  modelbeans = new ArrayList<EmployeeModel>();
	if(null!=beans && beans.size()>0){
		for(EmployeeDetails bean :beans){
			EmployeeModel model= new EmployeeModel();
			model.setEmpId(bean.getEmpId());
			model.setName(bean.getName());
			model.setStreamid(bean.getStreamId());
			model.setDesigid(bean.getDesigId());
			model.setHierarchyId(bean.getHierarchyId());
			modelbeans.add(model);
		}
	}
	logger.info(modelbeans);
	logger.info("exit from userserviceimpl getEmployeesDepartmentDetails ");
	return modelbeans;
	}
	@Override
	public CompanyAssetModel registerAsset(CompanyAssetModel model){
		logger.info("enter into registerAsset");
		CompanyAssetsBean bean = assetsBuilder.buildCompanyAssetBean(model);
		logger.info(bean);
		bean = userFunctionsFacade.registerAsset(bean);
		logger.info(bean);
		model=assetsBuilder.buildCompanyAssetModel(bean);
		logger.info("exit from registerAsset");
		logger.info(model);
		return model;
	}
	@Override
	public CompanyLicenseModel registerLicense(CompanyLicenseModel model) {
		logger.info("enter into createLicense");
		CompanyLicensesBean bean =assetsBuilder.buildCompanyLicensesBean(model);
		bean=userFunctionsFacade.registerLicense(bean);
		logger.info(bean);
		model=assetsBuilder.buildCompanyLicenseModel(bean);
		logger.info("exit from createLicense");
		logger.info(model);

		return model;
	}
	@Override
	public CompanyConsumableModel registerConsumable(CompanyConsumableModel model) {
		logger.info("enter into registerConsumable");
		CompanyConsumableBean bean=assetsBuilder.buildCompanyConsumableBean(model);
		bean=userFunctionsFacade.registerConsumable(bean);
		logger.info(bean);
		model=assetsBuilder.buildCompanyConsumableModel(bean);
		logger.info("exit from registerConsumable");
		logger.info(model);
		return model;
	}
	@Override
	public CompanyAccessoryModel registerAccessoryDetails(CompanyAccessoryModel model){
		logger.info("enter into registerAccessoryDetails");
		CompanyAccessoryBean bean =assetsBuilder.buildCompanyAccessoryBean(model);
		bean = userFunctionsFacade.registerAccessory(bean);
		logger.info(bean);
		model=assetsBuilder.buildCompanyAccessoryModel(bean);
		logger.info("exit from registerAccessoryDetails");
		return model;


	}
	@Override
	public CompanyComponentModel registerComponentDetails(CompanyComponentModel model){
		logger.info("enter into registerComponentDetails");
		CompanyComponentBean bean = assetsBuilder.buildCompanyComponentBean(model);
		bean=userFunctionsFacade.registerComponent(bean);
		model=assetsBuilder.buildCompanyComponentModel(bean);
		logger.info("exit from registerComponentDetails");
		return model;
	}

	@Override
	public List<EmployeeModel> getEmployeesReportingDetails()
	{    logger.info("enter into getEmployeesReportingDetails ");
	List<EmployeeDetails> beans = userFunctionsFacade.getEmployeesReportingDetails();
	List<EmployeeModel>  modelbeans = new ArrayList<EmployeeModel>();
	if(null!=beans && beans.size()>0){
		for(EmployeeDetails bean :beans){
			EmployeeModel model= new EmployeeModel();
			model.setEmpId(bean.getEmpId());
			model.setUid(bean.getUid());
			modelbeans.add(model);
		}
	}
	logger.info(modelbeans);
	logger.info("exit from userserviceimpl getEmployeesReportingDetails");
	return modelbeans;
	}
	@Override
	public List<CompanyLicenseModel> getCompanyLicensesDetails()
	{
		logger.info("enter into getCompanyLicensesDetails");
		List<CompanyLicensesBean> beans = userFunctionsFacade.getCompanyLicensesDetails();
		List<CompanyLicenseModel> modelbeans= new ArrayList<CompanyLicenseModel>();
		if(null!=beans && beans.size()>0){
			for(CompanyLicensesBean bean :beans){
				CompanyLicenseModel model= new CompanyLicenseModel();
				model.setClid(bean.getClid());
				model.setLicenseTag(bean.getLicenseTag());
				model.setBranchname(bean.getBranchname());
				model.setSoftwareName(bean.getSoftwareName());
				model.setSeats(bean.getSeats());
				model.setManufacturer(bean.getManufacturer());
				model.setLicensedTo(bean.getLicensedTo());
				model.setLicensedMail(bean.getLicensedMail());
				model.setCreatedBy(bean.getCreatedBy());
				model.setProductKey(bean.getProductKey());
				model.setPurchaseCost(bean.getPurchaseCost());
				model.setOrderNo(bean.getOrderNo());
				model.setPurchasedDate(bean.getPurchasedDate());
				model.setExpirationDate(bean.getExpirationDate());
				model.setNotes(bean.getNotes());
				model.setCreatedDate(bean.getCreatedDate());
				model.setEmpid(bean.getEmpid());
				modelbeans.add(model);
			}

		}

		logger.info(modelbeans);
		logger.info("exit from userserviceimpl getCompanyLicensesDetails");
		return modelbeans;

	}

	@Override
	public List<CompanyConsumableModel> getCompanyConsumableDetails()
	{
		logger.info("enter into getCompanyConsumableDetails");
		List<CompanyConsumableBean> beans = userFunctionsFacade.getCompanyConsumableDetails();
		List<CompanyConsumableModel> modelbeans= new ArrayList<CompanyConsumableModel>();
		if(null!=beans && beans.size()>0){
			for(CompanyConsumableBean bean :beans){
				CompanyConsumableModel model= new CompanyConsumableModel();
				model.setCcid(bean.getCcid());
				model.setConsumableTag(bean.getConsumableTag());
				model.setConsumableName(bean.getConsumableName());
				model.setBranchname(bean.getBranchname());
				model.setBranchname(bean.getBranchname());
				model.setCategory(bean.getCategory());
				model.setCreatedBy(bean.getCreatedBy());
				model.setCreatedDate(bean.getCreatedDate());
				model.setItemNo(bean.getItemNo());
				model.setManufacturer(bean.getManufacturer());
				model.setModelNo(bean.getModelNo());
				model.setOrderNo(bean.getOrderNo());
				model.setPurchaseCost(bean.getPurchaseCost());
				model.setPurchasedDate(bean.getPurchasedDate());
				model.setQuantity(bean.getQuantity());
				model.setEmpid(bean.getEmpid());
				modelbeans.add(model);
			}
		}	
		logger.info(modelbeans);
		logger.info("exit from getCompanyConsumableDetails");
		return modelbeans;
	}
	@Override
	public List<CompanyAssetModel> getCompanyAsset() {
		logger.info("enter into getCompanyAsset");
		List<CompanyAssetsBean> bean=userFunctionsFacade.getCompanyAsset();
		List<CompanyAssetModel> modelbeans=new ArrayList<CompanyAssetModel>();
		if(null!=bean && bean.size()>0){
			for(CompanyAssetsBean beans:bean){
				CompanyAssetModel model=new CompanyAssetModel();
				model.setCaid(beans.getCaid());
				model.setAssetName(beans.getAssetName());
				model.setAssetSerial(beans.getAssetSerial());
				model.setAssetStatus(beans.getAssetStatus());
				model.setBranchname(beans.getBranchname());
				model.setAssetTag(beans.getAssetTag());
				model.setCreatedBy(beans.getCreatedBy());
				model.setCreatedDate(beans.getCreatedDate());
				model.setModel(beans.getModel());
				model.setNotes(beans.getNotes());
				model.setOrderNo(beans.getOrderNo());
				model.setPurchaseCost(beans.getPurchaseCost());
				model.setPurchasedDate(beans.getPurchasedDate());
				model.setSupplier(beans.getSupplier());
				StringBuilder sb = new StringBuilder();
				sb.append("data:image/jpeg;base64,");
				sb.append(Base64Utils.encodeToString(beans.getAssetImage()));
				model.setAssetPic(sb.toString());
				model.setEmpid(beans.getEmpid());
				modelbeans.add(model);
			}

		}
		logger.info(modelbeans);
		logger.info("exit from getCompanyAsset ");
		return modelbeans;
	}
	@Override
	public List<CompanyAccessoryModel> getCompanyAccessory() {
		logger.info("enter into getCompanyAccessory");
		List<CompanyAccessoryBean> bean=userFunctionsFacade.getCompanyAccessory();
		List<CompanyAccessoryModel> modelbeans=new ArrayList<CompanyAccessoryModel>();
		if(null!=bean && bean.size()>0){
			for(CompanyAccessoryBean beans:bean){
				CompanyAccessoryModel model=new CompanyAccessoryModel();
				model.setAccessoryname(beans.getAccessoryname());
				model.setAccessorytag(beans.getAccessorytag());
				model.setBranchname(beans.getBranchname());
				model.setCategory(beans.getCategory());
				model.setCreatedDate(beans.getCreatedDate());
				model.setManufacturer(beans.getManufacturer());
				model.setModelno(beans.getModelno());
				model.setOrderno(beans.getOrderno());
				model.setPurchasecost(beans.getPurchasecost());
				model.setPurchaseDate(beans.getPurchaseDate());
				model.setQuantity(beans.getQuantity());
				model.setUserid(beans.getUserid());
				model.setCaid(beans.getCaid());
				model.setEmpid(beans.getEmpid());
				modelbeans.add(model);
			}
		}
		logger.info(modelbeans);
		logger.info("exit from getCompanyAccessory");
		return modelbeans;
	}
	@Override
	public List<CompanyComponentModel> getCompanyComponent() {
		logger.info("enter into getCompanyComponent");
		List<CompanyComponentBean> bean=userFunctionsFacade.getCompanyComponent();
		List<CompanyComponentModel> modelbeans=new ArrayList<CompanyComponentModel>();
		if(null!=bean && bean.size()>0){
			for(CompanyComponentBean beans:bean){
				CompanyComponentModel model=new CompanyComponentModel();
				model.setCategory(beans.getCategory());
				model.setCcmid(beans.getCcmid());
				model.setComponentName(beans.getComponentName());
				model.setBranchname(beans.getBranchname());
				model.setCreatedDate(beans.getCreatedDate());
				model.setOrderNo(beans.getOrderNo());
				model.setPurchaseCost(beans.getPurchaseCost());
				model.setPurchasedDate(beans.getPurchasedDate());
				model.setSerialNo(beans.getSerialNo());
				model.setUserid(beans.getUserid());
				model.setComponenttag(beans.getComponenttag());
				model.setEmpid(beans.getEmpid());
				modelbeans.add(model);
			}
		}

		logger.info(modelbeans);
		logger.info("exit from getCompanyComponent");
		return modelbeans;
	}@Override
	public AssetTicketModel registerAssetTicket(AssetTicketModel model)
	{     logger.info("enter into registerAssetTicket");
	AssetTicketBean bean =assetsBuilder.buildAssetTicketBeanDetails(model);
	bean=userFunctionsFacade.registerTicket(bean);
	logger.info(bean);
	model = assetsBuilder.buildAssetTicketModelDetails(bean);
	logger.info(model);
	logger.info("exit from registerAssetTicket");
	return model;
	}
	@Override
	public List<AssetTicketModel> getAssetTicket() {
		logger.info("enter into getAssetTicket");
		List<AssetTicketBean> bean=userFunctionsFacade.getAssetTicket();
		List<AssetTicketModel> modelbeans=new ArrayList<AssetTicketModel>();
		if(null!=bean &&bean.size()>0){
			for(AssetTicketBean beans:bean){
				AssetTicketModel model=new AssetTicketModel();
				model.setAtid(beans.getAtid());
				model.setApprovedby(beans.getApprovedby());
				model.setApproveddate(beans.getApproveddate());
				model.setAssettype(beans.getAssettype());
				model.setBstatus(beans.getBstatus());
				model.setFromdate(beans.getFromdate());
				model.setPurpose(beans.getPurpose());
				model.setRemarks(beans.getRemarks());
				model.setRequestto(beans.getRequestto());
				model.setRisedby(beans.getRisedby());
				model.setRiseddate(beans.getRiseddate());
				model.setRstatus(beans.getRstatus());
				model.setTag(beans.getTag());
				model.setThstatus(beans.getThstatus());
				model.setTodate(beans.getTodate());
				model.setEmpid(beans.getEmpid());
				modelbeans.add(model);

			}
		}
		logger.info(modelbeans);
		logger.info("exit from getAssetTicket");
		return modelbeans;
	}

	@Override
	public AssetTicketModel updateBstatusOfAssetTicket(AssetTicketModel model)throws DBUpdateException
	{    logger.info("enter into updateBstatusOfAssetTicket");
	AssetTicketBean bean= assetsBuilder.buildUpdateBstatusOfAssetTicketBean(model);
	bean=userFunctionsFacade.updateBstatusOfAssetTicket(bean);
	model= assetsBuilder.buildUpdateBstatusOfAssetTicketModel(bean);
	logger.info(model);
	logger.info("exit from updateBstatusOfAssetTicket");
	return model;

	}
	@Override
	public AssetTicketModel updateRstatusOfAssetTicket(AssetTicketModel model)throws DBUpdateException
	{    logger.info("enter into updateRstatusOfAssetTicket");
	AssetTicketBean bean= assetsBuilder.buildUpdateRstatusOfAssetTicketBean(model);
	bean=userFunctionsFacade.updateRstatusOfAssetTicket(bean);
	model= assetsBuilder.buildUpdateRstatusOfAssetTicketModel(bean);
	logger.info(model);
	logger.info("exit from updateRstatusOfAssetTicket");
	return model;

	}
	@Override
	public AssetTicketModel updateAssetStatus(AssetTicketModel model) throws DBUpdateException {
		logger.info("enter into updateAssetStatus");
		AssetTicketBean bean=assetsBuilder.buildAssetStatusBeanDetails(model);
		bean=userFunctionsFacade.updateAssetStatus(bean);
		model=assetsBuilder.buildAssetStatusModelDetails(bean);
		logger.info("exit from updateAssetStatus");
		return model;
	}

	@Override
	public List<String> getAllEmployeesEmails()
	{
		List<String> allmails=userFunctionsFacade.getAllEmployeesMails();

		return allmails;

	}
	@Override
	public GrievanceDetailsModel updateGrievanceTicketStatus(GrievanceDetailsModel model)throws DBUpdateException{
		logger.info("enter into updateGrievanceTicketStatus");
		GrievanceDetails bean=grievancebuilder.buildUpdateGrievnaceTicketUpdateStatus(model);
		bean=userFunctionsFacade.updateGrievanceTicketStatus(bean);
		model=grievancebuilder.buildUpdateGrievanceTicketUpdateStatus(bean);
		logger.info("exit from updateGrievanceTicketStatus");
		logger.info(model);
		return model;
	}


	@Override
	public EmployeeDetailsModel updateEmployeeReporttoDetails(EmployeeDetailsModel model)throws DBUpdateException
	{
		logger.info("enter into updateEmployeeReporttoDetails");
		EmployeeDetails bean=userBuilder.buildUpdateReporttoDetails(model);
		bean=userFunctionsFacade.updateEmployeeReportToDetails(bean);
		model=userBuilder.buildUpdateReporttoDetails(bean);
		logger.info(model);
		logger.info("exit from updateEmployeeReporttoDetails");
		return model;
	}
	@Override
	public NewProjectModel saveNewproject(NewProjectModel newProject) {
		NewProjectBean bean = employeeTaskBuilder.buildNewProjectDetailsBean(newProject);
		bean=userFunctionsFacade.saveNewProject(bean);
		newProject=employeeTaskBuilder.buildNewProjectDetailsModel(bean);
		logger.info(newProject);
		logger.info("exit from saveNewproject");
		return newProject;
	}

	public List<NewProjectModel> getEmployeeProjectDetails()
	{
		List<NewProjectBean> bean=userFunctionsFacade.getEmployeerojectDetails();
		List<NewProjectModel> modelbeans=new ArrayList<NewProjectModel>();
		if(null!=bean &&bean.size()>0){
			for(NewProjectBean beans:bean){
				NewProjectModel model=new NewProjectModel();
				model.setNpid(beans.getNpid());
				model.setProjectname(beans.getProjectname());
				modelbeans.add(model);
			}
		}
		logger.info(modelbeans);
		logger.info("exit from getAssetTicket");
		return modelbeans;

	}

	@Override
	public List<TaskDetailsModel> getEmployeesUnderProject(int npid)
	{
		List<TaskDetails> beans =userFunctionsFacade.getEmployeesUnderProject(npid);
		List<TaskDetailsModel> modelbeans= new ArrayList<TaskDetailsModel>();
		if(null!=beans &&beans.size()>0){
			for(TaskDetails details:beans){
				TaskDetailsModel model=new TaskDetailsModel();
				model.setTid(details.getTid());
				model.setUid(details.getUid());
				model.setEmpid(details.getEmpid());
				model.setTasktype(details.getTasktype());
				model.setNpid(details.getNpid());
				model.setName(details.getName());
				model.setBranchname(details.getBranchname());
				model.setPercentagecompleted(details.getPercentagecompleted());
				modelbeans.add(model);
			}


		}
		logger.info(modelbeans);
		logger.info("exit from getEmployeesUnderProject");
		return modelbeans;
	}

	@Override
	public List<TaskDetailsModel> getProjectTypeDetails()
	{
		List<TaskDetails> bean=userFunctionsFacade.getProjectTypeDetails();
		List<TaskDetailsModel> modelbeans= new ArrayList<TaskDetailsModel>();
		if(null!=bean &&bean.size()>0){
			for(TaskDetails beans:bean){
				TaskDetailsModel model=new TaskDetailsModel();
				model.setTasktype(beans.getTasktype());
				model.setNpid(beans.getNpid());
				model.setEmpid(beans.getEmpid());
				modelbeans.add(model);

			}
		}

		logger.info(modelbeans);
		logger.info("exit from getProjectTypeDetails");
		return modelbeans;

	}

	@Override
	public NewBranchModel saveBranchDetails(NewBranchModel branch) {
		logger.info("enter into saveBranchDetails");
		NewBranchBean bean = assetsBuilder.buildBranchBeanDetails(branch);
		bean=userFunctionsFacade.saveBranchDetails(bean);
		branch=assetsBuilder.buildBranchModelDetails(bean);
		logger.info(branch);
		logger.info("exit from saveBranchDetails");
		return branch;
	}
	@Override
	public List<String> getBranchNameDetails() {
		List<String> allbranch=userFunctionsFacade.getBranchNameDetails();

		return allbranch;
	}
	@Override
	public CandidateInfoModel saveCandidatedetails(CandidateInfoModel model) {
        logger.info("enter into saveCandidatedetails");
        CandidateInfoBean bean=candidateinfoBuilder.buildCandidateInfoBeandetails(model);
        bean=userFunctionsFacade.saveCandidatedetails(bean);
        model=candidateinfoBuilder.buildCandidateInfoModeldetails(bean);
        logger.info(model);
        logger.info("exit from saveCandidatedetails");
		
		return model;
	}
	@Override
	public List<EmployeeModel> getAssignedtodetails() {
		 logger.info("enter into getAssignedtodetails ");
			List<EmployeeDetails> beans = userFunctionsFacade.getAssignedtodetails();
			List<EmployeeModel>  modelbeans = new ArrayList<EmployeeModel>();
			if(null!=beans && beans.size()>0){
				for(EmployeeDetails bean :beans){
					EmployeeModel model= new EmployeeModel();
					model.setEmpId(bean.getEmpId());
					model.setUid(bean.getUid());
					model.setName(bean.getName());
					modelbeans.add(model);
				}
			}
			logger.info(modelbeans);
			logger.info("exit from userserviceimpl getEmployeesReportingDetails");
			return modelbeans;
			}
	@Override
	public ContactModel saveContactdetails(ContactModel contactdetails) {
		logger.info("enter into saveContactdetails" );
		ContactBean bean=contactBuilder.buildContactdetails(contactdetails);
		bean=userFunctionsFacade.saveContactdetails(bean);
		contactdetails=contactBuilder.buildContactdetailsmodel(bean);
		logger.info(contactdetails);
		logger.info("exit from saveContactdetails");
		return contactdetails;
	}
	@Override
	public OpeningInfoModel saveOpeningdetails(OpeningInfoModel openings) {
		logger.info("enter into saveOpeningdetails");
		OpeningInfoBean bean=openingInfoBuilder.buildOpeningInfoBean(openings);
		bean=userFunctionsFacade.saveOpeningdetails(bean);
		openings=openingInfoBuilder.buildOpeningInfoModel(bean);
		logger.info(openings);
		logger.info("exit from saveOpeningdetails");
		return openings;
	}
	
	@Override
	public List<ContactModel> getAccountDetails()
	{
		logger.info("enter into getAccountdetails");
		List<ContactBean> beans = userFunctionsFacade.getAccountDetails();
		List<ContactModel>  modelbeans = new ArrayList<ContactModel>();
		if(null!=beans && beans.size()>0){
			for(ContactBean bean :beans){
				ContactModel model= new ContactModel();
				model.setAcid(bean.getAcid());
				model.setAccountName(bean.getAccountName());
				model.setAccountOwner(bean.getAccountOwner());
				model.setCategory(bean.getCategory());
				model.setWebsite(bean.getWebsite());
				model.setStatus(bean.getStatus());
				model.setPhoneno(bean.getPhoneno());
				model.setState(bean.getState());
				model.setCity(bean.getCity());
				model.setPrimaryemail(bean.getPrimaryemail());
				model.setDescription(bean.getDescription());
				model.setFirstname(bean.getFirstname());
				model.setLastname(bean.getLastname());
				model.setSecondaryemail(bean.getSecondaryemail());
				model.setReqlist(bean.getReqlist());
				model.setHotlist(bean.getHotlist());
				model.setCreateddate(bean.getCreateddate());
				
				modelbeans.add(model);
				logger.info(modelbeans);
			}
			
		}
		logger.info("exit from getAccountdetails");
		return modelbeans;	
	}
	@Override
	public ContactModel getAccountOwnerdetails(String accountowner) {
		logger.info("enter into getAccountOwnerdetails");
		ContactBean beans=userFunctionsFacade.getAccountOwnerdetails(accountowner);
		ContactModel model= new ContactModel();
		if(null!=beans ){
			model.setAcid(beans.getAcid());
			model.setAccountName(beans.getAccountName());
			model.setWebsite(beans.getWebsite());
			model.setState(beans.getState());
			model.setCity(beans.getCity());
			model.setDescription(beans.getDescription());
			
			logger.info(model);
		}
		return model;
	}
	@Override
	public List<CandidateInfoModel> getHotlistdetails() {
		logger.info("enter into getHotlistdetails");
		List<CandidateInfoBean> beans=userFunctionsFacade.getHotlistdetails();
		List<CandidateInfoModel>  modelbeans = new ArrayList<CandidateInfoModel>();
		if(null!=beans && beans.size()>0){
			for(CandidateInfoBean bean :beans){
				CandidateInfoModel model= new CandidateInfoModel();
				model.setCiid(bean.getCiid());
				model.setFirstName(bean.getFirstName());
				model.setMiddleName(bean.getMiddleName());
				model.setLastName(bean.getLastName());
				model.setEmailid(bean.getEmailid());
				model.setMobile(bean.getMobile());
				model.setState(bean.getState());
				model.setCity(bean.getCity());
				model.setVisaStatus(bean.getVisaStatus());
                 DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
                
                String d=format.format(bean.getAvailableFrom());
                model.setAvdate(d);
				model.setRelocate(bean.getRelocate());
				model.setGender(bean.getGender());
				model.setTypeofConsultant(bean.getTypeofConsultant());
				model.setHotlist(bean.getHotlist());
				model.setSsn(bean.getSsn());
				model.setBillRateType(bean.getBillRateType());
				model.setRate(bean.getRate());
				model.setCoverletter(bean.getCoverletter());
				model.setResume(bean.getResume());
				model.setPrimaryskills(bean.getPrimaryskills());
				model.setCreatedDate(bean.getCreatedDate());
				model.setCreatedby(bean.getCreatedby());
				model.setEmpId(bean.getEmpId());
				modelbeans.add(model);
				logger.info(modelbeans);
			}
			
		}
		logger.info("exit from getHotlistdetails");
		return modelbeans;	
	}
	@Override
	public List<CandidateInfoModel> getCandidateDetails()
	{
		logger.info("enter into getCandidateDetails");
	
		List<CandidateInfoBean> beans=userFunctionsFacade.getCandidateDetails();
		List<CandidateInfoModel> modelbeans= new ArrayList<CandidateInfoModel>();
		if(null!=beans && beans.size()>0){
			for(CandidateInfoBean bean :beans){
				CandidateInfoModel model= new CandidateInfoModel();
				model.setCiid(bean.getCiid());
				model.setFirstName(bean.getFirstName());
				model.setMiddleName(bean.getMiddleName());
				model.setLastName(bean.getLastName());
				model.setEmailid(bean.getEmailid());
				model.setMobile(bean.getMobile());
				model.setState(bean.getState());
				model.setCity(bean.getCity());
				model.setVisaStatus(bean.getVisaStatus());
                 DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
                
                String d=format.format(bean.getAvailableFrom());
                model.setAvdate(d);
				model.setRelocate(bean.getRelocate());
				model.setGender(bean.getGender());
				model.setTypeofConsultant(bean.getTypeofConsultant());
				model.setHotlist(bean.getHotlist());
				model.setSsn(bean.getSsn());
				model.setBillRateType(bean.getBillRateType());
				model.setRate(bean.getRate());
				model.setCoverletter(bean.getCoverletter());
				model.setResume(bean.getResume());
				model.setPrimaryskills(bean.getPrimaryskills());
				model.setCreatedDate(bean.getCreatedDate());
				model.setCreatedby(bean.getCreatedby());
				model.setEmpId(bean.getEmpId());
				modelbeans.add(model);
				logger.info(modelbeans);
				logger.info("exit from getcandidatedetails");
			}
			
		}
		return modelbeans;
		
	}
	
	@Override
	public OpeningInfoModel getOpeningdetails(int rqid) {
		OpeningInfoBean beans =userFunctionsFacade.getOpeningdetails(rqid);
		
		OpeningInfoModel model=new OpeningInfoModel();
		if(null!=beans ){
			model.setPositionid(beans.getPositionid());
			model.setPositiontitle(beans.getPositiontitle());
			model.setState(beans.getState());
			model.setCity(beans.getCity());
			model.setPrimaryskill(beans.getPrimaryskill());
			model.setSecondaryskill(beans.getSecondaryskill());
			model.setDescription(beans.getDescription());
			model.setRate(beans.getRate());
			model.setPrimevendor(beans.getPrimevendor());
			model.setEndclient(beans.getEndclient());
			model.setCreatedby(beans.getCreatedby());
			model.setCreateddate(beans.getCreateddate());
			model.setBilltype(beans.getBilltype());
			model.setContactperson(beans.getContactperson());
			model.setEmpId(beans.getEmpId());
			logger.info(model);
		}
		return model;
	}
	@Override
	public List<OpeningInfoModel> getAllOpeningdetails() {
		logger.info("enter into getAllOpeningdetails");
		List<OpeningInfoBean> beans=userFunctionsFacade.getAllOpeningdetails();
		List<OpeningInfoModel> modelbeans =new ArrayList<OpeningInfoModel>();
		if(null!=beans && beans.size()>0){
			for(OpeningInfoBean bean:beans){
				OpeningInfoModel model=new OpeningInfoModel();
				model.setRqid(bean.getRqid());
				model.setPositionid(bean.getPositionid());
				model.setPositiontitle(bean.getPositiontitle());
				model.setState(bean.getState());
				model.setCity(bean.getCity());
				model.setPrimaryskill(bean.getPrimaryskill());
				model.setSecondaryskill(bean.getSecondaryskill());
				model.setDescription(bean.getDescription());
				model.setRate(bean.getRate());
				model.setPrimevendor(bean.getPrimevendor());
				model.setEndclient(bean.getEndclient());
				model.setCreatedby(bean.getCreatedby());
				model.setCreateddate(bean.getCreateddate());
		        model.setBilltype(bean.getBilltype());
		        model.setEmpId(bean.getEmpId());
		        model.setContactperson(bean.getContactperson());
				modelbeans.add(model);
				logger.info(modelbeans);
			}
			
		}
		logger.info("exit from getAllOpeningdetails");
		return modelbeans;	
	}
	@Override
	public CandidateInfoModel updateCandidateDetails(CandidateInfoModel candidatedetails) throws DBUpdateException {
        logger.info("enter into updateCandidateDetails");
        CandidateInfoBean bean=candidateinfoBuilder.buildCandidateInfoBeandetails(candidatedetails);
        bean=userFunctionsFacade.updateCandidateDetails(bean);
        candidatedetails=candidateinfoBuilder.buildCandidateInfoModeldetails(bean);
        logger.info(candidatedetails);
        logger.info("exit from updateCandidateDetails");
		return candidatedetails;
	}
	@Override
	public OpeningInfoModel updatedOpeningDetails(OpeningInfoModel openingdetails) throws DBUpdateException {
         logger.info("enter into updatedOpeningDetails");
         OpeningInfoBean bean=openingInfoBuilder.buildOpeningInfoBean(openingdetails);
 		bean=userFunctionsFacade.updatedOpeningDetails(bean);
 		openingdetails=openingInfoBuilder.buildOpeningInfoModel(bean);
 		logger.info(openingdetails);
		logger.info("exit from updatedOpeningDetails");
		return openingdetails;
	}
	@Override
	public CandidateInfoModel updateHotlistDetails(CandidateInfoModel hotlistdetails) throws DBUpdateException {
		 logger.info("enter into updateHotlistDetails");
		 CandidateInfoBean bean=candidateinfoBuilder.buildCandidateInfoBeandetails(hotlistdetails);
	        bean=userFunctionsFacade.updateHotlistDetails(bean);
	        hotlistdetails=candidateinfoBuilder.buildCandidateInfoModeldetails(bean);
	        logger.info(hotlistdetails);
	        logger.info("exit from updateCandidateDetails");
			return hotlistdetails;
		}
	@Override
	public List<ContactModel> getSubcontractEmails() {
		logger.info("enter into getSubcontractEmails");
		List<ContactBean> bean=userFunctionsFacade.getSubcontractEmails();
		List<ContactModel> modelbeans= new ArrayList<ContactModel>();
		if(null!=bean &&bean.size()>0){
			for(ContactBean beans:bean){
				ContactModel model=new ContactModel();
				model.setAcid(beans.getAcid());
				model.setPrimaryemail(beans.getPrimaryemail());
				modelbeans.add(model);

			}
		}

		logger.info(modelbeans);
		logger.info("exit from getProjectTypeDetails");
		return modelbeans;

	}
	@Override
	public ContactModel updateContactDetails(ContactModel contactdetails) throws DBUpdateException {
		logger.info("enter into updateContactDetails");
		ContactBean bean=contactBuilder.buildContactdetails(contactdetails);
		bean=userFunctionsFacade.updateContactDetails(bean);
		contactdetails=contactBuilder.buildContactdetailsmodel(bean);
		 logger.info(contactdetails);
		logger.info("exit from updateContactDetails");
		
		return contactdetails;
	}
}