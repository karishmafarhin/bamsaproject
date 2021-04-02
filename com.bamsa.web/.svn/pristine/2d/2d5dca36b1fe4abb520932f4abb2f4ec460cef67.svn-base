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
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0">
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
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
 <jsp:include page="header.jsp" /> 
 <script>
   $(document).ready(function() {
		 $("[required]").after("<span class='required'>*</span>");
		});
   </script>
 <script>
$( document ).ready(function() {
	$("#registration").addClass("act");
	$('#uid').on('change', function() {
        	  var uid =this.value;
       
        		$.ajax({
        			type: "post",
        			url: "/bamsa/registrationedit?uid="+uid,
        					
        			success:function(empdetails){
        				console.log(empdetails);
        				$("#hid").val(empdetails.hierarchyId);
        				$("#stream").val(empdetails.streamId);
        				$("#designation").val(empdetails.desigId);
        				$("#branchname").val(empdetails.branchname);
        				$("#intime").val(empdetails.inTime);
        				$("#outtime").val(empdetails.outTime);	
        				$('#salary').val(empdetails.salary);
        				
						
        								
					},
        			failure:function(){
        				alert("Cannot load details")
        			}  	  
        	});
        })
});

	
</script>
  <script>
 $(document).ready(
           
           /* This is the function that will get executed after the DOM is fully loaded */
           function () {
             $( ".datepickers" ).datepicker({
             	dateFormat: 'dd-mm-yy',
               changeMonth: true,//this option for allowing user to select month
               changeYear: true //this option for allowing user to select from year range
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
 
 
 
 
 

 var ext = $('#picture').val().split('.').pop().toLowerCase();
 if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
     alert('invalid extension!');
 }
   </script>
 
<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Edit Employee Details</h3>
              </div>

              <h3 style="text-align: center; color: red"><%=message %></h3>
				<h3 style="text-align: center; color: green"><%=successmessage %></h3>
				
            </div>
				<div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="height: 663px;">

                
                  <div class="x_content">
				
				<form:form action="reportTo" method="post" name="registration" id="registration" class="register">
				<div class="col-md-12">
             <fieldset class="row1">
             
                <legend style="color:#408000"><b>Edit Details</b>
                </legend>
                	<p>
                    <label>Select Employee ID
                    </label>
                    <select id="uid" name="uid" required="required">
                    <option value="">Select Employee ID
                        </option>
                        <%
                        
                        for(EmployeeDetailsModel empmodel:details){
                        %>
                        
                       
                        <option value="<%=empmodel.getUid() %>"><%=empmodel.getEmpId() %>
                        </option>
                        <%} %>
                        
                        </select>
                    
                   
                </p>
                <p>
                    <label>Change Reporting to ID
                    </label>
                    <select id="hid" name="hid" required="required">
                    <option value="">Select Reporting To
                        </option>
                        <%
                        
                        for(EmployeeDetailsModel empmodel:details){
                        %>
                        
                       
                        <option value="<%=empmodel.getUid() %>"><%=empmodel.getEmpId() %>
                        </option>
                        <%} %>
                        
                        </select>
                    
                   
                </p>
                 <p>
                    <label>Change Department 
                    </label>
                    <select id="stream" name="stream" required="required">
                    	 <option value="">Select Department
                        </option>
                        <option value="<%=ApplicationConstants.JAVA %>">JAVA
                        </option>
                        <option value="<%=ApplicationConstants.PHP %>">PHP
                        </option>
                         <option value="<%=ApplicationConstants.ANDROID %>">Android
                        </option>
                        <option value="<%=ApplicationConstants.UI%>">UI
                        </option>
                         <option value="<%=ApplicationConstants.TESTING%>">Testing
                        </option>
                        <option value="<%=ApplicationConstants.ACCOUNTS %>">Accounts</option>
                        <option value="<%=ApplicationConstants.ADMINISTRATION_OPERATION %>">Administration & Operations
                        </option>
                       <option value="<%=ApplicationConstants.HR_EXECUTIVE %>">HR Excecutive</option>
                     
                         <option value="<%=ApplicationConstants.BENCHSALES %>">BenchSales 
                        </option>
                        <option value="<%=ApplicationConstants.US_IT %>">Us IT 
                        </option>
                         <option value="<%=ApplicationConstants.PAYROLL_AND_COMPENSATION %>">Payroll & Compensation
                        </option>
                         <option value="<%=ApplicationConstants.TRAINING_AND_DEVELOPMENT %>">Training and Development
                        </option>
                         <option value="<%=ApplicationConstants.BUSINESS_DEVELOPMENT_AND_TRAINING %>">Business Development & Marketing
                        </option>
             </select>
                    
                   
                </p>
                <p>
                    <label>Change Designation 
                    </label>
                    <select id="designation" name="designation" required="required">
                    <option value="">Select Designation
                        </option>
                        <option value="<%=ApplicationConstants.TRAINEE_LEVEL %>">Trainee Level
                        </option>
                        <option value="<%=ApplicationConstants.ASSOCIATE_LEVEL %>">Associate Level
                        </option>
                         <option value="<%=ApplicationConstants.DEV_OR_ENGINEER_LEVEL %>">Dev/Engineer Level
                        </option>
                        <option value="<%=ApplicationConstants.SENIOR_LEVEL %>">Senior Level
                        </option>
                         <option value="<%=ApplicationConstants.TEAM_LEAD %>">Team Lead
                        </option>
                        <option value="<%=ApplicationConstants.TECH_LEAD_OR_PROJECT_LEAD %>">TechLead/Project Lead
                        </option>
                        <option value="<%=ApplicationConstants.MANAGER %>">Manager
                        </option>
                        <option value="<%=ApplicationConstants.SENIOR_MANAGER %>">Senior Manager
                        </option>
                        </select>
                   
                   
                </p>
                             <p>
						<label>Change Branch </label> <select id="branchname"
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
                    <label>Change Salary 
                    </label>
                    <input type="text" id="salary" name="salary" pattern="^([1-9]{1,2}){1}(\.[0-9]{1,2})?$" placeholder="e.g:3.2"  required ><h5>LPA</b></h5></h5>
                    
                </p>
                
               
            </fieldset>
            </div>
             
     
            
           
           
          <div class="col-md-12">
           <center> <fieldset class="row1">
               <div><button  class="btn btn-primary btn-lg btn3d" type="submit">Submit &raquo;</button></div>
               <input type="hidden" value="0" id="uid" name="uid"/>
            </fieldset></center>
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