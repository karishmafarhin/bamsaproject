<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel"%>
<%@page import="java.util.List"%>
<%@page import="com.bamsa.web.model.NewProjectModel"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<title>GanttCharts</title>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>


<script src='<c:url value="/static/js/jquery-1.12.4.js"/>'></script>
<script src='<c:url value="/static/js/jquery.dataTables.min.js"/>'></script>
<script type="text/javascript"  src='<c:url value="/static/js/jquery-1.11.1.min.js"/>'></script> 

<link rel="stylesheet" href='<c:url value="/static/css/jquery.dataTables.min.css"/>' />

<%
List<NewProjectModel> projdetails= (List)request.getAttribute("projectdetails");
int completed = 0;
if(null!= request.getAttribute("c")){
completed=(Integer) request.getAttribute("c");}
int notcompleted =0;
if(null!= request.getAttribute("nc")){
 notcompleted=(Integer) request.getAttribute("nc");}
int inprocess = 0;
if(null!= request.getAttribute("ip")){
inprocess=(Integer) request.getAttribute("ip");}
int total = 0;
if(null!= request.getAttribute("total")){
total=(Integer) request.getAttribute("total");}
String employeeId = null;
if(null!= request.getAttribute("employeeid")){
employeeId=(String) request.getAttribute("employeeid");}
String projectName = null;
if(null!= request.getAttribute("projectname")){
projectName=(String) request.getAttribute("projectname");}
boolean empIdShow=false;
if(null!=userData && userData.getUid()==0){
	empIdShow=true;
}

String error =(String)request.getAttribute("error");
if(error==null){
	error="";
}

%>




<script>
var chart = AmCharts.makeChart( "chartdiv", {
	  "type": "pie",
	  "theme": "light",
	  "dataProvider": [ {
	    "country": "Completed Tasks",
	    "value": <%=completed%>
	  }, {
	    "country": "Not Started Tasks",
	    "value": <%=notcompleted%>
	  }, {
	    "country": "In Process Tasks",
	    "value":<%=inprocess%>
	  } ],
	  "valueField": "value",
	  "titleField": "country",
	  "outlineAlpha": 0.4,
	  "depth3D": 15,
	  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
	  "angle": 30,
	  "export": {
	    "enabled": true
	  }
	} );
</script>
<script>
$( document ).ready(function() {
	$("#ganttchart").addClass("act");
});
	
</script>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
<div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
            
            
            
            
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

						<div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                 
                    <h2 class="panel-title text-center" style="font-size: 21px!important"><b>GanttCharts</b></h2>
                  
                  
                </div>
               
              </div><center>
              <%if(empIdShow){%>
               
                <div class="row">
                <div class="panel-heading" style="margin-bottom: 10px;">
                  <div >
                  <%if(null!=employeeId && null!=projectName){ %>
                <h3><span class="label label-info">Individual Performance of <%=employeeId %> for the project <%=projectName %></span></h3>
                 <%}else{ %>
   <h3><span class="label label-info">Individual Performance </span></h3>
   <%} %>
                   </div>
                </div>
              </div>
                  <form id="chartform" action="ganttcharts" method="post">
				 
				
             
              <div>
                    <input style="padding-bottom: 4px;" type="text" class="long" name="empid" maxlength="20" id="name" placeholder="Enter Employee Id" required/>
              		
              		<select id="npid" name="npid" required="required">
                    <option value="">Select Project Name
                    
                        </option>
                       
                    <%if(null!=projdetails){
                    for(NewProjectModel project:projdetails){%>                       
                        <option value="<%=project.getNpid() %>"><%=project.getProjectname() %></option>
                      <%}}%>
                        </select>
              		  <button style="padding: 3px 5px;" class="btn btn-info btn-xs " type="submit"><b>submit</b></button> </div>
                </form></center>
                <%}else{%>
                 <center><form id="chartform" action="ganttcharts" method="post">
				<div> 
                <select id="npid" name="npid" required="required">
                    <option value="">Select Project Name
                        </option>
                    <%if(null!=projdetails){
                    for(NewProjectModel project:projdetails){%>                       
                        <option value="<%=project.getNpid() %>"><%=project.getProjectname() %></option>
                      <%}}%>
                        </select>
              		  <button style="padding: 3px 5px;" class="btn btn-info btn-xs " type="submit"><b>submit</b></button> </div>
                </form></center>
                <%} %>
                
                 <h3 style="text-align:center;color:red"><%=error %></h3>
				<div id="chartdiv" style="height: 500px; width: 100%;"></div>	
				<h3>Total Tasks : <%=total %></h3>
				
				
					
								
				</div>
			</div>
			
		</div>


</body>
</html>