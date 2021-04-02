<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
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

    <title>Success or Error</title> 

<%
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);


boolean success= false;
 success =(Boolean)request.getAttribute("success");

%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
             
                <div class="right_col" role="main">
          <div class="">
            
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
<div class="x_panel" style="height: 663px;">
                
                  <div class="x_content">
             
 
  
 
<div class="content-wrapper">

	<div class="container">
	<div class="row text-center">
        <div class="col-sm-6 col-sm-offset-3">
        <%if(success){ %>
           <br><br> <h2 style="color:#0fad00">Success</h2>
        <img src='<c:url value="static/img/check-true.jpg" />' />
        <h3>Dear, <%=empModel.getName() %></h3>
        <p style="font-size:20px;color:#5C5C5C;">Your Email Sent Successfully</p>
        
        
       <%} else{%>
      
        <br><br> <h2 style="color:red">Fail</h2>
        <img src='<c:url value="static/img/x.mark.4.513.jpg" />' />
        <h3>Dear, <%=empModel.getName() %></h3>
        <p style="font-size:20px;color:#5C5C5C;">Your Email not Sent Successfully</p>
        
        
        
        <%} %>
    <br><br>
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
						

</body>
</html>