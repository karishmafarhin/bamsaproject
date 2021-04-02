<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.ClockTimeModel"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel"%>
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
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Candidate Registration </title> 

<%
List<EmployeeDetailsModel> details=(List)request.getAttribute("details");

String message =(String)request.getAttribute("message");
if(message==null){
	message="";
}
String successmessage =(String)request.getAttribute("successmessage");
if(successmessage==null){
	successmessage="";
}
%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
$( document ).ready(function() {
	$("#registration").addClass("act");
});
	
</script>
<script>

	/* Open when someone clicks on the span element */
function openNav() {
 document.getElementById("myNav").style.height = "25%";
 document.getElementById("myNav").style.marginTop = "38px";
 if(window.matchMedia("screen and (max-width: 992px)").matches){
 		  document.getElementById("myNav").style.height = "62%";
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
 $(document).ready(
           
           /* This is the function that will get executed after the DOM is fully loaded */
           function () {
             $( ".datepickers" ).datepicker({
             	dateFormat: 'dd-mm-yy',
               changeMonth: true,//this option for allowing user to select month
               changeYear: true,//this option for allowing user to select from year range
               yearRange: "-100:+100"
              });
             
             $('input.timepicker').timepicker({
                 timeFormat: 'HH:mm',
                          
             });
           }
           
           
           
         );

 $(function () {
	 $('#phone').keydown(function (e) {
	 if (e.shiftKey || e.ctrlKey || e.altKey) {
	 e.preventDefault();
	 } else {
	 var key = e.keyCode;
	 if (!((key == 8) || (key == 46) || (key >= 35 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
	 e.preventDefault();
	 }
	 }
	 });
	 });
 
 
 $(function () {
	 $('#intime').keydown(function (e) {
	 if (e.shiftKey || e.ctrlKey || e.altKey) {
	 e.preventDefault();
	 }else {
		 var key = e.keyCode;
		 if (!((key == 8) || (key == 46) || (key >= 35 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
		 e.preventDefault();
		 }
		 }
	 });
	 });
 $(function () {
	 $('#outtime').keydown(function (e) {
	 if (e.shiftKey || e.ctrlKey || e.altKey) {
	 e.preventDefault();
	 }else {
		 var key = e.keyCode;
		 if (!((key == 8) || (key == 46) || (key >= 35 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
		 e.preventDefault();
		 }
		 }
	 });
	 });
 
 
 
 
 

 var ext = $('#picture').val().split('.').pop().toLowerCase();
 if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
     alert('invalid extension!');
 }



	
   </script>
   <script>
   $(document).ready(function() {
		 $("[required]").after("<span class='required'>*</span>");
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
              <div class="panel-heading-fg " >
                <div class="row">
                  
                    <h3 class=" text-center"><b style="color:#fff">Candidate Registration</b></h3>
                 
                </div>
              </div>
               <h3 style="text-align:center;color:red"><%=message %></h3>
				<h3 style="text-align:center;color:green"><%=successmessage %></h3>	
				
				<form:form action="registerCandidate" method="post" enctype="multipart/form-data"  name="registration" id="candidateregistration" class="register">
				
				<div class="col-md-12">
             <fieldset class="row1">
             
                <legend style="color:#408000"><b>Candidate Details</b>
                </legend>
                <p>
                    <label>First Name 
                    </b></label>
                    <input type="text" class="long" name="fname" maxlength="20" id="name" required/>
                </p>
                <p>
                    <label>Middle Name 
                    </b></label>
                    <input type="text" class="long" name="mname" maxlength="20" id="name" />
                </p>
                <p>
                    <label>Last Name 
                    </b></label>
                    <input type="text" class="long" name="lname" maxlength="20" id="name" required/>
                </p>
               <p>
                    <label>Email 
                    </label>																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																														
                    <input  type="email" class="long" name="email" maxlength="40"  id="email" required/>	
                    </p>
                    
                     <p>
                  <label>Gender 
                    </label>
                    <input id="gender" name="gender" type="radio" value="F" required />
         			<label style="width: 48px;"> Female</label>   
         			<input id="gender" name="gender" type="radio" value="M" required/>       
                    <label style="width: 34px;">Male</label> 
               </p>  
               
                <p>
                    <label>Contact No. 
                    </label>

                    <input type="text" class="long" id="phone" name="mobno" maxlength="10" pattern="[789][0-9]{9}" required/>
                </p>
                	<p>
                  	<label>City</label>
                  	 <input type="text" class="long" id="city" name="city" placeholder="city" maxlength="20"   />
                </p>
               <p>
								<label>State </label> <select id="state" name="state"
									required="required">
									<option value=""><b>Select State</b>
									</option>
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


							</p>
                  
                <p>
								<label>Visa Status</label> <select id="vstatus"
									name="vstatus" required="required">
									<option value="">Select Visa Status</option>
                  	<option value="CPT">CPT</option>
                  	<option value="EAD">EAD</option>
                  	<option value="GC-EAD">GC-EAD</option>
                  	<option value="Green Card Holder">Green Card Holder</option>
                  	<option value="H1B">H1B</option>
                  	<option value="OPT">OPT</option>
                  	<option value="US Citizen">US Citizen</option>
                  	<option value="Other">Other</option>
								</select>


							</p>
                
                
                
                
                 
                    <p>
                    <label >Available From
                    </label>
                    <input  type="text" class="datepickers long" name="af"   placeholder="dd-mm-yy" required />
                </p>
            
                
              
                  <p>
                    <label >Type of Consultant
                    </label>
                    <select id="consultant" name="consultant" required="required" >
                    		<option value="">Select Consultant</option>
                    		<option value="thirdparty">Third Party</option>
                  	        <option value="w2">W2</option>
                  	
                  	</select>
                </p>
                  <p  id="warning">
                <label></label>
                  <input type="checkbox" id="hotlist" name="hotlist" value="Y"/><label style="width: 48px;"> Hotlist</label>   
                </p>
                <p>
								<label>Re-Location</label> <select id="reloc"
									name="reloc" required="required">
									<option value="">Select Relocation</option>
                  	                <option value="Yes">Yes(Open)</option>
                  	                <option value="No">NO</option>
								</select>


							</p>
                
             
                 <p>
                    <label>Primary Skills 
                    </b></label>
                    <input type="text" class="long" name="skills"  id="skills" required/>
                </p>
                <p>
                    <label>Last 4 digits of SSN NO 
                    </b></label>
                    <input type="number" class="long"  name="ssn"  max="9999" pattern="^[0-9]{4}$" id="ssn" />
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
                
            </fieldset>
            </div>
             
     
            
            <div class="col-md-12">
            <fieldset class="row1">
                 
                <legend style="color:#408000"><b>Attachments</b>
                </legend>
                <p>
          <label >Cover Letter :
                    </label>
   
    <input id="upload" class="file-upload__input" type="file" name="cl">
</p>
      
	   <p>
	    <label >Resume* :
                    </label>
           
    <input id="upload" class="file-upload__input" type="file" name="resume" required></div>
  </p>
            
          <div class="col-md-12">
           
               <div><button  class="btn btn-primary btn-lg btn3d" type="submit" >Submit</button></div>
               
            
            
            </div>
                </form:form>
            </div>
           
       
				
			</div>
		</div>
		</div>
	<script>
		$(document).ready(function() {

			$('#consultant').change(function() {
				var no = $(this).val();
				console.log(no);
				if ($(this).val() == "w2") {
					$('#warning').show();

				}

				else {

					$('#warning').hide();
				}
			});
			$('#warning').hide();
		});
	</script>
</body>
</html>