<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.bamsa.web.model.GrievanceDetailsModel"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel" %>

<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="java.util.List"%>
<title>GrievanceDetails</title>


<!DOCTYPE html>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <script type="text/javascript"  src='<c:url value="/static/js/jquery-1.11.1.min.js"/>'></script> 

   <title>GrievanceDetails</title>
   
<% 
UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);


if(userData == null)
{
	response.sendRedirect("/bamsa");	
}
%>
<%
List<GrievanceDetailsModel> details = (List)request.getAttribute("complaintlist");
List<String> mails = (List)request.getAttribute("Emails");     
 %>
 <%
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);
 
 boolean showgrievanceform=true;
%>
<style>

     .tabi {

    overflow-x: scroll !important;
}
    </style>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
<%
if(null!=empModel && empModel.getDesigId()==0){
	showgrievanceform=false;
	%>
	<script>
$( document ).ready(function() {
	$("#complainta").addClass("act");
	$("#grievance").addClass("actv");
});


</script>
	<%
}else{
%>
 <script>
$( document ).ready(function() {
	$("#complaint").addClass("act");
	$("#grievance").addClass("actv");
});


</script>

<%} %>
<script>

$(document).ready(function(){
    $('#myTable').DataTable();
});

</script>
<script>
function opendialog(){
	$("#dialogbox").dialog('open');
	$("#errorbox").empty();
	
}

function savemails(){

var selectedValues = $('#mails').val();
var subject=$('#subject').val();
var body=$('#description').val();
console.log(selectedValues);
if(selectedValues == ''|| subject == ''|| body == '')
	{
	
	document.getElementById("errorbox").innerHTML="please fill the form";
	
	return false;
	}
  	else
  	{
	$("#mail").val(selectedValues);
	$("#maildata").attr('action', 'sendmail');
	$("#maildata").submit();	
	return true;
	}
	}

 function fixgrievance(gid){
	 
	 $.ajax({
			type: "post",
			url: "/bamsa/fixgrievance?gid="+gid,
			success:function(){alert("Grievance Fixed");
			},
			error:function(){alert("Grievance not fixed");}
			 
			 
		  });
	 
	
 }

</script>




</head>
<div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
            <div class="page-title">
  
  
  
              <div style="/*! margin-left: 161px; */" class="col col-xs-12">
       <div class="btn-group btn-breadcrumb">
       <%if(showgrievanceform){ %>
          <a href="complaintform"  class="btn btn-info " style="font-size: 15px!important">Grievance Form</a>
            <a href="Grievances" id="grievance" class="btn btn-info" style="font-size: 15px!important">Grievance Details</a>
            <%} %>
           
        </div>
	</div>

	<div class=" col-xs-3 col-xs-offset-9">
	<a href="<%=request.getContextPath( )%>/GrievanceExcel"><button type="button" class="btn btn-primary"><i class="fa fa-file-excel-o" aria-hidden="true"><b>Excel</b></i></button></a>
    <a href="<%=request.getContextPath( )%>/GrievancePdf"><button type="button" class="btn btn-success"><i class="fa fa-file-pdf-o" aria-hidden="true"><b>PDF</b></i></button></a>
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
 
  

	<div class="container-fluid">
		<div class="row" style="margin-right:0px" >
						<div class="panel panel-primary panel-table">
						<%if(null!=userData && userData.getUid()==0){ %>
<div class="panel-heading" style="margin-bottom: 10px;padding: 2px;">
					 <span class="side-tab" data-target="#tab2" data-toggle="tab" role="tab" aria-expanded="false">
                        <div class="panel-heading" role="tab" id="headingTwo" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
<h4 class="panel-title text-center" style="font-size: 21px!important"><a href="#!">SEND EMAIL TO FIX GRIEVANCE</a></h4>                        </div>
                    </span>
</div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                        <!-- Tab content goes here -->
                        <h3 style="text-align:center;color:red"><p id="errorbox"></p></h3>
                        	<form action="" id="maildata" method="post">
              <div class="form-group">
           <label for="exampleInputEmail1">To :</label>
                 <select class="tokenize-demo" id="mails" name="mails" multiple required="required">
                <%if(null!=mails){
                for(String m:mails){ %>
				    <option value="<%=m %>"><%=m%></option>
				    <%}} %>
				</select>
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Subject :</label>
                <input type="text" class="form-control" id="subject" name="subject" placeholder="subject" required>
              </div>
              <div class="form-group">
                <label for="exampleInputFile">Message :</label>
               	<textarea  class="form-control" id="description" name="message" placeholder="Enter Your Message" required></textarea>
			  		
              </div>
              <input type="hidden" name="mail" id="mail">
              <button type="button" onClick="savemails();" >Send Mail</button>
            </form>
     
                        </div>
                    </div>
                    <%} %>
<div class="panel-heading" style="margin-bottom: 10px;padding: 3px;">
                <div class="row">
                  <div >
<h2 class="panel-title text-center" style="font-size: 21px!important;padding: 8px;"><b>Grievance Details</b></h2>                  </div>
                  
                </div>
              </div>
								<div class="table-responsive tabi">
									<table id="myTable" class="table table-striped table-bordered ">
										<thead>
											<tr class="st1 info">
												<th class="st1">S.No</th>
												<th class="st1">Employee Id</th>
												<th class="st1">Employee Name</th>
												<th class="st1">Type</th>
												<th class="st1">Severity</th>
												<th class="st1">Details</th>
												<th class="st1">Mobile No</th>
												<th class="st1">Registered MobileNo</th>
												<th class="st1">Fixed/Not Fixed</th>
											</tr>
										</thead>
										<tbody>	

						<%
						
						if(details!=null){
						int i=1;
						for(GrievanceDetailsModel grievance:details){ %>
							<tr class="st1">
								<td><%=i%></td>
								<td><%=grievance.getEmpId()%></td>
								<td><%=grievance.getName()%></td>
								<%if(grievance.getGrievancetype()==1){%>
								
								<td><span>Pay And Benefits</span></td>
								<% }else if(grievance.getGrievancetype()==2){%>
								<td><span>Work Loads</span></td>
							<% }
							else if(grievance.getGrievancetype()==3)
								{%>
								<td><span>Work Conditions</span></td>
								<% }else{%>
										
										<td><span>Union And Management Relations</span>
									
									<%}%>
								<%if(grievance.getGrievancesevere()==1){%>
								<td><span class="label label-info">Less Severe</span></td>
								<% }else if(grievance.getGrievancesevere()==2)	{%>
								<td><span class="label label-primary">Moderate</span></td>
							
							<% }else if(grievance.getGrievancesevere()==3) {%>
								<td><span class="label label-default">Normal</span></td>
							<% }
							else if(grievance.getGrievancesevere()==4)
								{%>
								<td><span class="label label-warning">Severe</span></td>
							  <% }else{%>
										
										<td><span class="label label-danger blink">More Severe</span>
									
									<%}%>
								<td><%=grievance.getGrievancedetails()%></td>
								<td><%=grievance.getMobileNo()%></td>
								<td><%=grievance.getEmpmobileno()%></td>
								<%if(grievance.getStatus().equals("NF")){ 
								if(null!=userData && userData.getUid()==0){%>
								<td> <input type="button" class="btn btn-primary" name="fix" value="FIX NOW" onclick="fixgrievance('<%=grievance.getGid()%>')"  id="gstatus"></td>
								<%}else{ %>
								<td> <span class="label label-danger">Not Fixed</span></td>
								<%} %>
								<%}else{ %>
								<td><span class="label label-success">Fixed</span></td>
								<%}i++;} }%>
							</tr>
						
							
						</tbody>
					</table>
				</div>
				</div>
			</div>
		</div>

</div>
</div>
</div>
</div>
</div>


<link rel="stylesheet" href='<c:url value="/static/css/tokenize2.min.css"/>' />
  <script src='<c:url value="/static/js/tokenize2.min.js"/>'></script>
  <script>
  $('.tokenize-demo').tokenize2();
 
  
  </script>
  
  

<script type="text/javascript" src='<c:url value="/static/js/jquery.dataTables.min.js"/>'></script> 
<link rel="stylesheet" href='<c:url value="/static/css/jquery.dataTables.min.css"/>' />



</body>
</html>