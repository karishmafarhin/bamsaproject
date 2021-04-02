<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.bamsa.web.model.TaskDetailsModel"%>
<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel" %>


<title>Task Status</title>
<!DOCTYPE html>
<% 
UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);


if(userData == null)
{
	response.sendRedirect("/bamsa");	
}
%>
<script type="text/javascript" src='<c:url value="/static/js/jquery-1.11.1.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/static/js/jquery-ui.min.js"/>'></script>
<link rel="stylesheet" href='<c:url value="/static/css/jquery-ui.css" />'/>
 <%
List<TaskDetailsModel> details = (List)request.getAttribute("TaskDetails");      
 %>
 <%
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);
 
 boolean showmytask=true;

if(null!=empModel && empModel.getDesigId()==0){
	showmytask=false;
}
boolean showrdepartment = false;
if(null!=empModel && (empModel.getDesigId()==7 || empModel.getDesigId()==8 )){
	showrdepartment=true;
}
%>
<style>
 .ui-dialog .ui-dialog-titlebar-close {
    position: absolute;
    right: .3em;
    top: 50%;
    width: 50px !important;
    margin: -10px 0 0 0;
    padding: 1px;
    height: 23px !important;
    color: gray !important;
    }
     .tabi {

    overflow-x: scroll !important;
}
    </style>
<script type="text/javascript">

$(function() {	
	
	$("#dialogbox").dialog({
	    autoOpen: false,
	    width: "auto",
	     title:"Update Percentage"  
	   
	});
		
});	
</script>
<script>
function openDialog(tid,empid,percentage){
	$("#dialogbox").dialog('open');
	 $('#reason').val("");
	$("#errorbox").empty();
	var taskid=document.getElementById("tid").value=tid;
	var perc=document.getElementById("percent").value=percentage;
	console.log(taskid);
	console.log(empid);
	console.log(percentage);
	document.getElementById("tasktitle").innerHTML = "update percentage for "+empid;
	$("#tid").val(taskid);
}
function updatePercentage(){
	var percentageupdated = $("#percent").val();
	var updatereason =$("#reason").val();
	var x = parseFloat(percentageupdated);
	if (isNaN(x) || x < 0 || x > 100) {
	   		document.getElementById("errorbox").innerHTML="please enter between 0-100";
		 $('#percentage').focus();
		 return false;
     }
	if(updatereason==""){
		document.getElementById("errorbox").innerHTML="please fill the field";
		 $('#percent').focus()
			return false;
	}
     else
    {
    $("#percentagecompleted").val(x);
    $("#updatereason").val(updatereason);
	var formData = $("#updatepercentage").serializeArray();
	console.log(formData);
	$.ajax({
		type: "post",
		url: "/bamsa/updatePercentage",
		data:formData,
		success:function(){alert("You successfully updated the percentage details");
		
		$("#dialogbox").dialog("close");
	
		
		},
		error:function(){alert("Please verify the Details")}
		 
	  });
	  return true;
	  }
}
</script>
    <script>
$( document ).ready(function() {
	$("#mytask").addClass("act");
	
	$("#taskstatus").addClass("actv");
});
$(document).ready(function(){
    $('#myTable').DataTable();
});	

    var table = $('#myTable').removeAttr('width').DataTable( {
        
        columnDefs: [
            { width: 200, targets: 0 }
        ],
        fixedColumns: true
    } );
    </script> 
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
             
              <div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
          
  
  
  
              <div class="col col-xs-12">
      
 <div class="btn-group btn-breadcrumb">
          <%if(showmytask){ %>
          <a href="Mytask" class="btn btn-info">My Task</a>
            <%} %>
            <a href="Newtask" id="assigntask" class="btn btn-info">Assign Task</a>
            <a href="Taskstatus" id="taskstatus" class="btn btn-info">Task Status</a>
            
        </div>            
            
        </div>
  

	<div class=" col-xs-3 col-xs-offset-9">
	<a href="<%=request.getContextPath( )%>/EmployesTaskExcel"><button type="button" class="btn btn-primary"><i class="fa fa-file-excel-o" aria-hidden="true"><b>Excel</b></i></button></a>
    <a href="<%=request.getContextPath( )%>/EmployeeTaskpdf"><button type="button" class="btn btn-success"><i class="fa fa-file-pdf-o" aria-hidden="true"><b>PDF</b></i></button></a>
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
                <div class="x_panel">
                
                  <div class="x_content">
 
             
             
<div class="content-wrapper">
 
	<div>
	<h1></h1>
	</div>
	<div class="container-fluid">
		<div class="row" style="margin-right:0px">

            <div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-12">
                    <h2 class="panel-title text-center"><b>Task Status</h2></b>
                  </div>
                  
                </div>
              </div>
               
               
              <div class="table-responsive tabi">
              <table id="myTable" class="table table-striped table-bordered table-list" style="text-align: center;" id="dev-table">
                  <thead>
								<tr class="st1">
                                <th class="info" >Employee Id</th>
                                <th class="info" >Project Name</th>
                                <th class="info" >Task Description</th>
                                <th class="info" >Task Type</th>
                                <th class="info" >Given Date</th>
								<th class="info" >Deadline</th>
								<th class="info" >Status</th>
								<th class="info" >Percentage completed</th>
								<th class="info" >Backlogs</th>
								<th class="info" >Queries</th>
							</tr>
						</thead>
						<tbody>
						<%
                                 for(TaskDetailsModel tasks:details){
                                  %>
							<tr class="st1">
                                <td ><%=tasks.getEmpid()%></td>
                                <td><%=tasks.getProjectname() %></td>
								<td ><%=tasks.getTaskDescription()%></td>
								<%String task=Character.toString(tasks.getTasktype() );
								if(task.equals("P")) {%>
								<td>Project</td>
								<%}else { %>
								<td>Task</td>
								<%} %>
								<td style='white-space:nowrap;'><%=tasks.getGivendate()%></td>
								<td style='white-space:nowrap;'><%=tasks.getDeadline()%></td>
								<%
								
								
					            Date today =new Date();
												
								if(tasks.getStatus().equals("NC") && today.after(tasks.getDeadline())){%>
										<td><div><span class="label label-danger blink">Not Started</span>&nbsp;<span class="label label-danger blink brr">Over Due</span></div></td>
									<%}else if(tasks.getStatus().equals("IP") && today.after(tasks.getDeadline())) {%>	
										<td><div><span class="label label-warning">In Process</span>&nbsp;<span class="label label-danger blink brr">Over Due</span></div></td>
									<%}else if(tasks.getStatus().equals("NC")){ %>
									<td><div><span class="label label-danger blink">Not Started</span></div></td>
									<%}else if(tasks.getStatus().equals("IP")) {%>
									<td><div><span class="label label-warning">In Process</span></div></td>
									
															
									<%}
								else
										{%>
										
										<td><span class="label label-success">Completed</span></td>
									
									<% }%>
								<td ><progress value="<%=tasks.getPercentagecompleted()%>" max="100"></progress><a href = "#!" id="sign" onclick="openDialog('<%=tasks.getTid()%>','<%=tasks.getEmpid()%>','<%=tasks.getPercentagecompleted()%>')"><%=tasks.getPercentagecompleted()%>%</a></td>
							
								<%if(tasks.getBacklogs()==null){
									%>
								<td>----</td>
								<% }
								else{
									%>
									 <td ><%=tasks.getBacklogs()%></td>
								<% }if(tasks.getQueries()==null){
								%>
							   <td>----</td>
							   <%}else{
								%>
							   <td ><%=tasks.getQueries()%></td>
							    <%} %>
							</tr>
						<%}%>	
								</table>		  
						</tbody>
            </div> 
            <div class="col-md-6 alert alert-info" id="dialogbox">
             <b><p id="tasktitle" style="text-align:center;color:black;font-size: 15px"></p></b>
             <b><p id="errorbox" style="text-align:center;color:red;font-size: 15px"></p></b>
             <form id="updatepercentage" method="post" action="updatePercentage">   
                <div id="percentage">  Percentage Completed:<input id="percent" type="number" max="99" min="1" />
               <p id="s"></p></div>
               <div>
                Update Reason :
                <p><textarea rows="3" cols="54" name="reason" id="reason" class="reason" /></textarea></p>
                </div>      
                          <div>  <button type="button" onclick="updatePercentage()" class="btn btn-primary">Submit</button>
		                          <input type="hidden" id="tid" name="tid" />
		                          <input type="hidden" id="percentagecompleted" name="percentagecompleted" value=""/>		
                                   <input type="hidden" id="res" name="res" />
                                   <input type="hidden" id="updatereason" name="updatereason" value=""/> 
                        </div>
                        </form>
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


<script type="text/javascript" src='<c:url value="/static/js/jquery.dataTables.min.js"/>'></script> 
<link rel="stylesheet" href='<c:url value="/static/css/jquery.dataTables.min.css"/>' />
		</body>
		</html>
		
 