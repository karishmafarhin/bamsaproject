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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My Calendar</title>
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
   
    <link rel="stylesheet" href='<c:url value="/static/css/dncalendar-skin.min.css"/>' />


<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
 
   
             <div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
          
  
  
  
				
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
<div class="panel panel-primary panel-table">
	<div class="container-fluid">
	 <div class="container">
<h1  class="text-center"  style="color:#004d99 !important;" style="margin-bottom:50px;" style="color:#004d99 !important"><b>Task Tracking Calendar</b></h1>
<div id="dncalendar-container">
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
<script type="text/javascript" src='<c:url value="/static/js/jquery1-1.11.3.min.js"/>'> </script>
<script type="text/javascript" src='<c:url value="/static/js/dncalendar.min.js"/>'> </script>
<script type="text/javascript">
		$(document).ready(function() {
			 var datascource = <%=request.getAttribute("calendarnotes")%>
			var my_calendar = $("#dncalendar-container").dnCalendar({
				
                notes: datascource,
                showNotes: true,
                
                dayClick: function(date, view) {
                	alert(date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear());
                }
			});

			// init calendar
			my_calendar.build();

			// update calendar
			// my_calendar.update({
			// 	minDate: "2016-01-05",
			// 	defaultDate: "2016-05-04"
			// });
		});
		</script>
		 <script>
$( document ).ready(function() {
	$("#calendar").addClass("act");
});
	
</script>
	</body>
</html>
	