<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.EmployeeModel"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
        <title>Employees</title>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);


if(userData == null)
{
	response.sendRedirect("/bamsa");	
}
%>
<title>All Users</title>

<% 
List<EmployeeModel> empdetails = (List)request.getAttribute("Employees");
String deptname =(String)request.getAttribute("stream");
%>



<script src='<c:url value="https://apis.google.com/js/platform.js"/>' async defer></script>

<style>
 .tabi {

    overflow-x: scroll !important;
}
</style>

<script>
$( document ).ready(function() {
	$("#employees").addClass("act");
});
$(document).ready(function(){
    $('#myTable').DataTable();
});

/* Init the table and fire off a call to get the hidden nodes. */

</script>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
             
              <div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
          
  
  
  
              <div style="/*! margin-left: 161px; */" class="col col-xs-12">
      
  <ul id="topbar">
                <li><a href="<%=request.getContextPath( )%>/Employees" class="btn btn-primary btn-primary"><i class="fa fa-arrow-left" aria-hidden="true"></i>
 Back to Departments</a></li>
            </ul>         
            
        </div>
  

		
				
           
            
            
            
            <div class="right_col" role="main">
          <div class="row">
  
	</div>
	</div>
	<div>
	<h1></h1>
	</div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="height: 1020px;">
                
                  <div class="x_content">
 
             
             
<div class="content-wrapper">
 
	<div>
	<h1></h1>
	</div>
	<div class="row">
                  
                	<div class="col-md-4">
           
               </div>
               
        <div class="col-md-4">
        <input type="button" class="btn btn-primary" value="Start Live Chat" onclick="window.open('/jchatbox/admin/index.jsp')">
        </div>
         <div class="col-md-4" id="placeholder-div"></div>
         
        </div>
	<div class="container-fluid">
		<div class="row" style="margin-right:0px">
			<div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                  
                
                   <% if (deptname != null){%>
                    <h2 class="panel-title text-center" style="font-size: 21px!important" ><b>Employees <%=deptname%></b></h2>
                  <% }else{%>
                   <h2 class="panel-title text-center" style="font-size: 21px!important" ><b>Employees</b></h2>
                   <%}%>
                  </div>
                  
               
              </div>
								<div id="" class="table-responsive tabi">
									<table  id="myTable" class="table table-striped table-bordered display">
										<thead>
											<tr class="st1 info">
												<th class ="st1">S.No</th>
												<th class ="st1">Employee Id</th>
												<th class ="st1">Employee Name</th>
												<th class ="st1">Branch Name</th>
											</tr>
										</thead>
										<tbody>	

						<%
						int i=1;
						for(EmployeeModel employee:empdetails){ %>
							<tr class="st1">
								<td><%=i%></td>
								<td><%=employee.getEmpId()%></td>
								<td><%=employee.getName()%></td>
								<td><%=employee.getBranchname()%></td>
								<%i++; } %>
							</tr>
						
							
						</tbody>
					</table>
				</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		
<script>
gapi.hangout.render('placeholder-div', { 'render': 'createhangout' });
</script>
		


<script type="text/javascript" src='<c:url value="/static/js/jquery.dataTables.min.js"/>'></script> 
<link rel="stylesheet" href='<c:url value="/static/css/jquery.dataTables.min.css"/>' />
</body>
</html>