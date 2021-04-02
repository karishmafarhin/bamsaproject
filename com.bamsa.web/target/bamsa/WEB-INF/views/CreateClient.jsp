<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.ClockTimeModel"%>
<%@page import="com.bamsa.web.model.EmployeeModel"%>
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

    <title>Contact Form</title> 

<%
List<EmployeeModel> details=(List)request.getAttribute("owners");
String contacts =(String)request.getAttribute("accountdetails");


String message =(String)request.getAttribute("errormessage");
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
	$("#flip").click(function(){
        $("#panel").slideToggle("slow");
    });
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
   $(document).ready(function() {
		 $("[required]").after("<span class='required'>*</span>");
		});
   </script>
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
   $("#fname").on("keypress",function(evt){
	    var keycode = evt.charCode || evt.keyCode;
	    alert(keycode);
	      if (keycode  == 46) {
	        return false;
	      }
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
              <div class="panel-heading-fd ">
                <div class="row">
              
                    <h3 class=" text-center"><b style="color:#fff">Add Contact</b></h3>
                 
                   
                </div>
              </div>
              <div>
               <h3 style="text-align:center;color:red"><%=message %></h3>
				<h3 style="text-align:center;color:green"><%=successmessage %></h3>	
				</div>
				<form:form action="registerAccount"  enctype="multipart/form-data"  name="registration" id="clientregistration" class="register">
				
				<div class="col-md-12">
             <fieldset class="row1">
             
                <legend style="color:#408000"><b>Contact Information</b>
                </legend>
                <p>
                    <label>First Name 
                    </b></label>
                   
                    <input type="text" class="long" name="fname" pattern="[^.\x22]+" maxlength="20" id="fname" title="Invalid input" required/>
                </p>
                 <p>
                    <label>Last Name 
                    </b></label>
                    <input type="text" class="long" name="lname" maxlength="20" id="lname" />
                </p>
                
 

                <p>
                    <label>Company Name 
                    </b></label>
                    <input type="text" class="long" name="accountname" maxlength="20" id="name" required/>
                </p>
                <p>
                    <label>Contact Owner 
                    </label>
                    <select id="accowner" name="accowner" >
                    <option value=""><b>Select Contact Owner</b>
                        </option>
                        <%                        
                        for(EmployeeModel empmodel:details){
                        %>
                        <option value="<%=empmodel.getEmpId() %>"><b><%=empmodel.getName() %></b>
                        </option>
                        <%} %>
                        
                        </select>
                </p>
                <p>
                    <label >Category 
                    </label>
                    <select id="category" name="category" required="required">
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
                </p>
                <p>
                    <label>Website 
                    </label>
                    <input  type="text" class="long" name="website" id="website" placeholder="www.example.com" />
                    
                </p>
                <p>
                    <label>Status 
                    </label>
					 <select id="status" name="status" required="required">
                   <option value=""><b>Select Status</b>
                        </option>
                        <option value="active"><b>Active</b>
                        </option>
                         <option value="inactive"><b>In Active</b>
                        </option>
                        </select>
                </p>
               
                 <p>
                    <label>Send ReqList 
                    </label>
                    <input  type="checkbox" name="reqlist" id="reqlist" value="Y"  />
                  </p>
               
                 <p>  
              
                    <label>Send HotList 
                    </label>
                    <input  type="checkbox"  name="hotlist" id="hotlist" value="Y" />
                    
                </p>
            
          
             
     
            
            
                 <p>
                    <label>City 
                    </label>
                    <input type="text" id="city" name="city" class=" long" />
                    
                   
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
                    <label>Primary Email
                    </label>
                     <input  type="email" class="long" maxlength="50" name="pemail" id="pemail" required/>	
                  
                </p>
                <p>
                    <label>Secondary Email 
                    </label>
                     <input  type="email" class="long" name="semail" id="semail" />	
                  
                </p>
                <p>
                    <label>Phone 
                    </label>																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																														
                    <input type="text" class="long" id="phone" name="phone" maxlength="10" pattern="[789][0-9]{9}"  />
                    </p>
                 <p>
								<label>Description </label> <textarea rows="20" cols="70" type="text" class="long"
									name="description" ></textarea>

							</p>
                    
           
           </fieldset>
					</div>
           
          <div class="col-md-12">
           <center> <fieldset class="row1">
               <div><input type="submit"  class="btn btn-primary btn-lg btn3d" value="Add Account"/></div>
               <input type="hidden" value="0" id="uid" name="uid"/>
            </fieldset></center>
            </div>
        
				
			</form:form>

			</div>
		</div>
<script>
$( "#name" ).autocomplete({
  source: <%=contacts%>
});

 $(function () {
	 $("#name").autocomplete({ change: function() 
		 {   var nam =$(this).val();
		 	console.log(nam);
	       
 		$.ajax({
 			type: "post",
 			url: "/bamsa/getcontactdetails?accname="+nam,
 					
 			success:function(accdetails){
 				console.log(accdetails);
 				$("#website").val(accdetails.website);
 				$("#state").val(accdetails.state);
 				$("#city").val(accdetails.city);
 				$("#description").val(accdetails.description);
 				
 				
					
 								
				},
 			failure:function(){
 				alert("Cannot load details")
 			}  	  
 	}); } }); 
});
 

	
</script>				
</body>
</html>