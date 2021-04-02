<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.bamsa.web.model.EmployeeTaskModel"%>
<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel" %>

<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<% 
UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);


if(userData == null)
{
	response.sendRedirect("/bamsa");	
}
%>
<%
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

boolean showmytask=true;
boolean showrdepartment =false;

if(null!=empModel && empModel.getDesigId()==0){
	showmytask=false;
}
if(null!=empModel && (empModel.getDesigId()==7 || empModel.getDesigId()==8 )){
	showrdepartment=true;
}
%>
<title>My Tasks</title>



<script  type="text/javascript" src='<c:url value="/static/js/jquery-1.11.1.min.js"/>'></script>
<script  type="text/javascript" src='<c:url value="/static/js/jquery-ui.min.js"/>'></script>
<link rel="stylesheet" href='<c:url value="/static/css/jquery-ui.css" />'/>
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
<script>
 
 function checkval() {

	    if ($('#notcomp').is(':checked')) {
	        
	    	 $("#textarea").show();
	         $("#comp").attr("checked", false);//uncheck all checkboxes
	         $("#inprocess").attr("checked", false);//uncheck all checkboxes
	         $("#percentage").hide();
	         $("#textareas").hide();
	         
	         $(this).attr("checked", true); 
	    } else if($('#inprocess').is(':checked')){
	    	
	    		 $("#textareas").show();
		         $("#percentage").show();
		         $("#comp").attr("checked", false); 
		         $("#notcomp").attr("checked", false); 
		         //uncheck all checkboxes
		         $(this).attr("checked", true); 
	    }
	    	 else{
	    		 if($('#comp').is(':checked')){
		    		 $("#notcomp").attr("checked", false); 
		    		 $("#inprocess").attr("checked", false); 
		    		 //uncheck all checkboxes
			         $(this).attr("checked", true);  
		    	 }
         
	    	 else {
	    		 $("#textarea").hide();
	            $("#percentage").hide();
	            $("#textareas").hide();
	            
	    
	}
 }
 }

	
</script>
 <script type="text/javascript">
            $(document).ready(function() {

                $('#dialogbox').dialog({
                    autoOpen: false,
                    width:"500px",
                    title: 'Remarks'
                });
            });
         function opendialog(tid){
                	
          
           $('#dialogbox').dialog('open');
           $("#errorbox").empty();
           $('#ta').val("");
       	$('#tas').val("");
       	$('#percent').val("");
       	$('#comp').attr('checked', false);
       	$('#notcomp').attr('checked', false);
       	$('#inprocess').attr('checked', false);
       	
           var tid =document.getElementById("tid").value=tid;
           console.log(tid);
           checkval(); // this is launched on load
   	    $('#notcomp').click(function () {
   	        checkval(); // this is launched on checkbox click
   	    });
   	    $('#comp').click(function () {
   	        checkval(); // this is launched on checkbox click
   	    });
   	    $('#inprocess').click(function () {
   	        checkval(); // this is launched on checkbox click
   	    });
         };
      function submitremark(){
    	  
    	  var checkboxes = $("input[type='checkbox']");
          if(checkboxes.is(":checked")){
        	 if($('#notcomp').is(':checked')){
        		 console.log("hi");
        		 console.log($("#ta").val());
        		  if($("#ta").val()===undefined ||$("#ta").val()===""){
        			 document.getElementById("ta").focus();
        			document.getElementById("errorbox").innerHTML = "Please Enter the backlog for not completed task";
        		  	return false;
        		  }
        		  else{
        			  var backlog = $("#ta").val();
        				var percentagecompleted =$("#notcomp").val();
        				$("#backlog").val(backlog);
        				$("#percentagecompleted").val(percentagecompleted);
        			 var formData = $("#remark").serializeArray();
        			  ajaxcall(formData);
        		  }
         	       
         	    }
        	 else if($('#inprocess').is(':checked') ){
        		 	console.log($("#percent").val());
         	    	if($("#tas").val()===undefined ||$("#tas").val()===""){
         	    		 document.getElementById("tas").focus();
            			document.getElementById("errorbox").innerHTML = "Please Enter the Query for In process task";
            			return false;
            		  }
         	    	
         	    	else {
         	    		var x = parseFloat($("#percent").val());
         	    		if ($("#percent").val()=="" || isNaN(x) || x < 1 || x > 99) {
         	    		 document.getElementById("percent").focus();
            			document.getElementById("errorbox").innerHTML = "Please Enter the percentage of task completed from 1 to 99";
         	    		return false;
         	    	}
            		  else{
            			  var query = $("#tas").val();
          				var percentagecompleted =$("#percent").val();
          				$("#query").val(query);
          				$("#percentagecompleted").val(percentagecompleted);
            			   var formData = $("#remark").serializeArray();
            			  ajaxcall(formData);
            		  }
         	    	}
         	    }
        	 else {
        		 var percentagecompleted =$("#comp").val();
        		$("#percentagecompleted").val(percentagecompleted);
        		 var formData = $("#remark").serializeArray();
   			  ajaxcall(formData);
        	 }
        	  
          }
             
          else{
        	   document.getElementById("errorbox").innerHTML = "Please Select at least one checkbox";
        	  
          }
    	  
      } ; 
      
    function  ajaxcall(formData){
    	$.ajax({
    		type: "post",
    		url: "/bamsa/submittaskStatus",
    		data:formData,
    		success:function(){alert("You successfully submitted your Task Status");
    		$("#dialogbox").dialog("close");
    		},
    		error:function(){alert("Please verify the Details")}
    		 
    		 
    	});	
    	  
      };
         
         
         
         
         
               
        </script>
        
        <%
List<EmployeeTaskModel> details = (List)request.getAttribute("EmployeeTask");
        int deadline=0;
        if((Integer)request.getAttribute("empdeadline")!=0){
 deadline =(Integer)request.getAttribute("empdeadline");
        }   %>
   <script>
$( document ).ready(function() {
	$("#mytask").addClass("act");
	$("#Mytask").addClass("actv");
});
$(document).ready(function(){
    $('#myTable').DataTable();
});
</script>     
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
             
              
             <div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
          <%
if(deadline>0){

%>
    	<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			<span><strong>Alert: you have <%=deadline %> (task)s to complete within three days</strong>  </span>
		</div>
	<%} else{%>
	<div></div>
	<%} %>
  
  
  
              <div style="/*! margin-left: 161px; */" class="col col-xs-12">
      
 <div class="btn-group btn-breadcrumb">
          <%if(showmytask){ %>
          <a href="Mytask" id="Mytask" class="btn btn-info">My Task</a>
            <%} %>
            <a href="Newtask" id="assigntask" class="btn btn-info">Assign Task</a>
            <a href="Taskstatus" class="btn btn-info">Task Status</a>
                   </div>            
            
        </div>
  

	<div class=" col-xs-3 col-xs-offset-9">
	<a href="<%=request.getContextPath( )%>/MytaskExcel"><button type="button" class="btn btn-primary"><i class="fa fa-file-excel-o" aria-hidden="true"><b>Excel</b></i></button></a>
    <a href="<%=request.getContextPath( )%>/TaskPdf"><button type="button" class="btn btn-success"><i class="fa fa-file-pdf-o" aria-hidden="true"><b>PDF</b></i></button></a>
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
 
	
	<div>
	<h1></h1>
	</div>
             <div class="container-fluid">
		<div class="row" style="margin-right:0px">
            <div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h2 class="panel-title text-right" style="font-size: 21px!important"><b>Tasks Tracking Sheet</b></h2>
                  </div>
                  
                </div>
              </div>
               
               
              <div class="table-responsive tabi">
              <table id="myTable" class="table table-striped table-bordered table-list" style="text-align: center;" id="dev-table">
                  <thead>
								<tr class="st1">
                                <th class="info st1" >S.No</th>
								<th class="info st1" >Employee Id</th>
								<th class="info st1" >Project Name</th>
								<th class="info st1" >Task Description</th>
								<th class="info st1" >Task Type</th>
								<th class="info st1" >Given By</th>
								<th class="info st1" >Given Date</th>
								<th class="info st1" >Deadline</th>
						        <th class="info st1"> Status</th>
						        <th class="info st1" >If Updated Reason</th>
								<th class="info st1" >Remarks</th>
								
								
							</tr>
							
							
						</thead>
						<tbody>
						 <% int i=1;
                        for(EmployeeTaskModel emptask:details){
                        %>
							<tr class="st1">
								
                                <td ><%=i%></td>
								<td ><%=emptask.getEmpid()%></td>
								<td ><%=emptask.getProjectname() %></td>
								<td ><%=emptask.getTaskdescription()%></td>
								<%String task=Character.toString(emptask.getTasktype() );
								if(task.equals("P")) {%>
								<td>Project</td>
								<%}else { %>
								<td>Task</td>
								<%} %>
								<td ><%=emptask.getGivenbyname()%></td>
								<td style='white-space:nowrap;' ><%=emptask.getGivendate()%></td>
								<td style='white-space:nowrap;'><%=emptask.getDeadline()%></td>
								
								<%
								
								
					            Date today =new Date();
												
								if(emptask.getStatus().equals("NC") && today.after(emptask.getDeadline())){%>
										<td><div><span class="label label-danger blink">Not Started</span>&nbsp;<span class="label label-danger blink brr">Over Due</span></div></td>
									<%}else if(emptask.getStatus().equals("IP") && today.after(emptask.getDeadline())) {%>	
										<td><div><span class="label label-warning">In Process</span>&nbsp;<span class="label label-danger blink brr">Over Due</span></div></td>
									<%}else if(emptask.getStatus().equals("NC")){ %>
									<td><div><span class="label label-danger blink">Not Started</span></div></td>
									<%}else if(emptask.getStatus().equals("IP")) {%>
									<td><div><span class="label label-warning">In Process</span></div></td>
									
															
									<%}
								else
										{%>
										
										<td><span class="label label-success">Completed</span></td>
									
									<% }%>
										<%if(emptask.getReason()==null ){%>
								<td>----</td>
								<%}else{ %>
								<td><%=emptask.getReason() %></td>
								<%} %>
                            <td> <input type="button" value="Remarks" onclick="opendialog('<%=emptask.getTid()%>')" class="btn btn-info btn-md" /></td>
								
                           
							
							</tr>
						<%i++;}%>	
								</table>		  
						</tbody>
              
  
  
      
       
              
				
				
            </div> 
              </div>
              
             <div class="col-md-6 alert alert-info " id="dialogbox" style="display:none;" >
             <b><p id="errorbox" style="text-align:center;color:red;font-size: 15px"></p></b>
             <form id="remark" method="post" action="remarks">
                        <div class="form-group ">
                             <label><b>status:</b></label>
                           Completed&nbsp;<input type="checkbox" id="comp" name="chkstatus" value="100"> 
                           Not Started&nbsp;<input type="checkbox" id="notcomp" name="chkstatus" value="0">
                           In Process&nbsp;<input type="checkbox" id="inprocess" name="chkstatus" value="">
                           
                        
                        </div>
                  <div class="form-group " id="textarea">Backlogs/Bugs:<textarea id="ta" rows="4" cols="40" placeholder="Write valid reason"></textarea></div>
                   <div class="form-group " id="textareas">Query:<textarea id="tas"rows="6" cols="40"></textarea></div>
                      
                      <div id="percentage">  Percentage Completed:<input id="percent" type="number" max="99" min="1" />
<p id="s"></p></div>
                      
                          <div>  <center><button type="button" onclick="submitremark()" class="btn btn-primary">Submit</button></center>
		                          <input type="hidden" id="tid" name="tid" />
		                          <input type="hidden" id="percentagecompleted" name="percentagecompleted" value=""/>
									<input type="hidden" id="query" name="query" value=""/>
									<input type="hidden" id="backlog" name="backlog" value=""/>
									
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

				
				
		</body>
		

<script type="text/javascript" src='<c:url value="/static/js/jquery.dataTables.min.js"/>'></script> 
<link rel="stylesheet" href='<c:url value="/static/css/jquery.dataTables.min.css"/>' />
		</html>
		
 