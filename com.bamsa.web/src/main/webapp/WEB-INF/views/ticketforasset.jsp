<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.EmployeeModel"%>
<%@page import="com.bamsa.web.model.AssetTrackingModel"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel" %>

<%@page import="java.util.List"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Raise Ticket</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<% 

List<EmployeeModel> details=(List)request.getAttribute("report");
String successmessage =(String)request.getAttribute("successmessage");
if(successmessage==null){
	successmessage="";
}
String message =(String)request.getAttribute("errormessage");
if(message==null){
	message="";
}
String data = (String)request.getAttribute("notesjson");

%>
<% 
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

boolean  showall=false;
 
 if(null!=empModel && (empModel.getStreamId()==0|| empModel.getStreamId()==6)) {
 	 showall=true;
 }
 boolean showbranch = false;
	if (null!=empModel && (empModel.getStreamId() == 0 || empModel.getStreamId() == 6||empModel.getStreamId()==5||empModel.getStreamId()==7||empModel.getStreamId()==8)) {
		showbranch = true;
	}
 %>

<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
	<script>
   $(document).ready(function() {
		 $("[required]").after("<span class='required'>*</span>");
		});
   </script>
	<script>
		jQuery(document).ready(function() {
			$(".datepickers").datepicker({
				dateFormat : 'dd-mm-yy',
				changeMonth : true,
				changeYear : true,
				 yearRange: "-100:+100"
				
			});

		});
	</script>
	<script>
$( document ).ready(function() {
	$("#assets").addClass("act");
	$("#riseticket").addClass("actv");
});
function getperform() {

	var myWindow = window.open("../bamsa/createBranch", "window",
			"width=600,height=300");

}
</script>



	<div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
            <div class="page-title">
  
  
  
              <div style="/*! margin-left: 161px; */" class="col col-xs-6">
       <div class="btn-group btn-breadcrumb">
             <%if(showall){ %>
            <a href="showTicket" id="riseticket" class="btn btn-info">Raise Ticket</a>
            <a href="viewTicket" class="btn btn-info">Ticket Show</a>
            <a href="CompanyAssets" class="btn btn-info">Create New</a>
            <a href="licensedetails" class="btn btn-info">View All</a>
            <%}else{ %>
             <a href="showTicket" id="riseticket" class="btn btn-info">Raise Ticket</a>
            <a href="viewTicket" class="btn btn-info">Ticket Show</a>
            <%} %>
        </div>
        
	</div>
	<div class="col col-xs-6">
						<%
							if (showbranch) {
						%>
						<button style="padding: 3px 5px;"
							class="btn btn-info btn-xs btn3d pull-right"
							onclick="getperform()">
							<b>Create Branch</b>
						</button>
						<%
							}
						%>
					</div>
<div class="title_left text-center">
                <h3>Raise ticket for
								Asset/License/Accessory/Consumable/Component</h3>
              </div>
<div class="col-xs-12">
				
				<h3 style="text-align: center; color: green"><%=successmessage %></h3>
				<h3 style="text-align: center; color: red"><%=message %></h3>
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
             <div class="x_panel" style="height: 663px;margin-top: 20px;">
                  <div class="x_content">


	
				<form:form action="ticketregister" method="post"
					enctype="multipart/form-data" name="registration" id="registration"
					class="register">
					<div class="col-md-11 col-md-offset-1">
						<fieldset class="row1">

							<p>
								<label for="serial" class="col-md-4 control-label">Select
									A/L/C/CM/A</label> <select class="form-control" id="Marque" name="type" required="required">
									<option value="">Select</option>
									<option value="asset">Asset</option>
									<option value="license">License</option>
									<option value="accessory">Accessory</option>
									<option value="consumable">Consumable</option>
									<option value="component">Component</option>
								</select>


							</p>

							<p>
								<label for="name" class="col-md-6 control-label">Select
									tag  </label> <select class="form-control" id="Serie" name="tag" required="required"></select>
							</p>



							<p>
								<label for="serial" class="col-md-4 control-label">Select
									Requesting to </label> <select class="form-control" name="requestingto" required="required">
									<option value="">Select</option>
									<%for(EmployeeModel det :details){%>
									<option value="<%=det.getUid()%>"><%=det.getEmpId()%></option>
									<% }%>
								</select>


							</p>

							<p>
								<label for="serial" class="col-md-4 control-label">Purpose
									 </label> 
									<select id="selectoptions"  name="purpose" class="form-control" required="required">
									
								</select>


							</p>
							<p>
								<label for="order_number" class="col-md-6 control-label">Remarks
									</label> <input class="form-control long" type="text"
									name="remarks" id="Remarks" value="" required />

							</p>
							<div id="warning" style="display:none"><p>
								<label  for="order_number" class=" col-md-6 control-label">If
									taking home </label></p>
							<p>
								<label  for="order_number" class=" col-md-6 control-label" >From
									date</label> <input class="form-control long datepickers" type="text"
									name="fromdate" id="from_date"  />
							</p>
							<p>
								<label for="order_number" class=" col-md-6 control-label" >To
									date</label> <input class="form-control long datepickers" type="text"
									name="todate" id="to_dater" />

							</p>
							</div>
						</fieldset>
						</div>
						<div class="col-md-12">
           <center> <fieldset class="row1">
               <div><button  class="btn btn-primary btn-lg btn3d" type="submit">Submit &raquo;</button></div>
               <input type="hidden" value="0" id="uid" name="uid"/>
            </fieldset></center>
            </div>
				</form:form>
			</div>

		</div>
	</div>
</div>
</div>
</div>
</div>
</div>
</div>

	<script>

$(document).ready(function() {
	

	  var tabMarque = [];
	  var tabMarque1 = [];
	  var jsondata=<%=data%>;
	  var jsondata1={"asset":[["1","Broken"],["2","Lost"],["3","Repair"],["4","Taking Home"]],"license":[["5","Expired"]],"accessory":[["1","Broken"],["2","Lost"],["3","Repair"],["4","Taking Home"]],"consumable":[["1","Broken"],["2","Lost"],["3","Repair"]],"component":[["1","Broken"],["2","Lost"],["3","Repair"],["4","Taking Home"]]};	    
	
		console.log("hi");
	    console.log(jsondata);

	    $.each(jsondata, function(index, val) {
	      tabMarque[index] = val;
	    });
	    $.each(jsondata1, function(index, val) {
		      tabMarque1[index] = val;
		    });

	  $('#Marque').change(function(event) {
	    // alert('Marque_change');
	    var marque = $(this).val();
	    // alert(marque);

	    var htmlOption = '<option value="0">Please select any one option</option>';
	    var htmlOption1='<option value="0">Please select any one option</option>';
	    if (marque !== '0') {
	      var itemsMarque = tabMarque[marque];
	      var itemsMarque1 = tabMarque1[marque];
	      //alert(JSON.stringify(itemsMarque));
	      $.each(itemsMarque, function(key, value) {
	        //alert("k=" + key + " v=" + JSON.stringify(value));
	        htmlOption += '<option value="' + value[0] +'">' + value[1] + '</option>';
	      });
	      $.each(itemsMarque1, function(key, value) {
		        //alert("k=" + key + " v=" + JSON.stringify(value));
		        htmlOption1 += '<option value="' + value[0] +'">' + value[1] + '</option>';
		      });
	    }
	    $('#Serie').html(htmlOption);
	    $('#selectoptions').html(htmlOption1);
	    
	    
	    
	  });

	 
	});
</script>
<script>
$(function() {
    $('#selectoptions').change(function(){
        if ($(this).val() == "4") {
            $('#warning').show();
            $("#from_date").prop('required',true);
            $("#to_dater").prop('required',true);
        } else {
            $('#warning').hide();
        }
    });
});

</script>

	
<!-- JavaScript jQuery code from Bootply.com editor  -->
	
</body>
