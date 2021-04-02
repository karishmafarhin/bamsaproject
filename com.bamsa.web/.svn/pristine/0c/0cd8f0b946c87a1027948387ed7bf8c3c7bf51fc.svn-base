<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.ClockTimeModel"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
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
<%


String message =(String)request.getAttribute("message");
if(message==null){
	message="";
}
String successmessage =(String)request.getAttribute("successmessage");
if(successmessage==null){
	successmessage="";
}
String errormessage =(String)request.getAttribute("errormessage");
if(errormessage==null){
	errormessage="";
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<title>Create Project</title>

 <link rel="stylesheet" href='<c:url value="/static/css/style.css"/>' />
<link rel="stylesheet" href='<c:url value="/static/css/bootstrap.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/static/font-awesome/css/font-awesome.min.css"/>' />
<link rel="stylesheet" href='<c:url value="/static/css/jquery.timepicker.min.css"/>' />
<link rel="stylesheet" href='<c:url value="/static/css/jquery-ui.css"/>' />
<!-- Loading Scripts -->

<script src='<c:url value="/static/js/bootstrap.min.js"/>'></script>
<script src='<c:url value="/static/js/main.js"/>'></script>
<script src='<c:url value="/static/js/jquery.js"/>'></script> 
 <script src='<c:url value="/static/js/jquery.timepicker.min.js"/>'></script>
<script src='<c:url value="/static/js/jquery-ui.js"/>'></script>
   
<body>

<script>
   $(document).ready(function() {
		 $("[required]").after("<span class='required'>*</span>");
		});
   </script>
 <script>

$(document).ready(
        
        /* This is the function that will get executed after the DOM is fully loaded */
        function () {
          $( ".datepickers" ).datepicker({
        	  minDate:0,
        	  dateFormat: 'dd-mm-yy',
        	 changeMonth: true,//this option for allowing user to select month
            changeYear: true,//this option for allowing user to select from year range
            yearRange: "-100:+100"
           
            
          });
          
          
        }
);



var _URL = window.URL || window.webkitURL;
function submitproject(){
	$("#success").empty();
	 var file, img;
	if($("#name").val()==""||$("#taskd").val==""||$("#deadline").val==""){
		$(this).focus();
		document.getElementById("error").innerHTML="Please fill all the fields";
		
	}
	
	
	    if ((file = $('#picture')[0].files[0])) {
	        img = new Image();
	        img.src = _URL.createObjectURL(file);
	        img.onload = function() {
	        	if(this.width>250 || this.height>164){
	        		alert("Please select appropriate picture.(below  250X164 is allowed)");
	        	}
	        	else{
	        		$('#prjregistration').attr('action','saveproject');
	        		$('#prjregistration').submit();
	        	}
	           
	        };
	        img.onerror = function() {
	            alert( "not a valid file: " + file.type);
	        };
	       
	       
		
	    }
	    

}

</script>

 
<div class="content-wrapper">
	<div class="container-fluid">
		
            <div class="panel panel-primary panel-table">
              <div class="panel-heading " style="padding:2px 15px;">
                <div class="row">
                  <div >
                     <h1 class="h1class text-center"><b>Create project</b></h1>
                  </div>
                   
                </div>
              </div>
              <h5 id="err" style="text-align:center;color:red"><%=message %></h5>
				<h5 id="success" style="text-align:center;color:green"><%=successmessage %></h5>	
					<h5 id="error" style="text-align:center;color:red"><%=errormessage %></h5>		
				<form  action="" method="post" enctype="multipart/form-data"  name="registration" id="prjregistration" class="register">
				<div class="col-md-12">
				
				 
				
				
					
					
				</div>
             <fieldset class="row1">
            
               
                <p>
                    <label>Project Name
                    </label>
						
						
                    <input type="text" class="long" name="pname" maxlength="50" placeholder="project name" id="name" value="" required/>
                    
                </p>
                <p>
                <label>Project Description</label>
                <input type="text" class="long" name ="pdescription" placeholder="project description" id ="taskd" required />
                <p>
                    <label >Deadline 
                    </label>
                    <input type="text" class="datepickers long" name="deadline" id="deadline" placeholder="mm/dd/yy" value="" required/>
                </p>
               <p>
				<label>Picture  </label> <input type="file" accept="image/*"
					class="long" name="picture" id="picture" required />
							</p>
            
                
            </fieldset>
           
            <div class="col-md-12">
            <fieldset class="row1">
               <div><center><input  class="btn btn-primary btn-lg btn3d" onclick="submitproject();" type="button" value="Submit"></center></div>
               
            </fieldset>
            </div>
        </form>
				 </div>
			</div>
		</div>
		</div>






</body>