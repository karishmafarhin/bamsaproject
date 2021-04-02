<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
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
    <link rel="stylesheet" href='<c:url value="/static/css/bootstrap1.min.css"/>' />
<style>
.timeline-badge i {
    padding-top: 13px;
    color: #fff;
}
.button-neutral:hover{
    color: #fff;
    background-color: #63126f !important;
}
.dang{
background-color:#d94fc9 !important; }
</style>

<title>Departments</title>

<script src='<c:url value="/static/js/jquery.min.js"/>'></script> 
<script src='<c:url value="/static/js/jquery.ui.custom.js"/>'/></script> 
<script src='<c:url value="/static/js/jquery.js"/>'></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script>
$( document ).ready(function() {
	$("#employees").addClass("act");
});
</script>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
             
              <div class="right_col" role="main">
           <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Departments</h3>
              </div>
            
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
<div class="container">
    <ul class="timeline">
        <li>
          <div class="timeline-badge success"><i class="fa fa-laptop"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
            <a href="#!" > <h4 class="timeline-title" style="color:green">IT Department</h4></a>
             </div>
            <div class="timeline-body">
             <a href="<%=request.getContextPath( )%>/Employees?sid=1" class="button button-neutral">JAVA</a>
            </div>
            <div class="timeline-body">
            <a href="<%=request.getContextPath( )%>/Employees?sid=2" class="button button-neutral">PHP</a>
            </div>
            <div class="timeline-body">
           <a href="<%=request.getContextPath( )%>/Employees?sid=3" class="button button-neutral">Android</a>
            </div>
            <div class="timeline-body">
            <a href="<%=request.getContextPath( )%>/Employees?sid=4" class="button button-neutral">UI</a>
            </div>
            
				
            </div>
         
        </li>
        <li>
          <div class="timeline-badge info"><i class="fa fa-check "></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <a href="#!" > <h4 class="timeline-title" style="color:#5bc0de">QA Department</h4>
            </div>
            <div class="timeline-body">
            <a href="<%=request.getContextPath( )%>/Employees?sid=12" class="button button-neutral">Testing</a>
            </div>
            
          </div>
        </li>
        <li>
          <div class="timeline-badge danger"><i class="fa fa-money "></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <a href="#!" > <h4 class="timeline-title" style="color:red">Operations & Accounts Department</h4>
            </div>
            <div class="timeline-body">
            <a href="<%=request.getContextPath( )%>/Employees?sid=5" class="button button-neutral">Accounts</a>
            
              
            </div>
            <div class="timeline-body">
           <a href="<%=request.getContextPath( )%>/Employees?sid=9"  class="button button-neutral">P & C</a>
            
              
            </div>
             <div class="timeline-body">
            <a href="<%=request.getContextPath( )%>/Employees?sid=6"  class="button button-neutral">A & O</a>
            
              
            </div>
          </div>
        </li>
      
         <li>
          <div class="timeline-badge primary"><i class="fa fa-briefcase"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
               <a href="#!" ><h4 class="timeline-title" style="color:#0066cc">Management Department</h4>
             </div>
            <div class="timeline-body">
           <a href="<%=request.getContextPath( )%>/Employees?sid=10" class="button button-neutral">T & D</a>
             </div>
            
             <div class="timeline-body">
            <a href="<%=request.getContextPath( )%>/Employees?sid=11"  class="button button-neutral">BDM</a>
            
              
            </div>
          </div>
        </li>
       <li>
          <div class="timeline-badge dang"><i class="fa fa-male"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <a href="#!" > <h4 class="timeline-title" style="color:#d94fc9">Recruitment Department</h4>
            </div>
             <div class="timeline-body">
           <a href="<%=request.getContextPath( )%>/Employees?sid=7"  class="button button-neutral">BenchSales</a>
            
            </div>
             <div class="timeline-body">
            <a href="<%=request.getContextPath( )%>/Employees?sid=13"  class="button button-neutral">HR</a>
            
              
            </div>
            <div class="timeline-body">
            <a href="<%=request.getContextPath( )%>/Employees?sid=8"  class="button button-neutral">US IT</a>
            
            </div>
            
          </div>
        </li>
    </ul>
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
$('.timeline-panel').click(function() {
    $('.timeline-body', this).toggle(); // p00f
});
</script>
</body>
            