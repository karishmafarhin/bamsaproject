<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel" %>
<%@page import="com.bamsa.web.model.ClockTimeModel"%>
<%@page import="com.bamsa.web.model.NewProjectModel"%>
<%@page import="java.util.List"%>

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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<style>

.alpha {
    display: inline-block !important;
    min-width: 10px !important;
    padding: -6px -2px !important;
    font-size: 30px !important;
    font-weight: bold !important;
    line-height: 1 !important;
    color: #fff !important;
    text-align: center !important;
    white-space: nowrap !important;
    vertical-align: baseline !important;
    background-color: #40bf40 !important;
    border-radius: 10px !important;
    margin: 10px !important;
}
</style>
    <title>Dashboard</title>   
    
<%
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);
String empid=empModel.getEmpId();
int count= (Integer)request.getAttribute("messagetwo");
int givendates =(Integer)request.getAttribute("empgivendate");
int project=(Integer)request.getAttribute("messagethree");


boolean showassigntask=false;

if(null!=empModel && empModel.getDesigId()==0){
	showassigntask=true;
}
%>


<%
boolean isClockIn=false;
boolean isClockOut=false;

String clockedIn = (String)request.getAttribute("message");
if(clockedIn=="clockin"){
	isClockIn=true;
}



%>
 <% 
 boolean registrationShow=false;
 
 if(null!=empModel && (empModel.getDesigId() == 0 || empModel.getDesigId() == 8 || empModel.getStreamId()==13)) {
 	 registrationShow=true;
 }
 boolean showgrievanceform=false;

 if(null!=empModel && empModel.getDesigId()==0){
 	showgrievanceform=true;
 }
 %>
 <% 
 boolean mileStonesShow=false;

 if(null!=empModel && (empModel.getDesigId() == 0 || empModel.getDesigId() == 8 || empModel.getDesigId() == 7 || empModel.getDesigId() == 5 || empModel.getDesigId() == 6 )) {
	 mileStonesShow=true;
 }
 List<NewProjectModel> projdetails= (List)request.getAttribute("projectdetails");
 %>
 
 <script type="text/javascript"  src='<c:url value="/static/js/jquery-1.11.1.min.js"/>'></script> 


<script src='<c:url value="/static/js/canvasjs.min.js"/>'></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src='<c:url value="/static/js/serial.js"/>'></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>

<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/gauge.js"></script>

<body class="nav-md">
<jsp:include page="header.jsp" />
<script>
$( document ).ready(function() {
	$("#dashboard").addClass("act");
	
});

</script>


 <div class="container body">
      <div class="main_container">




 <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row tile_count">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><b> My Timesheet</b></span>
              <div class=" text-center">
				<i class="fa fa-clock-o fa-4x mar green"></i>							
				<% if(isClockIn){%>
				<button  class="btn btn-danger btn-sm" style="margin-top: -30px;" onClick="location.href='<%=request.getContextPath( )%>/clockout'">Clock-Out</button>
				<%}else{ %>
				<button id="clockin"  class="btn btn-success btn-sm" style="margin-top: -30px;" onClick="location.href='<%=request.getContextPath( )%>/clockin'" >Clock-In</button>
				<%} %>
				</div>
				
              
              <span class="count_bottom"><i class="fa fa-eye"></i><a href="<%=request.getContextPath( )%>/clockDetails"> View Details</a> </span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><b> Tasks </b></span>
              <div>
              <i class="fa fa-tasks fa-4x green"></i><span class="count">&nbsp;<%=givendates%></span>
              </div>
               <% if(empModel!=null && empModel.getDesigId() == 0) {%>
              <span class="count_bottom"><i class="fa fa-eye"></i><a href="<%=request.getContextPath( )%>/Newtask"> View Details</a></span>
           <%}else{ %>
            <span class="count_bottom"><i class="fa fa-eye"></i><a href="<%=request.getContextPath( )%>/Mytask"> View Details</a></span>
           <%} %>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><b> All Users </b></span>
              
              <div >
              <i class="fa fa-users fa-4x green"></i><span class="count">&nbsp;<%=count %></span>
              </div>
              <span class="count_bottom"><i class="fa fa-eye"></i><a href="<%=request.getContextPath( )%>/Employees"> View Details</a></span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><b> My Calendar </b></span>
              <div >
              <i class="fa fa-calendar fa-4x green"></i>
              </div>
              <span class="count_bottom"><i class="fa fa-eye"></i><a href="<%=request.getContextPath( )%>/calendar"> View Details</a></span>
             </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><b> Grievance Cell</b></span>
              <div >
              <i class="fa fa-question fa-4x green"></i>
              </div>
              <%if(showgrievanceform){ %>
              <span class="count_bottom"><i class="fa fa-eye"></i><a href="<%=request.getContextPath( )%>/Grievances"> View Details</a></span>
           	  <%}else{ %>
           	   <span class="count_bottom"><i class="fa fa-eye"></i><a href="<%=request.getContextPath( )%>/complaintform"> View Details</a></span>
           	  <%} %>
           </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><b> Gantt charts </b></span>
             <div >
              <i class="fa fa-area-chart fa-4x green"></i>
              </div>
              <span class="count_bottom"><i class="fa fa-eye"></i><a href="<%=request.getContextPath( )%>/ganttcharts"> View Details</a></span>
           </div>
          </div>
           <div class="row tile_count">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><b>Asset Tracking </b> </span>
             <div >
              <i class="fa fa-database fa-4x green"></i>
              </div>
              <span class="count_bottom"><i class="fa fa-eye"></i><a href="<%=request.getContextPath( )%>/showTicket"> View Details</a></span>
            </div>
            <%if(mileStonesShow){%>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><b>My Milestones</b></span>
              <div>
              <i class="fa fa-flag-o fa-4x green"></i><span class="count">&nbsp;<%=project%></span>
              </div>
              <span class="count_bottom"><i class="fa fa-eye"></i><a href="<%=request.getContextPath( )%>/Milestones"> View Details</a></span>
            </div>
            <%} %>
             <%if(registrationShow){%>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><b> Registration form </b></span>
             <div>
              <i class="fa fa-pencil fa-4x green"></i>
              </div>
             
              <span class="count_bottom"><i class="fa fa-eye"></i><a href="<%=request.getContextPath( )%>/registration"> View Details</a></span>
          	
           </div>
           <%} %>
          </div>
          <!-- /top tiles -->

          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">

                <div class="row x_title">
                  <div class="col-md-6">
                    <h3>Project Completeness <small>In percentage</small></h3>
                  </div>
                  <div class="col-md-6">
                    <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                        <%if(registrationShow){ %>
                         <%if(null!=projdetails ){ %>
                     <select id="npid" name="npid" required="required">
                    <option value="">Select Project Name
                    
                        </option>
                       
               
                  <%  for(NewProjectModel projec:projdetails){%>                       
                        <option value="<%=projec.getNpid() %>"><%=projec.getProjectname() %></option>
                     
                       
                         <%}%>
                  
                          </select>
                         
                        <%} }else{%>
                         <%if(null!=projdetails ){ %>
                     <select id="npidfa" name="npidF" required="required">
                    <option value="">Select Project Name
                    
                        </option>
                       
               
                  <%  for(NewProjectModel projec:projdetails){%>                       
                        <option value="<%=projec.getNpid() %>~<%=empid%>"><%=projec.getProjectname() %></option>
                     
                       
                        <%}%>
                  
                         
                         
                  </select>
                         
                       <%  }}%>
                    </div>
                  </div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                   <div id="chartdiv" style="height: 500px; width: 100%;"></div>
                </div>
               

                <div class="clearfix"></div>
              </div>
            </div>

          </div>
          <br />


          <div class="row">


           

           


          
          </div>


        </div>
        <!-- /page content -->
  <footer>
          
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

<script>
$(function() {
    $('#npidfa').change(function(){
    	var id= $(this).val();
    	var projs = id.split('~');
    	var npid= projs[0];
    	var empid = projs[1];
    	
    	 $.ajax({
 			type: "post",
 			url: "/bamsa/empperformancedashboard?empid="+empid+"&npid="+npid,
 			success:function(datasource){
 				 var chart = AmCharts.makeChart("chartdiv", {
 				    "type": "serial",
 				    "theme": "light",
 				    "dataProvider": datasource,
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
 				
 				
 				
 				
 				
 			},
 			error:function(){alert(" not fixed");}
 			 
 			 
 		  });
    	
    	
    	
    });
});
$(function() {
    $('#npid').change(function(){
    	var npid= $(this).val();
    	
    	
    	 $.ajax({
 			type: "post",
 			url: "/bamsa/performanceofprojectdashboard?npid="+npid,
 			success:function(datasource){
 				console.log(datasource);
 				var chart = AmCharts.makeChart("chartdiv", {
 					  "theme": "light",
 					  "type": "gauge",
 					  "axes": [{
 					    "topTextFontSize": 20,
 					    "topTextYOffset": 70,
 					    "axisColor": "#31d6ea",
 					    "axisThickness": 1,
 					    "endValue": 100,
 					    "gridInside": true,
 					    "inside": true,
 					    "radius": "50%",
 					    "valueInterval": 10,
 					    "tickColor": "#67b7dc",
 					    "startAngle": -90,
 					    "endAngle": 90,
 					    "unit": "%",
 					    "bandOutlineAlpha": 0,
 					    "bands": [{
 					      "color": "#0080ff",
 					      "endValue": 100,
 					      "innerRadius": "105%",
 					      "radius": "170%",
 					      "gradientRatio": [0.5, 0, -0.5],
 					      "startValue": 0
 					   }, {
 					      "color": "#3cd3a3",
 					      "endValue": 0,
 					      "innerRadius": "105%",
 					      "radius": "170%",
 					      "gradientRatio": [0.5, 0, -0.5],
 					      "startValue": 0
 					    }]
 					  }],
 					  "arrows": [{
 					    "alpha": 1,
 					    "innerRadius": "35%",
 					    "nailRadius": 0,
 					    "radius": "170%"
 					  }]
 					});

 					setInterval(randomValue, 2000);

 					function randomValue() {
 						  var value = datasource.percentagecompleted;
 						  chart.arrows[0].setValue(value);
 						  chart.axes[0].setTopText(value + " %");
 						  // adjust darker band to new value
 						  chart.axes[0].bands[1].setEndValue(value);
 						}
 				
 				
 				
 				
 			},
 			error:function(){alert(" not fixed");}
 			 
 			 
 		  });
    	
    	
    	
    });
});

</script>

</body>

