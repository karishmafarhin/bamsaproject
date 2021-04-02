<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.util.List"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.AssetTicketModel"%>
<%@page import="com.bamsa.web.model.EmployeeModel"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>TicketDetails</title>
<% 
UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
if(userData == null)
{
	response.sendRedirect("/bamsa");	
}
%>
<%
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

List<AssetTicketModel> ticketdetails=(List)request.getAttribute("ticketDetails"); 
List<EmployeeModel> employeedetails = (List)request.getAttribute("empdetails"); 

%>
<% 

 boolean  showall=false;
 
 if(null!=empModel && (empModel.getStreamId()==0|| empModel.getStreamId()==6)) {
 	 showall=true;
 }
 
 %>
<script type="text/javascript" src='<c:url value="/static/js/jquery-1.11.1.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/static/js/jquery-ui.min.js"/>'></script>
<link rel="stylesheet" href='<c:url value="/static/css/jquery-ui.css" />'/>

<style>
.active {
	font-weight: bold;
	background-color: #fff !important;
}
.tabi {

    overflow-x: scroll !important;
}
</style>
<!-- HTML code from Bootply.com editor -->
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
<script>
$( document ).ready(function() {
	$("#assets").addClass("act");
	$("#showticket").addClass("actv");
});


</script>
<script>
function updatefunction(atid,ts,rs,bs){
	
	$.ajax({
		type:"post",
		url:"updateticketstatus?atid="+atid+"&ts="+ts+"&rs="+rs+"&bs="+bs,
		success: function(){alert("Fixed/Approved");},
		error: function(){alert("Not updated");}
		
		
	});
};

</script>
<script>
$(document).ready(function(){
    $('#myTable').DataTable();
});	
</script>
</head>

             <div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
            <div class="page-title">
  
  
  
              <div style="/*! margin-left: 161px; */" class="col col-xs-12">
       <div class="btn-group btn-breadcrumb">
             <%if(showall){ %>
            <a href="showTicket" id="riseticket" class="btn btn-info">Raise Ticket</a>
            <a href="viewTicket" id="showticket" class="btn btn-info">Ticket Show</a>
            <a href="CompanyAssets" class="btn btn-info">Create New</a>
            <a href="licensedetails" class="btn btn-info">View All</a>
            <%}else{ %>
             <a href="showTicket" id="riseticket" class="btn btn-info">Raise Ticket</a>
            <a href="viewTicket" id="showticket"class="btn btn-info">Ticket Show</a>
            <%} %>
        </div>
        
	</div>
	<div class=" col-xs-3 col-xs-offset-9">
	<a href="<%=request.getContextPath( )%>/TicketDetailsExcel"><button type="button" class="btn btn-primary"><i class="fa fa-file-excel-o" aria-hidden="true"><b>Excel</b></i></button></a>
    <a href="<%=request.getContextPath( )%>/TicketDetailsPdf"><button type="button" class="btn btn-success"><i class="fa fa-file-pdf-o" aria-hidden="true"><b>PDF</b></i></button></a>
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
				
             
             
	
					<div class="board-inner">
						
					</div>

					<div class="tab-content">
						<div class="tab-pane fade in active" id="home">				
		<div class="row" style="margin-right: auto;margin-left: 2px;">

            <div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                
                    <h2 class="panel-title text-center"><b>Ticket Details</b></h2>
                
                  
                </div>
              </div>
               <div class="table-responsive tabi">
              <table id="myTable" class="table table-striped table-bordered table-list" style="text-align: center;" id="dev-table">
							<thead>
								<tr class="st1">
                                <th class="info" >S.No</th>
                                <th class="info" >Asset Type</th>
                                <th class="info" >Tag</th>
                                <th class="info" >Request To</th>
								<th class="info" >Purpose</th>
								<th class="info" >Remarks</th>
								<th class="info" >Raised By</th>
                                <th class="info" >Raised Date</th>
								<th class="info" >status</th>
								<th class="info" >From Date</th>
								 <th class="info" >To Date</th>
                                <th class="info" >Approved By</th>
								<th class="info" >Approved Date</th>
								
							</tr>
						</thead>
						<tbody>
						
						<%
								int i=1;
								if(null!=ticketdetails){
                                 for(AssetTicketModel ticket:ticketdetails){
                                	
                                  %>
							<tr class="st1">
                                <td ><%=i%></td>
								<td ><%=ticket.getAssettype()%></td>
								<td ><%=ticket.getTag()%></td>
								<% for(EmployeeModel emp1:employeedetails){
									if(ticket.getRequestto()==emp1.getUid())
									{%>
										<td ><%=emp1.getEmpId()%></td>
									<%}}%>
							
								<td><%=ticket.getPurpose()%></td>
								<td><%=ticket.getRemarks()%></td>
								<td><%=ticket.getEmpid()%></td>
								<td style='white-space:nowrap;'><%=ticket.getRiseddate()%></td>
								
								<%
							      Date today=new Date();
								if(ticket.getPurpose().equals("Taking Home") && null!=ticket.getThstatus()){ 
									
									if(ticket.getThstatus().equals("NA"))  {%>
				                        <%if(empModel.getStreamId()==6){%>
										<td><button  class="btn btn-info btn-sm" onClick="updatefunction('<%=ticket.getAtid()%>','<%=ticket.getThstatus()%>','<%=ticket.getRstatus()%>','<%=ticket.getBstatus()%>')">APPROVE NOW</button></td>
								        <%}else{ %>
								       <td><span class="label label-danger ">NOT APRROVED</span></td>
								        <% }%>
								<% }%><%else{%>
										<td><span class="label label-success">APPROVED</span></td>
									<% }%>
								
								<td style='white-space:nowrap;'><%=ticket.getFromdate()%></td>
								<td style='white-space:nowrap;'><%=ticket.getTodate()%></td>
								<%}
								else if(ticket.getPurpose().equals("Broken") && null!=ticket.getBstatus()){ 
									if(ticket.getBstatus().equals("NF") && today.after(ticket.getRiseddate())){%>
								
										<%if(empModel.getStreamId()==6){%>
										<td><button  class="btn btn-info btn-sm" onClick="updatefunction('<%=ticket.getAtid()%>','<%=ticket.getThstatus()%>','<%=ticket.getRstatus()%>','<%=ticket.getBstatus()%>')">FIX NOW</button></td>
								        <%}else{ %>
								        <td><span class="label label-danger">NOT FIXED</span></td>
								        <% }%>
								<% 	}else{%>
										<td><span class="label label-success">FIXED</span></td>
									<% }%>
								
								<td>---</td>
								<td>---</td>
								<%}
								
								
								else if(ticket.getPurpose().equals("Repair") && null!=ticket.getRstatus()){ 
									if(ticket.getRstatus().equals("NF")){%>
										<%if(empModel.getStreamId()==6){%>
										<td><button  class="btn btn-info btn-sm" onClick="updatefunction('<%=ticket.getAtid()%>','<%=ticket.getThstatus()%>','<%=ticket.getRstatus()%>','<%=ticket.getBstatus()%>')">FIX NOW</button></td>
								        <%}else{ %>
								        <td><span class="label label-danger">NOT FIXED</span></td>
								        <% }%>
								<% 	}else{%>
										<td><span class="label label-success">FIXED</span></td>
									<% }%>
								
								<td>---</td>
								<td>---</td>
								<%} 
								
								else{ 
									%>
								<td><span class="label label-danger blink">LOST</span></td>
								<td>---</td>
								<td>---</td>
								<%} %>
								
								
								<% if(ticket.getApprovedby()!=0 && null!=ticket.getApproveddate()){%>
								  <% for(EmployeeModel emp:employeedetails){
									if(ticket.getApprovedby()==emp.getUid())
									{%>
								  <td ><%=emp.getEmpId()%></td>
								  <%}}%>
								<td style='white-space:nowrap;'><%=ticket.getApproveddate()%></td>
								<%}else{ %>
								<td>---</td>
								<td>---</td>
								<%} %>
								
							</tr>
						<%i++;}}%>	
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
            
						
						 </div>
						  </div>
						  </div>
						  </div>
	</section>

<script type="text/javascript" src='<c:url value="/static/js/jquery.dataTables.min.js"/>'></script> 
<link rel="stylesheet" href='<c:url value="/static/css/jquery.dataTables.min.css"/>' />
</body>
</html>