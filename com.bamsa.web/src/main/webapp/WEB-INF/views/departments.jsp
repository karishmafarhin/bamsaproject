<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    
    <link rel="stylesheet" href='<c:url value="/static/css/bootstrap1.min.css"/>' />

<title>Departments</title>

<script>
$( document ).ready(function() {
	$("#mytask").addClass("act");
});
</script>

 
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
             
             <div class="right_col" role="main">
           
            
            
            
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
<h1  class="text-center"  style="color:#004d99 !important;" style="margin-bottom:50px;" style="color:#004d99 !important"><b>Departments</b></h1>
	<div class="row">
		<section class="section_0">
      <div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=1"><h2>1<p>Java</p></h2></a>
        </div>
      </div>
      <div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=2"><h2>2<p>PHP</p></h2></a>
        </div>
      </div>
      <div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=3"><h2>3<p>Android</p></h2></a>
        </div>
      </div>
      <div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=4"><h2>4<p>UI</p></h2></a>
        </div>
      </div>
      <div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=12"><h2>5<p>Testing</p></h2></a>
        </div>
      </div>
      <div class="col-sm-2">
        
      </div>
    </section>
	</div>
	<div class="row">
		<section class="section_0">
		
     
		<div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=5"><h2>6<p>Accounts</p></h2></a>
        </div>
      </div>
      <div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=6"><h2>7<p>A&O</p></h2></a>
        </div>
      </div>
      <div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=7"><h2>8<p>Bench Sales</p></h2></a>
        </div>
      </div>
       <div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=8"><h2>9<p>US IT</p></h2></a>
        </div>
      </div>
     
      <div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=9"><h2>10<p>P & C</p></h2></a>
        </div>
      </div>
      
      <div class="col-sm-2">
        
      </div>
      
     
    </section>
	</div>
	<div class="row">
		<section class="section_0">
    
      <div class="col-sm-2">
        
      </div>
      
       <div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=10"><h2>11<p>T & D</p></h2></a>
        </div>
      </div>
      
      <div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=11"><h2>12<p>BDM</p></h4></a>
        </div>
      </div>
       <div class="col-sm-2">
        <div class="circle circle3">
          <a href="<%=request.getContextPath( )%>/Newtask?sid=13"><h2>13<p>HR</p></h4></a>
        </div>
      </div>
      <div class="col-sm-2">
        
      </div>
      
        
      </div>
    </section>
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
