<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.bamsa.web.model.TaskDetailsModel"%>
<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.OpeningInfoModel"%>
<%@page import="com.bamsa.web.model.ContactModel"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel" %>


<title>Openings</title>
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
<%List<OpeningInfoModel> opening=(List)request.getAttribute("opening");
String pv=(String)request.getAttribute("vendor");
String ec=(String)request.getAttribute("eclient");

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
 
<script type="text/javascript">
            $(document).ready(function() {

                    
          
                
                $('#nonmodal3').dialog({
                	 
                     autoOpen: false,
                     width:"900px",
                     title: 'Edit Opening Details',
                     position: {
                       my: 'center',
                      
                     }
                   
                });
            });
         function opendialog(completedetails){
        	 
           var details =completedetails.split('~');
           console.log(details);
           $('#nonmodal3').dialog('open');
       
        $('#positionid').val(details[0]);
       	$('#positiontitle').val(details[1]);
       	$('#state').val(details[2]);
       	$('#city').val(details[3]);
       	$('#ps').val(details[4]);
       	$('#ss').val(details[5]);
    	$('#ratetype').val(details[6])
       	$('#brate').val(details[7]);
        $('#primevendor').val( details[8]);
        $('#contactdetails').val(details[9]);
     	$('#endclient').val(details[10]);
     	
       	$('#description').val(details[11]);
       
       	$('#rqid').val(details[12]);
       
       	$( "#primevendor" ).autocomplete({
       	  source: <%=pv%>
       	});
       
       		 $("#primevendor").autocomplete({ change: function() 
       			 {  var pvnam =$(this).val();
       			 $("#pvs").hide();
       			 document.getElementById("emasg").innerHTML="";
       			 	console.log(pvnam);
       			  var pfound = false;
       			 	var pvddetails = <%=pv%>;
       				 	for (var i = 0; i < pvddetails.length; i++) {
       				 	  if (pvddetails[i].label == pvnam) {
       				 	    pfound = true;
       				 	    break;
       				 	  }
       				 	}
       				 	 if(pfound){
       						 console.log(pfound)
       					 		$.ajax({
       					 			type: "post",
       					 			url: "/bamsa/getcontactsofpvdetails?pvname="+pvnam,
       					 					
       					 			success:function(accdetails){
       					 				var contactname,n;
       					 				console.log(accdetails);
       					 				$( "#contactdetails" ).autocomplete({
       					 					
       					 					  source: accdetails
       					 					});
       					 				
       					 					 $("#contactdetails").autocomplete({ change: function() 
       					 						 { 
       					 						contactname =$(this).val();
       					 					 	console.log(contactname);
       					 					 	var found = false;
       					 					 	for (var i = 0; i < accdetails.length; i++) {
       					 					 	  if (accdetails[i].label == contactname) {
       					 					 	    found = true;
       					 					 	    break;
       					 					 	  }
       					 					 	}
       					 					 	
       					 					 	console.log(found);
       					 					 	if(found){
       					 					 		
       					 					 		document.getElementById("emasg").innerHTML="";
       					 					 		$("#pvs").hide();
       					 					 	}
       					 					 	else{
       					 					 		$("#pvs").show();
       					 					 		document.getElementById("emasg").innerHTML="Add contact first.The contact that you entered does not exist*";
       					 					 		$("#contactdetails").val("");
       					 					 	}
       					 					 	
       					 					 	
       					 						 }
       					 					 }); 
       					 				
       					 			},
       					 			failure:function(){
       					 				alert("Cannot load details")
       					 			}  	  
       					 	});
       						 
       					 }
       					 else{
       						 $("#pvs").show();
       					 	document.getElementById("emasg").innerHTML="The Prime-vendor that you entered does not exist.So please add Prime-vendor first*";
       					 	 $("#primevendor").val("");
       					 }
       					 }
       		 });
      


       	$( "#endclient" ).autocomplete({
       	 source: <%=ec%>
       	});
       					 				
    
  
         };
     
         
         
         
         
               
        </script>
<script>
   $(document).ready(function() {
		 $("[required]").after("<span class='required'>*</span>");
		 $("#pvs").hide();
		 document.getElementById("emasg").innerHTML="";
	 	
		 document.getElementById("myNav").style.height = "0%";
		 
		 
		});
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
               </div>
	<h3 style="text-align:center;color:red"><%=errormessage %></h3>

				<h3 style="text-align:center;color:green"><%=successmessage %></h3>	
	<div class="container-fluid">
		<div class="row" style="margin-right:0px">

						
            <div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-12">
                    <h2 class="panel-title text-center"><b>Openning Details</h2></b>
                  </div>
                  
                </div>
              </div>
               
               
              <div class="table-responsive tabi">
              <table id="myTable" class="table table-striped table-bordered table-list" style="text-align: center;" id="dev-table">
                  <thead>
								<tr class="st1">
								<th class="info">S.No</th>
									<th class="info">Position Id</th>
									<th class="info">Position Title</th>
									<th class="info">State</th>
									<th class="info">City</th>
									<th class="info">Primary Skill</th>
									<th class="info">Secondary Skill</th>
									<th class="info">Bill Type</th>
									<th class="info">Bill Rate</th>
									<th class="info">Prime Vendor</th>
									<th class="info">Contact Person</th>
									<th class="info">End Client</th>
									<th class="info">Description</th>
									
									<th class="info" >Created By</th>
									<th class="info" >Created Date</th>
									<th class="info" >Share</th>
							
							</tr>
						</thead>
						<tbody>
						<%
									int i = 1;
									for (OpeningInfoModel open : opening) {
								%>
								<tr class="st1">
									<td><%=i%></td>
									<td><%=open.getPositionid()%></td>
									<td><a
										onclick="opendialog('<%=open.getPositionid()%>~<%=open.getPositiontitle()%>~<%=open.getState()%>~<%=open.getCity()%>~<%=open.getPrimaryskill()%>~<%=open.getSecondaryskill()%>~<%=open.getBilltype() %>~<%=open.getRate()%>~<%=open.getPrimevendor()%>~<%=open.getContactperson() %>~<%=open.getEndclient()%>~<%=open.getDescription()%>~<%=open.getRqid()%>')"><%=open.getPositiontitle()%></a></td>
									<td><%=open.getState()%></td>
									<%if(open.getCity().equals("")) {%>
									<td>----</td>
									
									<%}else{ %>
									<td><%=open.getCity()%></td>
									<%} %>
									<td><%=open.getPrimaryskill()%></td>
									<%if(open.getSecondaryskill().equals("")){ %>
									<td>----</td>
									
									<%}else{ %>
									<td><%=open.getSecondaryskill()%></td>
									<%} %>
									
									<%if(open.getBilltype()==2){ %>
                              <td>Monthly</td>
                              <%}else{ %>
                              
                              <td>Hourly</td>
                              <%} %>
									
									<td><%=open.getRate()%></td>
									<td><%=open.getPrimevendor()%></td>
									<td><%=open.getContactperson() %></td>
									<%if(open.getEndclient().equals("")){ %>
									<td>----</td>
									
									<%}else{ %>
									<td><%=open.getEndclient()%></td>
									<%} %>
									<%if(open.getDescription().equals("")){%>
									<td>---</td>
									
									<%}else{ %>
									<td><%=open.getDescription()%></td>
									<%} %>
									<td><%=open.getEmpId() %></td>
									<td><%=open.getCreateddate()%></td>
									<td><a class="btn icon-btn btn-info" href="<%=request.getContextPath( )%>/broadcast?rqid=<%=open.getRqid()%>"><i class="fa fa-share-square-o "></i>Broadcast</a></td>
									
								
								<%
										i++;
										}
									%>
                           </tr>
								</table>		  
						</tbody>
            </div> 
            
            </div>
</div>

             <div title="Sign up form, don't actually sign up" id="nonmodal3" style="display: none;">

<form id="updateopdetails" name="updateopcdetails" action="updateopening" enctype="multipart/form-data" method="post" >
  <div class="form">
    

    <div class="row">
      <div class="col-md-6">
        <label for="positionid">Position Id </label>
        <input id="positionid" name="positionid" maxlength="20" type="text" required readonly />
      </div>
      <div class="col-md-6">
        <label for="positiontitle">Position Title </label>
        <input id="positiontitle" name="positiontitle"  maxlength="20" type="text" placeholder="Position Title" required />
      </div>
      </div>
      <div class="row">
      <div class="col-md-4">
       <label for="cl">State </label>
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
      
    <div class="col-md-4">
      <label for="ps">Primary Skills </label>
      <input id="ps" name="ps"  type="text" value="" required />
      </div>
      </div>
    <div class="row">
      
       <div class="col-md-4">
      <label for="ss">Secondary Skills </label>
      <input id="ss" name="ss"  type="text" value=""  />
      </div>
      
        
      <div class="col-md-4">
        
								<label>Type of Bill Rate </label> <select id="ratetype"
									name="ratetype" required="required">
									<option value="">Select Bill Type
									</option>
									<option value="1">Hourly</option>
									<option value="2">Monthly</option>
								</select>
</div>

      <div class="col-md-4">
      <label for="ps">Bill Rate </label>
      <input id="brate" name="brate" pattern="^([1-9]{1,2})(\.[0-9]{1,2})?$" type="text" value="" required />
      </div>
      </div>
      <div class="row">
       <div class="col-md-4">
    <label>PrimeVendor </label> 
									
    <input type="text" class="long" name="pvendor" id="primevendor" required>
									
								
      </div>
      <div class="col-md-4">
      <label>Contact Person</label> <input type="text" class="long"
									name="contact" id="contactdetails" required/>
								
								</div>
								<div class="col-md-4" id="pvs">

								
									<a onclick="getperform()" class="button button-neutral contact" style="margin-top: 28px !important;">Add
										Prime-Vendor</a>
								
								</div>
      
      </div>
      <p id="emasg" style="color:red;text-align:center;"></p>
     <div class="row">
     <div class="col-md-3">
     <label>End Client </label> 
								<input type="text" class="long" name="eclient" id="endclient" >
								
     </div>
							<div class="col-md-9">
								<label>Description </label>
								<textarea rows="5" cols="20" type="text" class="long"
									name="description"></textarea>

							</div>
						</div>
     
    
    <footer>
    <input type="hidden" value="0" id="uid" name="uid" />
      <input type="hidden" id="rqid" name="rqid" value=""/>
      <button  type="submit" value="Sign Up" />Submit</button>
    </footer>
  </div>
  </form>
                    </div>
</div>
<script>

</script>
<script type="text/javascript" src='<c:url value="/static/js/jquery.dataTables.min.js"/>'></script> 
<link rel="stylesheet" href='<c:url value="/static/css/jquery.dataTables.min.css"/>' />
		</body>
		</html>
		
 
