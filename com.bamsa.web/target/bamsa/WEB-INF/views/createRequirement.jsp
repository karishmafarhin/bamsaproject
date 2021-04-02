<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.ClockTimeModel"%>
<%@page import="com.bamsa.web.model.EmployeeModel"%>
<%@page import="com.bamsa.web.model.ContactModel"%>
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
<meta name="viewport"
	content="width=device-width,height=device-height,initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Opening Form</title>

<%
String pv=(String)request.getAttribute("vendor");
String ec=(String)request.getAttribute("eclient");

String message =(String)request.getAttribute("message");
if(message==null){
	message="";
}
String successmessage =(String)request.getAttribute("successmessage");
if(successmessage==null){
	successmessage="";
}
%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
function getperform() {
  	
	 var myWindow = window.open("../bamsa/addClient", "window", "width=640,height=500");
  
 }      </script>
<script>

	/* Open when someone clicks on the span element */
function openNav() {
 document.getElementById("myNav").style.height = "25%";
 document.getElementById("myNav").style.marginTop = "38px";
 if(window.matchMedia("screen and (max-width: 992px)").matches){
 		  document.getElementById("myNav").style.height = "62%";
 	  };
 	 if(window.matchMedia("screen and (max-height: 610px)").matches){
		  document.getElementById("myNav").style.height = "100%";
	  };

  
 	
};

/* Close when someone clicks on the "x" symbol inside the overlay */
function closeNav() {
 document.getElementById("myNav").style.height = "0%";

}
</script>
<body>



	<jsp:include page="header.jsp" />
	<script>
   $(document).ready(function() {
		 $("[required]").after("<span class='required'>*</span>");
		 $("#pvs").hide();
		 document.getElementById("emasg").innerHTML="";
	 	
		 document.getElementById("myNav").style.height = "0%";
		 
		 
		});
   </script>

	<div class="content-wrapper">
		<div class="container">
<div class="row">

		<div class="col-md-offset-4 col-md-4"><button type="button" onclick="openNav()" class="btn btn-danger">Quick Add <i class="fa fa-level-down" aria-hidden="true"></i></button></div>
<!-- The overlay -->
<div id="myNav" class="overlay">

  <!-- Button to close the overlay navigation -->
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

  <!-- Overlay content -->
  <div class="overlay-content">
  
  <div class="col-md-1 col-md-offset-4 box"><a href="<%=request.getContextPath() %>/addRequirement" style="color:#fff"><i class="fa fa-bullhorn" aria-hidden="true"></i><br><h5>Opening</h5></a></div>
  <div class="col-md-1 box1"><a href="<%=request.getContextPath( )%>/candidateRegistration" style="color:#fff"><i class="fa fa-users" aria-hidden="true"></i><br><h5>Candidate</h5></a></div>
  <div class="col-md-1 box3"><a href="<%=request.getContextPath( )%>/addClient" style="color:#fff"><i class="fa fa-book"></i><br><h5>Contact</h5></a></div>
  <div class="col-md-1 box4"><a href="" style="color:#fff"><i class="fa fa-paper-plane-o"></i><br><h5>Send Mail</h5></a></div>


  
 
 
  </div>

</div>
</div>
<div><h1></h1></div>
			<div class="panel panel-default panel-table">
				<div class="panel-heading-fnn ">
					<div class="row">

						<h3 class=" text-center">
							<b style="color: #fff">Add Requirement</b>
						</h3>


					</div>
				</div>
				<div>
					<h3 style="text-align: center; color: red"><%=message %></h3>
					<h3 style="text-align: center; color: green"><%=successmessage %></h3>
				</div>
				<form:form action="registerReq" method="post"
					enctype="multipart/form-data" name="registration" id="registration"
					class="register">

					<div class="col-md-12">
						<fieldset class="row1">

							<legend style="color: #408000">
								<b>Requirement Information</b>
							</legend>
							<p>
								<label>Position ID </b></label> <input type="text" class="long"
									name="pid" maxlength="20" id="pid" required />
							</p>
							<p>
								<label>Position Title </b></label> <input type="text" class="long"
									name="ptitle" maxlength="20" id="ptitle" required />
							</p>
							
							<p>
								<label>City </label> <input type="text" class="long" id="city"
									name="city" placeholder="city" maxlength="20" />
							</p>
							 <p>
                    <label>State 
                    </label>
                    <select id="state" name="state" >
                    <option value="select">Select State</option>
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
                    
                    
                   
                </p>
 
							<p>
								<label>Primary Skill </label> <input type="text" class="long"
									name="pskill" maxlength="20" required />

							</p>
							<p>
								<label>Secondary Skill </label> <input type="text" class="long"
									name="sskill" />

							</p>
							
							<p>
								<label>Type of Bill Rate </label> <select id="ratetype"
									name="ratetype" required="required">
									<option value=""><b>Select Bill Type</b>
									</option>
									<option value="1">Hourly</option>
									<option value="2">Monthly</option>
								</select>


							</p>



							<p>
								<label>Bill Rate</label> <input type="text" class="long"
									name="rate" id="rate" pattern="^([1-9]{1})([0-9]{1,9})(\.[0-9]{1,9})?$" placeholder="Rate" required />
							</p>
							<p>
								<label>PrimeVendor </label> 
									
									<input type="text" class="long" name="pvendor" id="pvendor" required>
									
								
							</p>
							<p>
								<label>Contact Person</label> <input type="text" class="long"
									name="contact" id="contactdetails" />
								<section id="pvs">
									<a onclick="getperform()" class="button button-neutral contact">Add
										Prime-Vendor</a>
								</section>

							</p>
							<p id="emasg" style="color:red;text-align:center;"></p>
							<p>
								<label>End Client </label> 
								<input type="text" class="long" name="eclient" id="eclient" required>
								
							</p>
							<p>
								<label>Description </label> <textarea rows="20" cols="70" type="text" class="long"
									name="description" ></textarea>

							</p>
							
						</fieldset>
					</div>
					


					<div class="col-md-12">
						<center>
							<fieldset class="row1">
								<div>
									<button class="btn btn-primary btn-lg btn3d" type="submit">Add
										Account&raquo;</button>
								</div>
								
								<input type="hidden" value="0" id="uid" name="uid" />
							</fieldset>
						</center>
					</div>
				</form:form>

			</div>
		</div>
	</div>
<script>
$( "#pvendor" ).autocomplete({
  source: <%=pv%>
});
$(function () {
	 $("#pvendor").autocomplete({ change: function() 
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
			 				$(function () {
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
			 	 $("#pvendor").val("");
			 }
			 }
		 	

		 
		 });
	 }); 

 
$( "#eclient" ).autocomplete({
	  source: <%=ec%>
	});
</script>
</body>
</html>