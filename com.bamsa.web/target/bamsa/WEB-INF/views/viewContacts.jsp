<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.bamsa.web.model.TaskDetailsModel"%>
<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.ContactModel"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bamsa.web.model.EmployeeModel"%>


<title>Task Status</title>
<!DOCTYPE html>
<%
	UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);

	if (userData == null) {
		response.sendRedirect("/bamsa");
	}
%>
<script type="text/javascript" src='<c:url value="/static/js/jquery-1.11.1.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/static/js/jquery-ui.min.js"/>'></script>


	
<link rel="stylesheet"
	href='<c:url value="/static/css/jquery-ui.css" />' />
<link rel="stylesheet"
     href='<c:url value="/static/css/smart-table1.css" />' />
        
   
<%
	List<ContactModel> contacts = (List) request.getAttribute("contacts");
	List<EmployeeModel> details = (List) request.getAttribute("owners");
	String successmessage =(String)request.getAttribute("successmessage");
	if(successmessage==null){
		successmessage="";
	}
	String errormessage =(String)request.getAttribute("message");
	if(errormessage==null){
		errormessage="";
	}
%>


<body>
	<jsp:include page="header.jsp" />
	<script>
   $(document).ready(function() {
		 $("[required]").after("<span class='required'>*</span>");
		});
   </script>
	<script type="text/javascript">
            $(document).ready(function() {

                   
          
                
                $('#nonmodal3').dialog({
                	 
                     autoOpen: false,
                     width:"900px",
                     title: 'Edit Candidate Details',
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
       	$('#accname').val(details[2]);
       	$('#accowner').val(details[3]);
       	$('#city').val(details[4]);
       	$('#state').val(details[5]);
       	$('#category').val(details[6]);
       	$('#website').val(details[7]);
     	$('#status').val(details[8]);
     	
       	$('#phno').val(details[9]);
       	$('#primaryemail').val(details[10]);
       	$('#secondarymail').val(details[11]);
     	$('#description').val(details[12]);
       
       	$('#acid').val(details[15]);
       	
    	console.log(details[15]);
    	
       		if(details[13]=="Y"){
       			console.log("in reqlist");
       		$('#reqlist').prop('checked', true);}
       	
       	else{
       		$('#reqlist').prop('checked', false);
       	}
       	
         if(details[14]=="Y"){
    			console.log("in hotlist");
    		$('#hotlist').prop('checked', true);}
    	
    	else{
    		$('#hotlist').prop('checked', false);
    	}
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

.form header, .form footer {
	padding: 1em;
	width: 100%;
}

.form select {
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

.form footer>* {
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
	width: 200px;
}
/* Custom code for the demo */
.form {
	max-width: 900px;
	margin: 0 auto;
	border: 2px solid;
}
/* dialog styles */
.ui-widget-header, .ui-state-default, ui-button {
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
					<li><a href="<%=request.getContextPath()%>/rdashboard"
						class="btn btn-primary btn-primary"><i
							class="fa fa-arrow-left" aria-hidden="true"></i> Back to
							Dashboard</a></li>
				</ul>
			</div>
		</div>
<h3  style="text-align:center;color:red"><%=errormessage %></h3></h3>
				<h3 style="text-align:center;color:green"><%=successmessage %></h3>	

		<div class="container-fluid">
			<div class="row" style="margin-right: 0px">

				<div class="panel panel-primary panel-table">
					<div class="panel-heading">
						<div class="row">
							<div class="col col-xs-12">
								<h2 class="panel-title text-center">
									<b>Contacts Details 
								</h2>
								</b>
							</div>

						</div>
					</div>


					<div class="table-responsive tabi">
						<table 
							class="table table-striped table-bordered table-list "
							style="text-align: center;" id="dev-table">
							<thead>
								<tr class="st1">
									<th class="info st-number">S.No</th>
									<th class="info ">First Name</th>

									<th class="info ">LastName</th>
									<th class="info ">Account Name</th>
									<th class="info ">Account Owner</th>
									<th class="info ">Category</th>
									<th class="info ">Website</th>
									<th class="info ">Status</th>
									<th class="info ">Phone No</th>
									<th class="info ">State</th>
									<th class="info ">City</th>
									<th class="info ">Primary Email</th>
									<th class="info ">Description</th>
									<th class="info ">Secondary Email</th>

									<th class="info ">Reqlist</th>
									<th class="info ">Hotlist</th>

									<th class="info ">Created By</th>
									<th class="info ">Created Date</th>

								</tr>
							</thead>
							<tbody>
								<%
									int i = 1;
									if (null != contacts) {
										for (ContactModel open : contacts) {
								%>
								<tr class="st1">
									<td><%=i%></td>

									<td><a
										onclick="opendialog('<%=open.getFirstname()%>~<%=open.getLastname()%>~<%=open.getAccountName()%>~<%=open.getAccountOwner()%>~<%=open.getCity()%>~<%=open.getState()%>~<%=open.getCategory()%>~<%=open.getWebsite()%>~<%=open.getStatus()%>~<%=open.getPhoneno()%>~<%=open.getPrimaryemail()%>~<%=open.getSecondaryemail()%>~<%=open.getDescription()%>~<%=open.getReqlist()%>~<%=open.getHotlist()%>~<%=open.getAcid()%>')"><%=open.getFirstname()%></a></td>
									<%
										if (open.getLastname().equals("")) {
									%>
									<td>-----</td>
									<%
										} else {
									%>
									<td><%=open.getLastname()%></td>
									<%
										}
									%>
									<td><%=open.getAccountName()%></td>
									<%
										if (open.getAccountOwner() != null) {
									%>
									<td><%=open.getAccountOwner()%></td>
									<%
										} else {
									%>
									<td>----</td>
									<%
										}
									%>
									<td><%=open.getCategory()%></td>
									<%
										if (open.getWebsite().equals("")) {
									%>
									<td>-----</td>

									<%
										} else {
									%>
									<td><%=open.getWebsite()%></td>
									<%
										}
									%>
									<td><%=open.getStatus()%></td>
									<%
										if (open.getPhoneno().equals("")) {
									%>
									<td>-----</td>
									<%
										} else {
									%>
									<td><%=open.getPhoneno()%></td>
									<%
										}
									%>
									<td><%=open.getState()%></td>
									<%
										if (open.getCity().equals("")) {
									%>
									<td>---</td>

									<%
										} else {
									%>
									<td><%=open.getCity()%></td>
									<%
										}
									%>
									<td><%=open.getPrimaryemail()%></td>
									<%
										if (open.getDescription() != null) {
									%>
									<td><%=open.getDescription()%></td>
									<%
										} else {
									%>
									<td>----</td>
									<%
										}
									%>
									<%
										if (open.getSecondaryemail().equals("")) {
									%>
									<td>----</td>

									<%
										} else {
									%>
									<td><%=open.getSecondaryemail()%></td>
									<%
										}
									%>
									<%
										String candid = Character.toString(open.getReqlist());
												if (candid.equals("Y")) {
									%>
									<td>Yes</td>
									<%
										} else {
									%>
									<td>No</td>
									<%
										}
									%>
									<%
										String candids = Character.toString(open.getHotlist());
												if (candids.equals("Y")) {
									%>
									<td>Yes</td>
									<%
										} else {
									%>
									<td>No</td>
									<%
										}
									%>

									<td><%=open.getCreatedby()%></td>
									<td><%=open.getCreateddate()%></td>

									<%
										i++;
											}
										}
									%>
								</tr>
						</table>
						</tbody>


					</div>

				</div>
			</div>

			<div title="Sign up form, don't actually sign up" id="nonmodal3"
				style="display: none;">

				<form id="updatecdetails" name="updataecdetails"
					action="updatecontact" enctype="multipart/form-data" method="post">
					<div class="form">


						<div class="row">
							<div class="col-md-6">
								<label for="firstname">First Name </label> <input id="firstname"
									name="firstname" type="text" maxlength="20"
									placeholder="First Name" autofocus required />
							</div>

							<div class="col-md-6">
								<label for="lastname">Last Name </label> <input id="lastname"
									name="lastname" type="text" maxlength="20"  />
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<label>Contact Name </b></label> <input type="text" class="long"
									name="accountname" maxlength="20" id="accname" required />
							</div>
							<div class="col-md-6">
								<label>Contact Owner </label> <select id="accowner"
									name="accowner">
									<option value=""><b>Select Contact Owner</b>
									</option>
									<%
										for (EmployeeModel empmodel : details) {
									%>
									<option value="<%=empmodel.getEmpId()%>"><b><%=empmodel.getName()%></b>
									</option>
									<%
										}
									%>

								</select>
							</div>

						</div>

						<div class="row">
							<div class="col-md-4">
								<label for="city">City</label> <input type="text" id="city"
									name="city" placeholder="city" maxlength="20" />
							</div>
							<div class="col-md-4">
								<label for="cl">Current Location </label> <select id="state"
									name="state" required="required">
									<option value="Select">Select State</option>
									<option value="Alabama">Alabama</option>
									<option value="Alaska">Alaska</option>
									<option value="Arizona">Arizona</option>
									<option value="Arkansas">Arkansas</option>
									<option value="California">California</option>
									<option value="Colorado">Colorado</option>
									<option value="Connecticut">Connecticut</option>
									<option value="Delaware">Delaware</option>
									<option value="District of Columbia">District of
										Columbia</option>
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
									<option value="Northern Marianas Islands">Northern
										Marianas Islands</option>
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
									<option value="Wyoming">Wyoming</option>
								</select>
							</div>
							<div class="col-md-4">

								<label>Category </label> <select id="category" name="category"
									required="required">
									<option value=""><b>Select Category</b>
									</option>
									<option value="client"><b>Client</b>
									</option>
									<option value="implementer"><b>Implementer</b>
									</option>
									<option value="Sub-Contract"><b>Sub-Contract</b>
									</option>
									<option value="Vendor"><b>Vendor</b>
									</option>


								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">

								<label>Website </label> <input type="text" class="long"
									name="website" id="website" placeholder="www.example.com" />

							</div>
							<div class="col-md-4">
								<label>Status </label> <select id="status" name="status"
									required="required">
									<option value=""><b>Select Status</b>
									</option>
									<option value="active"><b>Active</b>
									</option>
									<option value="inactive"><b>In Active</b>
									</option>
								</select>

							</div>
							<div class="col-md-4">
								<label>Phone </label> <input type="text" class="long" id="phno"
									name="phone" maxlength="10" pattern="[789][0-9]{9}" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Primary Email </label> <input type="email" class="long"
									maxlength="20" name="pemail" id="primaryemail" required />
							</div>
							<div class="col-md-6">
								<label>Secondary Email </label> <input type="email" class="long"
									name="semail" id="secondarymail" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<label>Description </label>
								<textarea rows="7" cols="50" type="text" class="long"
									name="description"></textarea>

							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Send ReqList </label> <input type="checkbox"
									name="reqlist" id="reqlist" value="Y" />
							</div>
							<div class="col-md-6">
								<label>Send HotList </label> <input type="checkbox"
									name="hotlist" id="hotlist" value="Y" />
							</div>


						</div>
						<footer>
							<input type="hidden" id="acid" name="acid" value="" />
							<button type="submit" value="Sign Up" />
							Submit
							</button>
						</footer>
					</div>
				</form>
			</div>
		</div>
	</div>
	 <script type="text/javascript"
    src='<c:url value="/static/js/smart-table1.js"/> '></script>	
	<script>
	$('#dev-table').smartTable({
		
			  // true|false
		
			  filterOn: true,
		
			  // true|false
		
			  sortingOn: true,
				  // true|false
		
			  hideColumnOn: true,
		  // null|html
		
			  sortAscHtml: '<span></span>',
		// null|html
		
			  sortDescHtml: '<span></span>',
		  // null|html
		
			  hideColumnHtml: 'x',
		  // null|className
		
			  zebraClass: 'zebra-odd-bg',
		  // int (0 to disable pagination)
			  paginationPerPage: 3
		
			});</script>
	
</body>
</html>




