<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.ClockTimeModel"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<% 
UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);


if(userData == null)
{
	response.sendRedirect("/bamsa");	
}
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport"
	content="width=device-width,height=device-height,initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Registration Form</title>

<%
List<EmployeeDetailsModel> details=(List)request.getAttribute("details");

String message =(String)request.getAttribute("message");
if(message==null){
	message="";
}
String successmessage =(String)request.getAttribute("successmessage");
if(successmessage==null){
	successmessage="";
}
List<String> branchnames = (List) request.getAttribute("report");
%>
<!-- NProgress -->
         <link rel="stylesheet" href='<c:url value="/static/css/dashboardcss/nprogress.css"/>' />
    

 </head>
 <body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
           
   <style>
  .ui-timepicker-container {
       overflow: visible !important;
   }   
   </style>
             
             <script>
   $(document).ready(function() {
		 $("[required]").after("<span class='required'>*</span>");
		});
   function myFunction() {
	    var x = document.getElementById("empid");
	    x.value = x.value.toUpperCase();
	}
   </script>
     <script>
 $(document).ready(
           
           /* This is the function that will get executed after the DOM is fully loaded */
           function () {
             $( "#datepickers" ).datepicker({
             	dateFormat: 'dd-mm-yy',
               changeMonth: true,//this option for allowing user to select month
               changeYear: true,//this option for allowing user to select from year range
               yearRange: "-100:+100"
              });
             $( "#datepicker" ).datepicker({
              	dateFormat: 'dd-mm-yy',
                changeMonth: true,//this option for allowing user to select month
                changeYear: true,//this option for allowing user to select from year range
                yearRange: "-100:+100"
               });
             
             $('input.timepicker').timepicker({
                 timeFormat: 'HH:mm',
                          
             });
           }
           
           
           
         );

 $(function () {
	 $('#phone').keydown(function (e) {
	 if (e.shiftKey || e.ctrlKey || e.altKey) {
	 e.preventDefault();
	 } else {
	 var key = e.keyCode;
	 if (!((key == 8) || (key == 46) || (key >= 35 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
	 e.preventDefault();
	 }
	 }
	 });
	 });
 
 
 $(function () {
	 $('#intime').keydown(function (e) {
	 if (e.shiftKey || e.ctrlKey || e.altKey) {
	 e.preventDefault();
	 }else {
		 var key = e.keyCode;
		 if (!((key == 8) || (key == 46) || (key >= 35 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
		 e.preventDefault();
		 }
		 }
	 });
	 });
 $(function () {
	 $('#outtime').keydown(function (e) {
	 if (e.shiftKey || e.ctrlKey || e.altKey) {
	 e.preventDefault();
	 }else {
		 var key = e.keyCode;
		 if (!((key == 8) || (key == 46) || (key >= 35 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
		 e.preventDefault();
		 }
		 }
	 });
	 });
 
 
 
 
 


 
 function submitform(){
	 $("#editid").attr('action', 'editregistration');
	 $("#editid").submit();	

 }
   </script>
  
      <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Registration Form</h3>
              </div>

              <h3 style="text-align: center; color: red"><%=message %></h3>
				<h3 style="text-align: center; color: green"><%=successmessage %></h3>
				<form id="editid" action="">
				<div class="col-md-12">
					<fieldset class="row1">
					<button style="padding: 3px 5px;"
						class="btn btn-info btn-xs btn3d pull-right"
						onclick="submitform()">
						<b>Edit Employee Details</b>
					</button></fieldset>
					</div>
				</form>
            </div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                
                  <div class="x_content">

                  <form:form action="registerEmployee" method="post"
					enctype="multipart/form-data" name="registration" id="registration"
					class="register">

					<div class="col-md-12">
					
						<fieldset class="row1">

							<legend style="color: #408000">
								<b>Personal Details</b>
							</legend>
							<p>
								<label>Name </b></label> <input type="text" class="long"
									name="name" maxlength="30" id="name" required />
							</p>
							<p>
								<label>Employee ID  </label> <input type="text" maxlength="10"
									name="empid" id="empid" class="long" onkeyup="myFunction()" required />
							</p>
							<p>
								<label>Date of Birth  </label> <input type="text" id="datepickers"
									class=" long" name="dob" placeholder="dd-mm-yy"
									required data-readonly />
							</p>
							<p>
								<label>Date of Joining  </label> <input type="text" id="datepicker"
									class=" long" name="doj" placeholder="dd-mm-yy"
									required data-readonly />

							</p>
							<p>
								<label>Mobile No.  </label> <input type="text" class="long"
									id="phone" name="mobno" maxlength="10" pattern="[789][0-9]{9}"
									required />
							</p>
							<p>
								<label>Emergency Mobile No.&nbsp; </label> <input type="text"
									class="long" id="phone" name="emermobno" maxlength="10"
									pattern="[789][0-9]{9}" />
							</p>
							<p>
								<label>Email  </label> <input type="email" class="long"
									name="email" id="email" required />
							</p>

							<p>
								<label class="mfg">Gender  </label> <input id="gender" name="gender"
									type="radio" value="F" required />
									<label style="width: 48px;">
									Female</label>&nbsp;<input id="gender" name="gender" type="radio" value="M"
									required /> <label style="width: 34px;">Male</label>
							</p>



							<p>
								<label>Picture  </label> <input type="file" accept="image/*"
									class="long" name="picture" id="picture" required />
							</p>
						</fieldset>
					</div>



					<div class="col-md-12">
						<fieldset class="row1">

							<legend style="color: #408000">
								<b>Further Information</b>
							</legend>
							<p>
								<label>Reporting To </label> <select id="reportingto"
									name="reportingto" required="required">
									<option value=""><b>Select Reporting To</b>
									</option>
									<%
                        
                        for(EmployeeDetailsModel empmodel:details){
                        %>


									<option value="<%=empmodel.getUid() %>"><b><%=empmodel.getEmpId() %></b>
									</option>
									<%} %>

								</select>


							</p>
							<p>
								<label>Department  </label> <select id="stream" name="stream"
									required="required">
									<option value=""><b>Select Department</b>
									</option>
									<option value="<%=ApplicationConstants.JAVA %>"><b>JAVA</b>
									</option>
									<option value="<%=ApplicationConstants.PHP %>"><b>PHP</b>
									</option>
									<option value="<%=ApplicationConstants.ANDROID %>"><b>Android</b>
									</option>
									<option value="<%=ApplicationConstants.UI%>"><b>UI</b>
									</option>
									<option value="<%=ApplicationConstants.TESTING%>"><b>Testing</b>
									</option>
									<option value="<%=ApplicationConstants.ACCOUNTS %>"><b>Accounts</b></option>
									<option
										value="<%=ApplicationConstants.ADMINISTRATION_OPERATION %>"><b>Administration
											& Operations</b>
									</option>
									<option value="<%=ApplicationConstants.HR_EXECUTIVE %>"><b>HR
											Executive</b></option>
									<option value="<%=ApplicationConstants.BENCHSALES %>"><b>BenchSales</b>
									</option>
									<option value="<%=ApplicationConstants.US_IT %>"><b>Us
											IT </b>
									</option>
									<option
										value="<%=ApplicationConstants.PAYROLL_AND_COMPENSATION %>"><b>Payroll
											& Compensation</b>
									</option>
									<option
										value="<%=ApplicationConstants.TRAINING_AND_DEVELOPMENT %>"><b>Training
											and Development</b>
									</option>
									<option
										value="<%=ApplicationConstants.BUSINESS_DEVELOPMENT_AND_TRAINING %>"><b>Business
											Development & Marketing></b>
									</option>
								</select>


							</p>
							<p>
								<label>Designation  </label> <select id="designation"
									name="designation" required="required">
									<option value="">Select Designation</option>
									<option value="<%=ApplicationConstants.TRAINEE_LEVEL %>">Trainee
										Level</option>
									<option value="<%=ApplicationConstants.ASSOCIATE_LEVEL %>">Associate
										Level</option>
									<option
										value="<%=ApplicationConstants.DEV_OR_ENGINEER_LEVEL %>">Dev/Engineer
										Level</option>
									<option value="<%=ApplicationConstants.SENIOR_LEVEL %>">Senior
										Level</option>
									<option value="<%=ApplicationConstants.TEAM_LEAD %>">Team
										Lead</option>
									<option
										value="<%=ApplicationConstants.TECH_LEAD_OR_PROJECT_LEAD %>">TechLead/Project
										Lead</option>
									<option value="<%=ApplicationConstants.MANAGER %>">Manager
									</option>
									<option value="<%=ApplicationConstants.SENIOR_MANAGER %>">Senior
										Manager</option>
								</select>


							</p>
							<div>
								<p>
									<label>Select Branch </label> <select id="branchname"
										name="bname" required="required">
										<option value="">Select Branch</option>
										<%
				                      for (String m : branchnames) {
					                      %>
										<option value="<%=m%>"><%=m%></option>
										<%
															}
														%>
									</select>
								</p>



								<p>
									<label>Timings  </label> <input type="time"
										class="timepicker tabi" style="padding-right:0px;" value="" id="intime" name="intime"
										placeholder="hh:mm:ss" required />&nbsp;
										<input type="time"
										class="timepicker" value="" id="outtime" style="padding-right:0px;" name="outtime"
										placeholder="hh:mm:ss" required />
								</p>
							</div>
							<p>
								<label>Salary  </label> <input type="text" id="salary"
									name="salary" pattern="^([1-9]{1,2})(\.[0-9]{1,2})?$"
									placeholder="e.g:3.2" required>
							<h5>
								LPA</b>
							</h5>
							</h5>

							</p>
						</fieldset>
					</div>

					<div class="col-md-12">
						<center>
							<fieldset class="row1">
								<div>
									<button class="btn btn-primary btn-lg btn3d" type="submit">Register
										&raquo;</button>
								</div>
								<input type="hidden" value="0" id="uid" name="uid" />
							</fieldset>
						</center>
					</div>
				</form:form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
  </div>
  </div>
     <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- validator -->
 
	
  </body>
</html>
