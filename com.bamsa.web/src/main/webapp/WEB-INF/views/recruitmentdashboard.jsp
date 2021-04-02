<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel" %>
<%@page import="com.bamsa.web.model.ClockTimeModel"%>
<%@page import="com.bamsa.web.model.OpeningInfoModel"%>

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
<%
int count= 0;
int size= 0;
int hotlist= 0;
int contact= 0;

if(null!=(Integer)request.getAttribute("messageone")){
count=(Integer)request.getAttribute("messageone");
}
if(null!=(Integer)request.getAttribute("messagetwo")){
 size=(Integer)request.getAttribute("messagetwo");
}
if(null!=(Integer)request.getAttribute("messagethree")){
 hotlist=(Integer)request.getAttribute("messagethree");
}
if(null!=(Integer)request.getAttribute("messagefour")){
 contact=(Integer)request.getAttribute("messagefour");}
%>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


<style>
.alpha {
    display: inline-block !important;
    min-width: 10px !important;
    padding: -6px -2px !important;
    font-size: 30px !important;
    font-weight: bold !important;
    line-height: 1 !important;
    color: #fff !important;
    text-align: center !important;
    white-space: nowrap !important;
    vertical-align: baseline !important;
    background-color: #40bf40 !important;
    border-radius: 10px !important;
    margin: 10px !important;
}


</style>
    <title>Recruiter Dashboard</title>   
    

 




<body>
<jsp:include page="header.jsp" />
<script> 
$(document).ready(function(){
    $("#flip").click(function(){
        $("#panel").slideToggle("slow");
    });
    document.getElementById("myNav").style.height = "0%";
});
function submitform(){
	 $("#editid").attr('action', 'viewopening');
	 $("#editid").submit();	
};
function submitforms(){
	 $("#candid").attr('action', 'viewcandidate');
	 $("#candid").submit();	
};
function submitfor(){
	 $("#hotid").attr('action', 'viewhotlist');
	 $("#hotid").submit();	
};
function submitformc(){
	 $("#contactid").attr('action', 'viewcontact');
	 $("#contactid").submit();	
};
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
		<div class="content-wrapper">
		
			
<div class="container">
<div class="col-md-offset-4 col-md-4" ><button type="button" onclick="openNav()" class="btn btn-danger">Quick Add <i class="fa fa-level-down" aria-hidden="true"></i></button></div>
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
    <div class="row">
		<div class="col-md-12">
			<h2  class="text-left"  style="color:#004d99 !important;" style="margin-bottom:50px;" style="color:#004d99 !important"><b>Recruiter Dashboard</b></h2>

			<div class="tabbable-panel">
				<div class="tabbable-line">
					<ul class="nav nav-tabs" >
						<li class="active">
							<a href="#tab_default_1" data-toggle="tab"><i class="fa fa-user" aria-hidden="true"></i>
							 <b>Recruiter Activity </b>
							</a>
						</li>
						<li>
							<a href="#tab_default_2" data-toggle="tab"><i class="fa fa-usd" aria-hidden="true"></i>
							
							<b>Sales Activity </b></a>
						</li>
					
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_default_1">
							
    
    

    <div class="panel-body">
    
     <div class="col-lg-3 dash-widget">
        <div class="label-primary" style="padding: 5px; border-radius: 6px;width: 144px;">
            <button class="btn btn-primary btn-lg btn-block disabled" role="button" style="padding: 2px;">
               <div class="fa fa-bullhorn fa-3x" aria-hidden="true"></div> 

                <div class="icon-label"><%=count %></div>
            </button> 
            <form action="" id="editid">
            <button class="btn btn-inverse btn-block" style="height: 40px;" id="editd" onclick="submitform()">
                OPENINGS
            </button>
            </form>
        </div>
    </div>
    
      <div class="col-lg-3 dash-widget">
          <div class="label-primary" style="padding: 5px; border-radius: 6px;width: 144px;">
            <button class="btn btn-primary btn-lg btn-block disabled" role="button" style="padding: 2px;">
            <div  class="fa fa-male fa-3x" aria-hidden="true"></div>
            <div class="icon-label">
            <%=size %>
            </div></button>
            <form action="" id="candid">
             <button class="btn btn-inverse btn-block" id="candids" style="height: 40px;" onclick="submitforms()">CANDIDATE</button>
          </form></div>
        </div>
    
 
    
       <div class="col-lg-3 dash-widget">
          <div class="label-primary" style="padding: 5px; border-radius: 6px;width: 144px;">
            <button class="btn btn-primary btn-lg btn-block disabled" role="button" style="padding: 2px;">
            <div class="fa fa-book fa-3x" aria-hidden="true"></div>
            <div class="icon-label">
             <%=contact %>
            </div></button>
             <form action="" id="contactid">
             <button class="btn btn-inverse btn-block" style="height: 40px;" id="contactids" onclick="submitformc()">CONTACTS</button>
         </form> </div>
        </div>
        
        
        
      
  
       
         
	</div>

						</div>
						<div class="tab-pane" id="tab_default_2">
							 <div class="panel-body">
    
     <div class="col-lg-3 dash-widget">
        <div class="label-primary" style="padding: 5px; border-radius: 6px;width: 161px;">
            <button class="btn btn-primary btn-lg btn-block disabled" role="button" style="padding: 2px;">
                <div class="fa fa-fire fa-3x" aria-hidden="true"></div>
                <div class="icon-label"><%=hotlist %></div>
            </button> 
             <form action="" id="hotid">
            <button class="btn btn-inverse btn-block" style="height: 40px;"  onclick="submitfor()">
                HOTLIST CANDIDATES
            </button></form>
        </div>
    </div>
    
      <div class="col-lg-3 dash-widget">
          <div class="label-primary" style="padding: 5px; border-radius: 6px;width: 150px;">
            <button class="btn btn-primary btn-lg btn-block disabled" role="button" style="padding: 2px;">
            <div class="fa fa-paper-plane fa-3x" aria-hidden="true"></div>
            <div class="icon-label">
             2
            </div></button> 
           
            <button class="btn btn-inverse btn-block" style="height: 40px;">SUBMISSIONS</button>
          </div>
        </div>
    
 
    <div class="col-lg-3 dash-widget">
          <div class="label-primary" style="padding: 5px; border-radius: 6px;width: 144px;">
            <button class="btn btn-primary btn-lg btn-block disabled" role="button" style="padding: 2px;">
            <div class="fa fa-book fa-3x" aria-hidden="true"></div>
            <div class="icon-label">
                <%=contact %>
            </div></button> <button class="btn btn-inverse btn-block" style="height: 40px;" onclick="submitformc()">CONTACTS</button>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src='<c:url value="/static/js/bootstrap.min.js"/>'></script>

</body>
</html>
