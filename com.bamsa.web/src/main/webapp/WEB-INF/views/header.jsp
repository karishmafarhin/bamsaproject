<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Dashboard</title>
    <meta name="description" content="">

    <!-- Bootstrap -->
     <link rel="stylesheet" href='<c:url value="/static/css/dashboardcss/bootstrap.min.css"/>' />
    
    <!-- Font Awesome -->
     <link rel="stylesheet" href='<c:url value="/static/css/dashboardcss/font-awesome.min.css"/>' />
    

    <!-- Custom Theme Style -->
               <link rel="stylesheet" href='<c:url value="/static/css/dashboardcss/custom.min.css"/>' />

    <link rel="stylesheet"
	href='<c:url value="/static/font-awesome/css/font-awesome.min.css"/>' />
<link rel="stylesheet" href='<c:url value="/static/css/jquery.timepicker.min.css"/>' />
<link rel="stylesheet" href='<c:url value="/static/css/jquery-ui.css"/>' />
  </head>
<style>
.act{
border-right: 5px solid #1ABB9C;
background: rgba(255,255,255,.05);

}
.actv{
background: #1ABB9C;
}

</style>

  <% 
UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);


if(userData == null)
{
	response.sendRedirect("/bamsa");	
}

EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

boolean registrationShow=false;
 
 if((empModel!=null) && (empModel.getDesigId() == 0 || empModel.getDesigId() == 8 || empModel.getStreamId()==13) ) {
 	 registrationShow=true;
 }
 
boolean showassigntask=false;

if(empModel!=null && empModel.getDesigId()==0){
	showassigntask=true;
}
boolean showgrievanceform=false;

if( empModel!=null && empModel.getDesigId()==0){
	showgrievanceform=true;
}
 %>
  <% 
 boolean mileStonesShow=false;

 if((empModel!=null) && (empModel.getDesigId() == 0 || empModel.getDesigId() == 8 || empModel.getDesigId() == 7 || empModel.getDesigId() == 5 || empModel.getDesigId() == 6 )) {
	 mileStonesShow=true;
 }
 String uName =(String) request.getSession().getAttribute("uName");

 %>
    <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <p  class="site_title"><i class="fa fa-paw"></i> <span>BAMSA</span></p>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
             
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2><%=uName %></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                 <li id="dashboard"><a href="<%=request.getContextPath( )%>/dashboard" ><i class="fa fa-tachometer"></i>Dashboard</a></li>
			<li id="clockdetails"><a href="<%=request.getContextPath( )%>/clockDetails"><i class="fa fa-clock-o"></i>My Timesheet</a></li>
			
			
			 <% if(empModel!=null && empModel.getDesigId() == 0) {%>
		<li id="mytask"><a href="<%=request.getContextPath( )%>/Newtask"><i class="fa fa-tasks"></i> Tasks</a></li>
		<%}else{ %>
		<li id="mytask"><a href="<%=request.getContextPath( )%>/Mytask"><i class="fa fa-tasks"></i> Tasks</a></li>
			<%} %>
			<li id="employees"><a href="<%=request.getContextPath( )%>/Employees"><i class="fa fa-users"></i>All Users</a></li>
			<li id="calendar" ><a href="<%=request.getContextPath( )%>/calendar"><i class="fa fa-calendar"></i>My Calendar</a></li>
			<%if(showgrievanceform){ %>
			<li id="complainta"><a href="<%=request.getContextPath( )%>/Grievances"><i class="fa fa-question"></i>Grievance Cell</a></li>
			<%}else{ %>
			<li id="complaint"><a href="<%=request.getContextPath( )%>/complaintform"><i class="fa fa-question"></i>Grievance Cell</a></li>
			<%} %>
			<li id="ganttchart"><a href="<%=request.getContextPath( )%>/ganttcharts"><i class="fa fa-area-chart"></i>Gantt charts</a></li>
			
			<li id="assets"><a href="<%=request.getContextPath() %>/showTicket"><i class="fa fa-database"></i>Asset Tracking</a></li>
			 <%if(mileStonesShow){%>
			<li id="milestones"><a href="<%=request.getContextPath( )%>/Milestones"><i class="fa fa-flag-o"></i>My Milestones</a></li>
				<%}%>
				<%if(registrationShow){%>
			<li id="registration"><a href="<%=request.getContextPath( )%>/registration" ><i class="fa fa-pencil-square-o"></i> Registration form</a></li>
	          <%}%>	
                </ul>
              </div>
             
             

            </div>
            <!-- /sidebar menu -->

          
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <%=uName %>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                   <li><a href="<%=request.getContextPath( )%>/modify" >Edit Account</a></li>
					<li><a href="<%=request.getContextPath( )%>/logout" >Logout</a></li>
                  </ul>
                </li>

                
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->
  <!-- jQuery -->
    <script src='<c:url value="/static/js/dashboardjs/jquery.min.js"/>'></script>
    
    <!-- Bootstrap -->
        <script src='<c:url value="/static/js/dashboardjs/bootstrap.min.js"/>'></script>
    
    <!-- FastClick -->
   
    
    <!-- bootstrap-progressbar -->
            <script src='<c:url value="/static/js/dashboardjs/bootstrap-progressbar.min.js"/>'></script>
    
  
    
    <!-- DateJS -->
                        <script src='<c:url value="/static/js/dashboardjs/date.js"/>'></script>
    
   
    <script src='<c:url value="/static/js/jquery.timepicker.min.js"/>'></script>
<script src='<c:url value="/static/js/jquery-ui.js"/>'></script>

    <!-- Custom Theme Scripts -->
                                    <script src='<c:url value="/static/js/dashboardjs/custom.min.js"/>'></script>
    
	
  
</body>
</html>