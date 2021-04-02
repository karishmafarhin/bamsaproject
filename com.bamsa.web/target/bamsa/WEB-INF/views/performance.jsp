<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.EmployeeTaskModel"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
if(userData == null)
{
	response.sendRedirect("/bamsa");	
}
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="theme-color" content="#3e454c">
<link rel="stylesheet" href='<c:url value="/static/css/style.css"/>' />
<link rel="stylesheet" href='<c:url value="/static/css/bootstrap.css"/>' />


<script src='<c:url value="/static/js/bootstrap.min.js"/>'></script>
<script src='<c:url value="/static/js/canvasjs.min.js"/>'></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src='<c:url value="/static/js/serial.js"/>'></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />

<%
List<EmployeeTaskModel> details = (List)request.getAttribute("empperformance");
String empid =(String) request.getAttribute("empid");
Float average =(Float) request.getAttribute("average");
String datasource =(String) request.getAttribute("empperformancejson");

       
%>
   
<script type="text/javascript">
   var chart = AmCharts.makeChart("chartdiv", {
	    "type": "serial",
	    "theme": "light",
	    "dataProvider": <%=datasource%>,
	    "valueAxes": [{
	        "axisAlpha": 0,
	        "dashLength": 4,
	        "position": "left"
	    }],
	    "graphs": [{
	        "bulletSize": 14,
	        "customBullet": "https://www.amcharts.com/lib/3/images/star.png?x",
	        "customBulletField": "customBullet",
	        "valueField": "value",
	         "balloonText":"<div style='margin:10px; text-align:left;'><span style='font-size:13px'>[[category]]</span><br><span style='font-size:18px'>Value:[[value]]</span>",
	    }],
	    "marginTop": 20,
	    "marginRight": 70,
	    "marginLeft": 40,
	    "marginBottom": 20,
	    "chartCursor": {
	        "graphBulletSize": 1.5,
	     	"zoomable":false,
	      	"valueZoomable":true,
	         "cursorAlpha":0,
	         "valueLineEnabled":true,
	         "valueLineBalloonEnabled":true,
	         "valueLineAlpha":0.2
	    },
	    "autoMargins": false,
	    "dataDateFormat": "YYYY-MM-DD",
	    "categoryField": "date",
	    "valueScrollbar":{
	      "offset":30
	    },
	    "categoryAxis": {
	        "parseDates": true,
	        "axisAlpha": 0,
	        "gridAlpha": 0,
	        "inside": true,
	        "tickLength": 0
	    },
	    "export": {
	        "enabled": true
	    }
	});
</script>
</head>

<title>GrievanceDetails</title>

<body>

<div class="content-wrapper">
<h1>Performance of <%=empid %> </h1>
  <div id="chartdiv" style="height: 500px; width: 100%;">
  </div>

 <div class="table-responsive">
              <table class="table table-striped table-bordered table-list" style="text-align: center;" id="dev-table">
                  <thead>
								<tr class="st1">
                                <th class="info" >S.No</th>
								<th class="info" >Task/Project Description</th>
								<th class="info" >Task Type</th>
								<th class="info" >Given Date</th>
								<th class="info" >Performance</th>
								<th class="info" >Backlogs</th>
								<th class="info" >Queries</th>
								<th class="info" >Reason</th>
													
							</tr>
							
							
						</thead>
						<tbody>
						 <% int i=1;
                        for(EmployeeTaskModel emptask:details){
                        %>
							<tr class="st1">
								
                                <td ><%=i%></td>
								<td ><%=emptask.getTaskdescription()%></td>
								<%String task=Character.toString(emptask.getTasktype() );
								if(task.equals("P")) {%>
								<td><span class="label label-success"><b>Project</b></span></td>
								<%}else { %>
								<td>Task</td>
								<%} %>
								
							<td ><%=emptask.getGivendate()%></td>
								<td ><progress value="<%=emptask.getPercentagecompleted()%>" max="100"></progress><%=emptask.getPercentagecompleted()%></td>
                           		<%if(null!=emptask.getBacklogs()){ %>
                           		<td><%=emptask.getBacklogs() %></td>	
                           		<%}else{ %>	
                           		<td>---</td>
                           		<%}	
                           		if(null!=emptask.getQueries()){ %>
                           		<td><%=emptask.getQueries() %></td>	
                           		<%}else{ %>	
                           		<td>---</td>
                           		<%} 	
                           		if(null!=emptask.getReason()){ %>
                           		<td><%=emptask.getReason() %></td>	
                           		<%}else{ %>	
                           		<td>---</td>
                           		<%} %>			
							</tr>
						<%i++;}%>	
						<tr class="st1">
						<td style="border:0px;"></td>
						<td style="border:0px;">Average Performance</td>
						<td style="border:0px;"><progress value="<%=average%>" max="100"></progress><%=average%></td>
				
						</tr>
								</table>		  
						</tbody>
              
  
    
       
              
				
				<div id=""></div>
           
</div>

</body>
