<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.bamsa.web.model.TaskDetailsModel"%>
<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.CandidateInfoModel"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel" %>


<title>Hotlist Candidates</title>
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
<%List<CandidateInfoModel> opening=(List)request.getAttribute("hotlist");


String successmessage =(String)request.getAttribute("successmessage");
if(successmessage==null){
	successmessage="";
}
String errormessage =(String)request.getAttribute("message");
if(errormessage==null){
	errormessage="";
}


%>

<script>
$(document).ready(function(){
    $('#myTable').DataTable();
});
</script>
<body>
 <jsp:include page="header.jsp" />
 <script>
   $(document).ready(function() {
		 $("[required]").after("<span class='required'>*</span>");
		});
   function newwin(path) {              
	   myWindow=window.open('../bamsa/showresume?path='+path,'_blank').focus();
	  };
   function oldwin(path){
	   myWindow=window.open('../bamsa/showcoverletter?path='+path,'_blank').focus();
   };
   </script>
<script type="text/javascript">
            $(document).ready(function() {

                    $( ".datepickers" ).datepicker({
                    	dateFormat: 'dd-mm-yy',
                      changeMonth: true,//this option for allowing user to select month
                      changeYear: true,//this option for allowing user to select from year range
                      yearRange: "-100:+100"
                     });
                    
          
                
                $('#nonmodal3').dialog({
                	 
                     autoOpen: false,
                     width:"900px",
                     title: 'Edit Hotlist Candidate Details',
                     position: {
                       my: 'center',
                      
                     }
                   
                });
            });
         function opendialog(completedetails){
           var details =completedetails.split('~');
           console.log(details);
           $('#nonmodal3').dialog('open');
       
        $('#firstname').val(details[0]);
       	$('#lastname').val(details[1]);
       	$('#email').val(details[2]);
       	$('#contact').val(details[3]);
       	$('#state').val(details[4]);
       	$('#city').val(details[5]);
       	$('#status').val(details[6]);
        $('#af').val( details[7]);
     	$('#reloc').val(details[8]);
     	$("input[name=gender][value=" + details[9] + "]").attr('checked', 'checked');
     	if(details[11]=='Y'){
     	$('#hotlist').prop('checked', true);
     	}
     	else{
     		$('#hotlist').prop('checked', false);
     	}
       	$('#ssn').val(details[12]);
       	$('#billrate').val(details[13]);
     	$('#rate').val(details[14]);
       	$('#skills').val(details[16]);
       	$('#middlename').val(details[17]);
       	$('#ciid').val(details[18]);
       	console.log(details[10]);
    	console.log(details[11]);
       
  
         };
     
         
         
         
         
               
        </script>

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


.form header,
.form footer {
  padding: 1em;
  width: 100%;
}
.form select{
background: #f8e39b;
width: 100%;
height: 37px;
}

.form header {
  font-size: 1.6em;
  margin-left: -40px;
}

.form footer {
  box-sizing: border-box;
  border-collapse: separate;
  display: table;
}

.form footer > * {
  display: table-cell;
}

.form footer p {
  font-size: 0.8em;
}

.form footer button[type="submit"] {
  background-color: #0cc39f;
  border: 0;
  color: #ffffff;
  font-size: 1em;
  margin: 0 0 0.5em 0.5em;
  padding: 0.5em 1em;
  width:200px;
}
/* Custom code for the demo */





.form {
  max-width: 900px;
  margin: 0 auto;
  border: 2px solid;
}
/* dialog styles */

.ui-widget-header,
.ui-state-default,
ui-button {
  background: #CCCCCC;
  border: 1px solid #B8B8B8;
  color: #000;
  font-weight: bold;
}
/* custom style for modal content*/

.custom-ui-widget-header-warning {
  background: #EBCCCC;
  font-size: 1em;
}

.custom-ui-widget-header-accessible {
  background: #C2D7E9;
  font-size: 1em;
}

.ui-dialog-titlebar {
  background: #0cc39f;
}

#nonmodal1 div {
  background: #000;
}

.buttons {
  width: 420px;
  margin-left: auto;
  margin-right: auto;
}
    </style>
<div class="content-wrapper">
 <div class="row">
 
                  
                	<div class="col-md-4">
            <ul id="topbar">
                <li><a href="<%=request.getContextPath( )%>/rdashboard" class="btn btn-primary btn-primary"><i class="fa fa-arrow-left" aria-hidden="true"></i>
 Back to Dashboard</a></li>
            </ul>
            </div>
            <div class="col-md-4 col-md-offset-4">
            <ul id="topbar">
                <li><a href="<%=request.getContextPath( )%>/broadcasthotlist" class="btn btn-info btn-info"><i class="fa fa-share-square-o" aria-hidden="true"></i>
Broadcast Hotlist</a></li>
            </ul>
               </div>
               </div>
              
<h3  style="text-align:center;color:red"><%=errormessage %></h3></h3>
				<h3 style="text-align:center;color:green"><%=successmessage %></h3>	
	<div class="container-fluid">
		<div class="row" style="margin-right:0px">

            <div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-12">
                    <h2 class="panel-title text-center"><b>Hotlist Candidate Details</h2></b>
                  </div>
                  
                </div>
              </div>
               
               
              <div class="table-responsive tabi">
              <table id="myTable" class="table table-striped table-bordered table-list" style="text-align: center;" id="dev-table">
                  <thead>
								<tr class="st1">
								<th class="info" >S.No</th>
                                <th class="info" >First Name</th>
                                <th class="info" >Middle Name</th>
                                <th class="info" >LastName</th>
                                <th class="info" >Email Id</th>
                                <th class="info" >Contact No</th>
                                <th class="info" >State</th>
                                <th class="info" >City</th>
                                <th class="info" >Visa Status</th>
                                <th class="info" >Available From</th>
                                <th class="info" >Re-Location</th>
                                <th class="info" >Gender</th>
								<th class="info" >Type Of Consultant</th>
								<th class="info" >Hotlist</th>
								<th class="info" >SSN No</th>
								<th class="info" >Type ofBill </th>
								<th class="info" >Bill Rate</th>
								<th class="info" >Cover Letter</th>
								<th class="info" >Resume</th>
								<th class="info" >Primary Skill</th>
								<th class="info" >Created By</th>
								<th class="info" >Created Date</th>
							
							</tr>
						</thead>
						<tbody>
						<%
						int i=1;  
						for(CandidateInfoModel open:opening){
                                	 
                                  %>
							<tr class="st1">
							<td><%=i %></td>
							
									<td><a
										onclick="opendialog('<%=open.getFirstName()%>~<%=open.getLastName()%>~<%=open.getEmailid()%>~<%=open.getMobile()%>~<%=open.getState()%>~<%=open.getCity()%>~<%=open.getVisaStatus()%>~<%=open.getAvdate()%>~<%=open.getRelocate()%>~<%=open.getGender()%>~<%=open.getTypeofConsultant() %>~<%=open.getHotlist() %>~<%=open.getSsn() %>~<%=open.getBillRateType() %>~<%=open.getRate() %>~<%=open.getResume() %>~<%=open.getPrimaryskills() %>~<%=open.getMiddleName() %>~<%=open.getCiid() %>')"><%=open.getFirstName()%></a></td>
									<td><%=open.getMiddleName()%></td>
									<td><%=open.getLastName()%></td>
									<td><%=open.getEmailid()%></td>
                              <td><%=open.getMobile() %></td>
                              <td><%=open.getState() %></td>
                              <td><%=open.getCity() %></td>
                              <td><%=open.getVisaStatus() %></td>
                              <td><%=open.getAvdate() %></td>
                             
                              
                              <%String candidate=Character.toString(open.getRelocate() );
                              if(candidate.equals("Y")) {%>
                              
                              <td>Yes(Open)</td>
                              <%}else {%>
                              <td>No</td>
                              <%} %>
                              <%String candid=Character.toString(open.getGender() );
                              if(candid.equals("F")){%>
                              <td>Female</td>
                              <%}else{ %>
                              <td>Male</td>
                              <%} %>
                              <td><%=open.getTypeofConsultant() %></td>
                              <%String task=Character.toString(open.getHotlist() );
								if(task.equals("Y")) {%>
								<td>Yes</td>
								<%}else { %>
								<td>No</td>
								<%} %>
                             
                              <td><%=open.getSsn() %></td>
                              <%if(open.getBillRateType().equals("2")){ %>
                              <td>Monthly</td>
                              <%}else{ %>
                              
                              <td>Hourly</td>
                              <%} %>
                              <td><%=open.getRate() %></td>
                             <td><a  onclick="oldwin('<%=open.getCoverletter() %>')"><span class="label label-success"><i class="fa fa-download" aria-hidden="true">download</i></span></a></td>
                              <td><a  onclick="newwin('<%=open.getResume() %>')"><span class="label label-success"><i class="fa fa-download" aria-hidden="true">download</i></span></a></td>
                              <td><%=open.getPrimaryskills() %></td>
                              <td><%=open.getEmpId() %></td>
                              <td><%=open.getCreatedDate() %></td>
                           <%i++; } %>
                           </tr>
								</table>		  
						</tbody>
            </div> 
            
            </div>
</div>
</div>
             <div title="Sign up form, don't actually sign up" id="nonmodal3" style="display: none;">

<form id="updatecdetails" name="updataecdetails" action="updatehotlist" enctype="multipart/form-data" method="post" >
  <div class="form">
    

    <div class="row">
      <div class="col-md-4">
        <label for="firstname">First Name </label>
        <input id="firstname" name="firstname" maxlength="20" type="text" placeholder="First Name" autofocus required />
      </div>
      <div class="col-md-4">
        <label for="middlename">Middle Name</label>
        <input id="middlename" name="middlename" maxlength="20" type="text" placeholder="Middle Name"  />
      </div>
      <div class="col-md-4">
        <label for="lastname">Last Name </label>
        <input id="lastname" name="lastname" maxlength="20" type="text" required/>
      </div>
    </div>

    <div class="row">
      <div class="col-md-6">
        <label for="email">Email address </label>
        <input id="email" name="email" type="email" maxlength="20" required />
      </div>
      <div class="col-md-6">
        <label for="contact">Contact No </label>
        <input id="contact" name="contact" type="text" maxlength="10" pattern="[789][0-9]{9}" required />
      </div>
      
    </div>

    <div class="row">
      <div class="col-md-4">
      <div>
        <label for="gender">Gender </label>
        </div>
        <div>
        <input id="gender" name="gender" style="width:10px;" type="radio" value="F"  />
         			<label > Female</label>   
         			<input style="width:10px;" id="gender" name="gender" type="radio" value="M" required/>       
                    <label >Male</label> 
                    </div>
      </div>
      <div class="col-md-4">
        <label for="cl">Current Location </label>
       <select id="state" name="state"  required="required">
                  	<option value="Select">Select State</option>
                  	<option value="Alabama">Alabama</option>
                  	<option value="Alaska">Alaska</option>
                  	<option value="Arizona">Arizona</option>
                  	<option value="Arkansas">Arkansas</option>
                  	<option value="California">California</option>
                  	<option value="Colorado">Colorado</option>
                  	<option value="Connecticut">Connecticut</option>
                  	<option value="Delaware">Delaware</option>
                  	<option value="District of Columbia">District of Columbia</option>
                  	<option value="Florida">Florida</option>
                  	<option value="Georgia">Georgia</option>
                  	<option value="Guam">Guam</option>
                  	<option value="Hawaii">Hawaii</option>
                  	<option value="Idaho">Idaho</option>
                  	<option value="Illinois">Illinois</option>
                  	<option value="Indiana">Indiana</option>
                  	<option value="Iowa">Iowa</option>
                  	<option value="Kansas">Kansas</option>
                  	<option value="Kentucky">Kentucky</option>
                  	<option value="Louisiana">Louisiana</option>
                  	<option value="Maine">Maine</option>
                  	<option value="Maryland">Maryland</option>
                  	<option value="Massachusetts">Massachusetts</option>
                  	<option value="Michigan">Michigan</option>
                  	<option value="Minnesota">Minnesota</option>
                  	<option value="Mississippi">Mississippi</option>
                  	<option value="Missouri">Missouri</option>
                  	<option value="Montana">Montana</option>
                  	<option value="Nebraska">Nebraska</option>
                  	<option value="Nevada">Nevada</option>
                  	<option value="New Hampshire">New Hampshire</option>
                  	<option value="New Jersey">New Jersey</option>
                  	<option value="New Mexico">New Mexico</option>
                  	<option value="New York">New York</option>
                  	<option value="North Carolina">North Carolina</option>
                  	<option value="North Dakota">North Dakota</option>
                  	<option value="Northern Marianas Islands">Northern Marianas Islands</option>
                  	<option value="Ohio">Ohio</option>
                  	<option value="Oklahoma">Oklahoma</option>
                  	<option value="Oregon">Oregon</option>
                  	<option value="Pennsylvania">Pennsylvania</option>
                  	<option value="Puerto Rico">Puerto Rico</option>
                  	<option value="Rhode Island">Rhode Island</option>
                  	<option value="South Carolina">South Carolina</option>
                  	<option value="South Dakota">South Dakota</option>
                  	<option value="Tennessee">Tennessee</option>
                  	<option value="Texas">Texas</option>
                  	<option value="Utah">Utah</option>
                  	<option value="Vermont">Vermont</option>
                  	<option value="Virginia">Virginia</option>
                  	<option value="Virgin Islands">Virgin Islands</option>
                  	<option value="Washington">Washington</option>
                  	<option value="West Virginia">West Virginia</option>
                  	<option value="Wisconsin">Wisconsin</option>
                  	<option value="Wyoming">Wyoming</option></select>
      </div>
      <div class="col-md-4">
        <label for="city">City</label>
        <input type="text"  id="city" name="city" placeholder="city" maxlength="20"   />
      </div>
    </div>
	<div class="row">
      <div class="col-md-4">
        <label for="relocation">Visa Status </label>
       <select id="status" name="vstatus" required="required">
                    		<option value="status">Select Visa Status</option>
                  	<option value="CPT">CPT</option>
                  	<option value="EAD">EAD</option>
                  	<option value="GC-EAD">GC-EAD</option>
                  	<option value="Green Card Holder">Green Card Holder</option>
                  	<option value="H1B">H1B</option>
                  	<option value="OPT">OPT</option>
                  	<option value="US Citizen">US Citizen</option>
                  	<option value="Other">Other</option>
                  	</select>
      </div>
      <div class="col-md-4">
        <label for="vs">Available From</label>
        <input  type="text" class="datepickers"  name="af" id="af"   required  />
      </div>
      <div class="col-md-4" id="extra">
        <label for="vs">Hotlist </label>
        <input type="checkbox" id="hotlist" name="hotlist" value="Y"/>   
      </div>
    </div>
	<div class="row">
      <div class="col-md-4">
        <label for="relocation">Re-location </label>
        <select id="reloc" name="reloc" required="required">
                    		<option value="">Select Relocation</option>
                  	<option value="Y">Yes(Open)</option>
                  	<option value="N">NO</option>
                  	</select>
      </div>
      <div class="col-md-4">
        <label for="vs">Primary Skills </label>
         <input type="text" name="skills"  id="skills" />
      </div>
      <div class="col-md-4">
        <label for="availability">Last 4 digits of SSN NO </label>
       <input type="number"  name="ssn" maxlength="4" id="ssn" />
      </div>
    </div>
	<div class="row">
      <div class="col-md-3">
        <label for="relocation">Bill Rate </label>
        <select  name="ratetype"id="billrate" required="required">
                    		<option value="Billrate">Select Billrate</option>
                  	<option value="1">Hourly</option>
                  	<option value="2">Monthly</option>
                  	</select>
      </div>
      <div class="col-md-3">
        <label for="vs">Rate </label>
        <input  type="text"  name="rate" pattern="^([1-9]{1,2})(\.[0-9]{1,2})?$" id="rate" required/>
      </div>
     
      <div class="col-md-5" >
        <label for="vs">Resume </label>
        <input type="file" id="resume" name="resume" value="" />   
      </div>
     
    </div>
    <footer>
      <input type="hidden" id="ciid" name="ciid" value=""/>
      <button  type="submit" value="Sign Up" />Submit</button>
    </footer>
  </div>
  </form>
                    </div>
</div>

<script type="text/javascript" src='<c:url value="/static/js/jquery.dataTables.min.js"/>'></script> 
<link rel="stylesheet" href='<c:url value="/static/css/jquery.dataTables.min.css"/>' />
		</body>
		</html>
		
 
