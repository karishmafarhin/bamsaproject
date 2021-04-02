<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in</title>

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath( )%>/static/css/style.css" rel="stylesheet">
 
   
</head>
<body class="mainbody">
<%
	String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
%>
<%
	String success = (String)request.getAttribute("success");
	if(success == null){
		success = "";
	}
%>
<div class="login-page">
<div>
<h1 style="text-align:center;color:white;">BAMSA LOGIN</h1>
</div>
  <div class="form" style="background:rgba(255, 255, 255, 0.12);">
  <h5 style="color: red"><%=message%></h5>
				<h5 style="color: green"><%=success%></h5>
    <form class="register-form" action="reset" method="post">
       <input class="log" type="text" name="username" placeholder="Username" required/>
      <input class="log" type="password" name="oldpassword" placeholder="Old-Password" required/>
      <input class="log" type="password" name="newpassword" placeholder="New Password" required/>
       <input class="log" type="password" name="renewpassword" placeholder="Re-Enter New Password" required/>
      <button>Reset</button>
      <p class="message">Want to login? <a href="#">Sign In</a></p>

    </form>
    <form:form action="login" id="loginform" class="login-form" method="post" modelAttribute="user">
      <input class="log" type="text" name="username" placeholder="Username"/ required>
      <input class="log" type="password" name="password" placeholder="Password"/ required>
      <button>login</button>
      </form:form>
      <p class="message">Change Password? <a href="#">Reset Password</a></p>
     
  </div>
</div>
   <script src='<c:url value="/static/js/jquery.min.js"/>'></script>
    <script src='<c:url value="/static/js/jquery.js"/>'></script>
 <script type="text/javascript">
    $('.message a').click(function(){
    	   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
    	});
    
      </script>
      </body>
</html>