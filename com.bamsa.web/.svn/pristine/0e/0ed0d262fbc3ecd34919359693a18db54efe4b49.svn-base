<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.ClockTimeModel"%>
<%@page import="com.bamsa.web.model.ContactModel"%>
<%@page import="com.bamsa.web.model.OpeningInfoModel"%>
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

    <title>Registration Form</title> 

<%
List<String> mails = (List)request.getAttribute("hotlistmails");
String hotlist = (String)request.getAttribute("hotlist");




String message =(String)request.getAttribute("message");
if(message==null){
	message="";
}
String successmessage =(String)request.getAttribute("successmessage");
if(successmessage==null){
	successmessage="";
}
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

%>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

 <script src='<c:url value="/static/tinymce/tinymce.min.js"/>'></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<style>
body{margin-top:20px;
background:#eee;
}
.badge{
	padding: 7px 12px !important;
}
</style>
 
<body> 

    
   
 <jsp:include page="header.jsp" />
 <script>
 $(document).ready(function() {
	var options =<%=hotlist%>;
	 console.log(options);
	 console.log(options[0]);
	 $("#lstFruits").append($('<option></option>').attr("value", 'firstName').text('First Name'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'lastName').text('Last Name'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'middleName').text('Middle Name'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'emailid').text('Email'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'gender').text('Gender'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'mobile').text('Contact Number'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'city').text('City'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'state').text('State'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'visaStatus').text('Visa Status'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'avdate').text('Available From'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'relocate').text('Relocation'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'primaryskills').text('Primary Skills'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'ssn').text('SSN(last 4 digits)'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'billRateType').text('Type of bill rate'));
	 $("#lstFruits").append($('<option></option>').attr("value", 'rate').text('Bill Rate'));

	 for(var i=0;i<options.length;i++){
	 $("#candidates").append($('<option></option>').attr("value", options[i].ciid).text(options[i].firstName+" "+options[i].lastName));

	 }
	
	 
 });
 </script>
  <script src='<c:url value="/static/js/bootstrap-multiselect.js"/>'></script>
  <script src='<c:url value="/static/css/bootstrap-multiselect.css"/>'></script> 
 <div class="content-wrapper">


	<div class="col-md-10">
		<div class="panel panel-default bgclr">
		<div class="row">
			<div class="panel-body message">
				<h4 class="text-center"><b>New Message</b></h4>
				<form class="form-horizontal" role="form" enctype="multipart/form-data" action="broadcastopeningmail" method="post">
					<div class="form-group">
				    	<label for="to" class="col-sm-1 control-label">To:</label>
				    	<div class="col-sm-11">
                            <input type="text" class="form-control" name="to" id="to" value="<%=mails %>" required>
				    	</div>
				  	</div>
					<div class="form-group">
				    	<label for="cc" class="col-sm-1 control-label">CC:</label>
				    	<div class="col-sm-11">
                             <input type="text" class="form-control" name="cc" id="cc" >
				    	</div>
				  	</div>
					<div class="form-group">
				    	<label for="bcc" class="col-sm-1 control-label">BCC:</label>
				    	<div class="col-sm-11">
                             <input type="text" class="form-control" name="bcc" id="bcc" >
				    	</div>
				  	</div>
				  	<div class="form-group">
				    	<label for="Subject" class="col-sm-1 control-label">Subject:</label>
				    	<div class="col-sm-11">
                             <input type="text" class="form-control" name="subject" id="subject" >
				    	</div>
				  	</div>
				  	
				  	<div class="form-group">
				    	<label for="Select" class="col-sm-2 control-label">Select options:</label>
				    	<div class="col-sm-5">
                         <select id="lstFruits" multiple="multiple" style="display:none;">
					      
					    </select>    
				    	</div>
				    	<div class="col-sm-5">
                         <select id="candidates" multiple="multiple" style="display:none;">
					      
					    </select>    
				    	</div>
				  	</div>
				  	
				  	 <div class="form-group">
			       <div class="col-md-4 col-md-offset-4">
			        <input type="button" class="btn btn-success" id="btnSelected" onclick="getvalues();" value="click here to preview" />
			       
			        </div>
			        </div>
					<div class="form-group">
						<textarea id="tas" class="tinymce" name="mailbody">
						
							</textarea>
							
							
						
						
					</div>
					
					<div class="form-group">	
						<button type="submit" class="btn btn-success">Send</button>
						<button type="" class="btn btn-default">Draft</button>
						<button type="reset" class="btn btn-danger">Discard</button>
						<% if(null!=empModel){%>
						<input type="hidden" id="enam" value="<%=empModel.getName()%>"/>
						<input type="hidden" id="mob" value="<%=empModel.getMobileNo()%>"/>
						<%}%>
					</div>
					 </form>
				</div>
				 
				</div>	
			</div>	
		</div>	
		
</div>
</div>

<link rel="stylesheet" href='<c:url value="/static/css/tokenize2.min.css"/>' />
  <script src='<c:url value="/static/js/tokenize2.min.js"/>'></script>
  <script src='<c:url value="/static/tinymce/tinymce.min.js"/>'></script>
<script>
tinymce.init({
	  selector: 'textarea',
	  height: 500,
	  menubar: false,
	  plugins: [
	    'advlist autolink lists link image charmap print preview anchor',
	    'searchreplace visualblocks code fullscreen',
	    'insertdatetime media table contextmenu paste code'
	  ],
	  toolbar: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
	  content_css: [
	    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
	    '//www.tinymce.com/css/codepen.min.css']
	});

$(function () {
    $('#lstFruits').multiselect({
        includeSelectAllOption: true
    });
   
});
$(function () {
    $('#candidates').multiselect({
        includeSelectAllOption: true
    });
   
});

function getvalues(){
		
	tinyMCE.activeEditor.setContent('');
		
	var options =<%=hotlist%>;
	
     var checkValues = $("#lstFruits option:selected").map(function()
     {
         return $(this).val();
     }).get();
     console.log(checkValues);
   
    var length= checkValues.length;
    var candidates = $("#candidates option:selected").map(function()
    	     {
    	         return $(this).val();
    	     }).get();
    	     console.log(candidates);
    	   
    	    var clength= candidates.length;
    	    console.log(clength);
    
    var table = document.createElement("TABLE");
	    console.log(table);
	    table.border = "2";
	 var columnCount = length;
		 
	    //Add the header row.
	    var row = table.insertRow(-1);
	    for (var i = 0; i < columnCount; i++) {
	        var headerCell = document.createElement("TH");
	        headerCell.innerHTML = checkValues[i];
	        row.appendChild(headerCell);
	    }
	
	for (var j = 0; j < clength; j++) { // 14,15

			
		row = table.insertRow(-1);
				for (var l = 0; l < options.length; l++) {// 2 mems data
					if (candidates[j] == options[l].ciid) {
					for (var k = 0; k < columnCount; k++) {// selected fields
					
						var cell = row.insertCell(k);
						cell.innerHTML = options[l][checkValues[k]];
					}
				}

			}
		}
		var obj = tinymce.get("tas");
		var x = document.createElement("P");
		x.innerHTML = "Hi.Please go through the below requirement.";
		var greet = document.createElement("P");
		greet.innerHTML = "Thanks and Regards,";
		var name = document.createElement("P");
		var en = $("#enam").val();
		name.innerHTML = en;
		var mobile = document.createElement("P");
		var em = $("#mob").val();
		mobile.innerHTML = em;

		tinyMCE.activeEditor.selection.setNode(x);
		tinyMCE.activeEditor.selection.setNode(table);
		tinyMCE.activeEditor.selection.setNode(greet);
		tinyMCE.activeEditor.selection.setNode(name);
		tinyMCE.activeEditor.selection.setNode(mobile);

	};
</script>


  
  
  
</body>
</html>