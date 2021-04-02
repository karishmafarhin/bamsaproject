<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.bamsa.web.model.EmployeeTaskModel"%>
<%@page import="com.bamsa.web.model.EmployeeModel"%>
<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.TaskDetailsModel" %>
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
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    
    <meta name="author" content="">



<title>Milestones</title>

<style>
.btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
    color: #333;
    background-color: #369 !important;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
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

    </style>

 <script type="text/javascript">
 'use strict';
            $(document).ready(function() {

                $('#dialogbox').dialog({
                	
                    autoOpen: false,
                    width:"auto",
                    title: 'Employees Working on this Project',
                   
                });
            });
           
         function opendialog(npid){
        	 $('#dialogbox').dialog('close');
        	 $('#dialogbox').dialog('open');
    	$.ajax({
    		type: "post",
    		url: "/bamsa/projectperformance?npid="+npid,
    		
    		success:function(teamData){
    			
    			console.log(teamData);
    			var customers = new Array();
    		    customers.push(["Employee ID", "Name","Branch Name","Performance"]);
    		    
    		    //Create a HTML Table element.
    		    var table = document.createElement("TABLE");
    		    console.log(table);
    		    table.border = "2";
    		 
    		    //Get the count of columns.
    		    var columnCount = customers[0].length;
    		 
    		    //Add the header row.
    		    var row = table.insertRow(-1);
    		    for (var i = 0; i < columnCount; i++) {
    		        var headerCell = document.createElement("TH");
    		        headerCell.innerHTML = customers[0][i];
    		        row.appendChild(headerCell);
    		    }
    		 
    		    //Add the data rows.
    		    for (var i = 0; i < teamData.team.length; i++) {
    		        row = table.insertRow(-1);
    		        
    		            var cell = row.insertCell(0);
    		            cell.innerHTML = teamData.team[i].empid;
    		            var cell = row.insertCell(1);
    		            cell.innerHTML = teamData.team[i].name;
    		            var cell = row.insertCell(2);
    		            cell.innerHTML = teamData.team[i].branchname;
    		            
    		            var cell = row.insertCell(3);
    		           
    		            console.log(teamData.team[i].npid);
    		            cell.innerHTML = '<input type="button" value="performance" class="btn btn-primary" onclick="getperform(\''+teamData.team[i].empid+'\''+','+'\''+teamData.team[i].npid+'\');" />';
    		        							
    		            
    		    }
    		 
    		    var dvTable = document.getElementById("dvTable");
    		    dvTable.innerHTML = "";
    		    dvTable.appendChild(table);
    		},
    		   		
    		error:function(){alert("Please verify the Details")}
    		 
    	});	
    	  
      };
         
      function getperform(empid,npid) {
      	console.log("hi i am at perform");
          var myWindow = window.open("../bamsa/empperformance?empid="+empid+"&npid="+npid, "window", "width=430,height=460");
       
      }      
         
         
         
               
        </script>
        
        <%
List<TaskDetailsModel> projectdetails = (List)request.getAttribute("projectdetails");
        %>
       <script>
$( document ).ready(function() {
	$("#milestones").addClass("act");
});
	
</script> 
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
             
               <div class="right_col" role="main">
          <div class="">
           <div class="row">
 <div><center ><h3 style="color:#004d99"><b>Milestones</b></h3></center></div>
 <div><h2></h2></div>
   <marquee class="element"  scrollamount="10"><h4><b>Project(s) undergoing <%=projectdetails.size()%></b></h4></marquee>
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
               <%for(TaskDetailsModel project:projectdetails){%>
		<div class="row" style="margin-right:0px">
            <div class="panel panel-default panel-table" style="height: 236px;">
           
             <div class="panel-heading st3">
                <div class="row">
                  <div class="col col-xs-12">
                   <h2 class="panel-title" style="color:white;text-align:center;"><b><%=project.getProjectname() %></b></h2>
                  </div>
                  
                </div>
              </div>
              <div class="list-group">
              
             
           <div class="list-group-item  st4" style="border: none;height: 200px;">
                <div class="media col-md-3">
                      <img
					src=<%=project.getProjectpic() %>>  &nbsp;
                </div>
                <div class="col-md-6">
                 
               <div>
                <h4 class="list-group-item-heading ">Progress:&nbsp;<%=project.getPercentagecompleted() %>%</h4>
                    <h5><p class="list-group-item-text st5"><b><progress value="<%=project.getPercentagecompleted()%>" max="100"></progress></b> </p></h5>
                </div>
                <div>
                <h4 class="list-group-item-heading ">Deadline:</h4>
                    <h5><p class="list-group-item-text st5"><b><%=project.getDeadline() %></b> </p></h5>
                </div>
                <div>
                <h4 class="list-group-item-heading "><%=project.getProjectname() %>&nbsp;description:</h4>
                    <h5><p class="list-group-item-text st5"><b><%=project.getTaskDescription() %></b> </p></h5>
      	</div>
      	
                
                    </div>
                    <div class="col-md-3 text-center">
                   <h2> <small><b> <%=project.getTeam().size()%> Employees</b> </small></h2>
                    
                   
                    <input type="button" onclick="opendialog('<%=project.getNpid() %>')" class="btn btn-default btn-lg btn-block buttonclass" value="View detailed results"/>  
                    </div>
      
         </div>
    <hr>
              </div>
              </div>
              </div>
               <%} %>   
              
             <div class="col-md-6 alert alert-info" id="dialogbox">
             
              <div id="dvTable">
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

				
				
		</body>
		</html>
		
 
