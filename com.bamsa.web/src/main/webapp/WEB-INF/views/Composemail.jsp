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
List<String> mails = (List)request.getAttribute("emails");

String contacts =(String)request.getAttribute("accountdetails");
OpeningInfoModel openinginfo = new OpeningInfoModel();
openinginfo=(OpeningInfoModel)request.getAttribute("openingdetails");

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
				    	<label for="Select" class="col-sm-1 control-label">Select options:</label>
				    	<div class="col-sm-11">
                         <select id="lstFruits" multiple="multiple" style="display:none;">
					        <option value="<%=openinginfo.getPositionid()%>~Position Id">Position Id</option>
					        <option value="<%=openinginfo.getPositiontitle()%>~Position Title">Position Title</option>
					        <option value="<%=openinginfo.getState()%>~State">State</option>
					        <option value="<%=openinginfo.getCity()%>~City">City</option>
					        <option value="<%=openinginfo.getPrimaryskill()%>~Primary Skill">Primary Skill</option>
					        <option value="<%=openinginfo.getSecondaryskill()%>~Secondary Skill">Secondary Skill</option>
					        <option value="<%=openinginfo.getBilltype()%>~Bill Type">Bill Type</option>
					        <option value="<%=openinginfo.getRate()%>~Bill Rate">Bill Rate</option>
					        <option value="<%=openinginfo.getPrimevendor()%>~Prime Vendor">Prime Vendor</option>
					        <option value="<%=openinginfo.getEndclient()%>~End Client">End Client</option>
					        <option value="<%=openinginfo.getDescription()%>~Description">Description</option>
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

function getvalues(){
		
	tinyMCE.activeEditor.setContent('');
	
     var checkValues = $("#lstFruits option:selected").map(function()
     {
         return $(this).val();
     }).get();
     console.log(checkValues);
    var arr= checkValues[0].split('~');
     console.log(arr[1]);
	 console.log(arr[0]);
    var length= checkValues.length;
    
    var table = document.createElement("TABLE");
	    console.log(table);
	    table.border = "2";
   
	
    for(var i = 0; i < length; i++){
   	var arr= checkValues[i].split('~');
   	        var row = table.insertRow(-1);
   		    var cell1 = row.insertCell(0);
   		    var cell2 = row.insertCell(1);
   		    cell1.innerHTML = arr[1];
   		    cell2.innerHTML = arr[0];
   	 
    }
    var obj = tinymce.get("tas");
    var x = document.createElement("P");
	 x.innerHTML="Hi.Please go through the below requirement.";
	 var greet = document.createElement("P");
	 greet.innerHTML="Thanks and Regards,";
	 var name = document.createElement("P");
	 var en=$("#enam").val();
	 name.innerHTML=en;
	 var mobile = document.createElement("P");
	 var em=$("#mob").val();
	 mobile.innerHTML=em;
	 
    tinyMCE.activeEditor.selection.setNode(x);
    tinyMCE.activeEditor.selection.setNode(table);
    tinyMCE.activeEditor.selection.setNode(greet);
    tinyMCE.activeEditor.selection.setNode(name);
    tinyMCE.activeEditor.selection.setNode(mobile);
    
    
    
    
     

};
 
 </script>

</script>
  
  
  
</body>
</html>