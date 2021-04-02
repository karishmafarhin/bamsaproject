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
<%


String message =(String)request.getAttribute("message");
if(message==null){
	message="";
}
String successmessage =(String)request.getAttribute("successmessage");
if(successmessage==null){
	successmessage="";
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<title>Edit Details</title>

 <link rel="stylesheet" href='<c:url value="/static/css/style.css"/>' />
<link rel="stylesheet" href='<c:url value="/static/css/bootstrap.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/static/font-awesome/css/font-awesome.min.css"/>' />
<link rel="stylesheet" href='<c:url value="/static/css/jquery.timepicker.min.css"/>' />
<link rel="stylesheet" href='<c:url value="/static/css/jquery-ui.css"/>' />
<!-- Loading Scripts -->

<script src='<c:url value="/static/js/bootstrap.min.js"/>'></script>
<script src='<c:url value="/static/js/main.js"/>'></script>
<script src='<c:url value="/static/js/jquery.js"/>'></script> 
 <script src='<c:url value="/static/js/jquery.timepicker.min.js"/>'></script>
<script src='<c:url value="/static/js/jquery-ui.js"/>'></script>
   
<body>

<script>
   $(document).ready(function() {
		 $("[required]").after("<span class='required'>*</span>");
		});
   </script>
 

 
<div class="content-wrapper">
	<div class="container-fluid">
		
            <div class="panel panel-primary panel-table">
              <div class="panel-heading " style="padding:2px 15px;">
                <div class="row">
                  <div >
                     <h1 class="h1class text-center"><b>Create Branch</b></h1>
                  </div>
                   
                </div>
              </div>
              <h3 style="text-align:center;color:red"><%=message %></h3>
				<h3 style="text-align:center;color:green"><%=successmessage %></h3>	
						
				<form:form  action="savebranch" method="post"   name="registration" id="registration" class="register">
				<div class="col-md-12">
				
				 
				
				
					
					
				</div>
             <fieldset class="row1">
            
               
                <p>
                    <label>Branch Name
                    </label>
						
						
                    <input type="text" class="long" name="bname" maxlength="20" placeholder="branch name" id="name" value="" required/>
                    
                </p>
                <p>
                <label>State</label>
                <input type="text" class="long" name ="state" placeholder="State" id ="taskd" required />
                                           
                </fieldset>
           
            <div class="col-md-12">
            <fieldset class="row1">
               <div><center><button  class="btn btn-primary btn-lg btn3d" type="submit">Save &raquo;</button></center></div>
               
            </fieldset>
            </div>
        </form:form>
				 </div>
			</div>
		</div>
		</div>






</body>