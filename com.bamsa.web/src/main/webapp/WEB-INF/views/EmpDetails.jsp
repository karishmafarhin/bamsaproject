<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.ClockTimeModel"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <title>Edit Details</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<style>
.tabi{
overflow:scroll; 
height:"50px";
}
</style>
<!-- NProgress -->
         <link rel="stylesheet" href='<c:url value="/static/css/dashboardcss/nprogress.css"/>' />
 <body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
             <%
 EmployeeDetailsModel empdetails = (EmployeeDetailsModel)request.getAttribute("EmployeeDetails");
%>
 <script>
   $(document).ready(function() {
		 $("[required]").after("<span class='required'>*</span>");
		});
   </script>
  <script>
 $(document).ready(
           
           /* This is the function that will get executed after the DOM is fully loaded */
           function () {
             $( ".datepickers" ).datepicker({
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
 
 </script>
 
  <%String message= (String)request.getAttribute("message");
  if(message==null)
  {
 	 message="";}
 	 %>
 <%String successmessage= (String)request.getAttribute("successmessage");
  if(successmessage==null)
  {
 	 successmessage="";}
 	 %>

<div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Employee Registration</h3>
              </div>

              <h3 style="text-align: center; color: red"><%=message %></h3>
				<h3 style="text-align: center; color: green"><%=successmessage %></h3>
				
            </div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="height: 663px;">
                
                  <div class="x_content">
				<form:form  action="update" method="post"   name="registration" id="registration" class="register">
				<div class="col-md-12">
				
				 <div class="profile-userpic">
				
				<img src="<%=empdetails.getProfilepic()%>"  alt="" class="img-responsive" alt="" style="margin-left: 300px;">
					
					
				</div>
             <fieldset class="row1">
            
                <legend><b>Personal Details</b>
                </legend>
                <p>
                    <label>Name
                    </label>
						
						
                    <input type="text" class="long" name="name" maxlength="30" id="name" value="<%=empdetails.getName() %>" required/>
                    
                </p>
                <p>
                    <label >Date of Birth &nbsp;
                    </label>
                    <input type="text" class="datepickers long" name="dob" placeholder="mm/dd/yy" value="<%=empdetails.getDateofbirth()%>" required/>
                </p>
                <p>
                    <label>Mobile No. 
                    </label>
                    <input type="text" class="long" id="phone" name="mobno" maxlength="10" pattern="[789][0-9]{9}" value="<%=empdetails.getMobileNo()%>" required/>
                </p>
                <p>
                    <label>Emergency Mobile No.&nbsp; 
                    </label>
                   <input type="text" class="long" id="emgphone" name="emermobno" maxlength="10" pattern="[789][0-9]{9}" value="<%=empdetails.getEmergencyMobileNo()%>" />
                </p>
                <p>
                    <label>Email  
                    </label>																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																														
                    <input  type="email" class="long" name="email" id="email" value="<%=empdetails.getEmail() %>" required/>																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																													
                </p>
               <p>
              
                   
                    <label>Gender </label>
                    
                    <input id="gender" name="gender" type="radio"  value="Female" required/>
         			<label style="width: 48px;"> Female</label>   
         			<input id="gender" name="gender" type="radio"  value="Male"  required/>       
                    <label style="width: 34px;">Male</label>
                    
                     
                   
                </p>
                
            </fieldset>
            </div>
            <div class="col-md-12">
            <fieldset class="row1">
               <div><button  class="btn btn-primary btn-lg btn3d" type="submit">Submit &raquo;</button></div>
               <input type="hidden" value="0" id="uid" name="uid"/>
            </fieldset>
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

<%
 if(empdetails.getGender()=='F'){
  %>
  <script>
  $( document ).ready(function(){
 		
 			 $("input[name=gender][value='Female']").attr('checked', 'checked');
 			 console.log("hi");
 		 });
 		 

  </script>
  
 <%} else{%>
 <script>
  $( document ).ready(function(){
 		
 			 $("input[name=gender][value='Male']").attr('checked', 'checked');
 			
 		 });
 		 

  </script>
  <%} %>
<!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- validator -->


</body>
</html>