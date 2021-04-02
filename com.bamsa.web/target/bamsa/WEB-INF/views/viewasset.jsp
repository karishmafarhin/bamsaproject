<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.util.List"%>
<%@page import="com.bamsa.web.model.UserBean"%>

<%@page import="com.bamsa.web.model.EmployeeDetailsModel"%>
<%@page import="com.bamsa.web.model.CompanyAssetModel" %>
<%@page import="com.bamsa.web.model.CompanyLicenseModel" %>
<%@page import="com.bamsa.web.model.CompanyConsumableModel" %>
<%@page import="com.bamsa.web.model.CompanyAccessoryModel" %>
<%@page import="com.bamsa.web.model.CompanyComponentModel" %>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>AssetDetails</title>
<script type="text/javascript"  src='<c:url value="/static/js/jquery-1.11.1.min.js"/>'></script> 

<% 
UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
if(userData == null)
{
	response.sendRedirect("/bamsa");	
}
%>
<%
List<CompanyLicenseModel> details = (List)request.getAttribute("license");
 List<CompanyConsumableModel> consume = (List)request.getAttribute("consumable");  
 List<CompanyAssetModel> detail = (List)request.getAttribute("AssetDetails");  
 List<CompanyAccessoryModel> model=(List)request.getAttribute("AccessoryDetails");
 List<CompanyComponentModel> component=(List)request.getAttribute("componentDetails");

 int count=0;
 if((Integer)(request.getAttribute("alertcount"))!=0){
	 count=(Integer)request.getAttribute("alertcount");
 }
 %>
<% 
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

boolean  showall=false;
 
 if(null!=empModel && (empModel.getStreamId()==0|| empModel.getStreamId()==6)) {
 	 showall=true;
 }
 %>

 

 


<link rel="stylesheet" href='<c:url value="/static/css/tabstyle.css"/>' />

<style>
.active {
	font-weight: bold;
	background-color: #fff !important;
}
.tabi {

    overflow-x: scroll !important;
}
</style>
<!-- HTML code from Bootply.com editor -->

<script>
$( document ).ready(function() {
	$("#assets").addClass("act");
	$("#viewall").addClass("actv");
	
	
	
});

</script>
</head>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
             <div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
           
  
  
  
              <div style="/*! margin-left: 161px; */" class="col col-xs-12">
       <div class="btn-group btn-breadcrumb">
             <%if(showall){ %>
            <a href="showTicket" id="riseticket" class="btn btn-info">Raise Ticket</a>
            <a href="viewTicket" class="btn btn-info">Ticket Show</a>
            <a href="CompanyAssets" class="btn btn-info">Create New</a>
            <a href="licensedetails" id="viewall" class="btn btn-info">View All</a>
            <%}else{ %>
             <a href="showTicket" id="riseticket" class="btn btn-info">Raise Ticket</a>
            <a href="viewTicket" class="btn btn-info">Ticket Show</a>
            <%} %>
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
<div class="x_panel" style="height: 1020px;margin-top: 20px;">
                
                  <div class="x_content">
             
             
             

	<div class="content-wrapper ">
	
	
				<div >
             <div class="board-inner">
          
	</div>
	
	
					<div class="board-inner">
						<ul class="nav nav-tabs" id="myTab">
							<div></div>
							<li class="active"><a href="#home" data-toggle="tab"
								title="Assets"> <span class="round-tabs one"> <i
										class="fa fa-barcode"></i>
								</span>
							</a></li>
							<li><a href="#profile" data-toggle="tab" title="License">
									<span class="round-tabs two"> <i class="fa fa-floppy-o"></i>
								</span>
							</a></li>
							<li><a href="#messages" data-toggle="tab" title="Accessory">
									<span class="round-tabs three"> <i
										class="fa fa-keyboard-o"></i>
								</span>
							</a></li>
							<li><a href="#settings" data-toggle="tab" title="consumable">
									<span class="round-tabs four"> <i class="fa fa-tint"></i>
								</span>
							</a></li>

							<li><a href="#doner" data-toggle="tab" title="component">
									<span class="round-tabs five"> <i class="fa fa-hdd-o"></i>
								</span>
							</a></li>
						</ul>
					</div>

					<div class="tab-content">
						<div class="tab-pane fade in active" id="home">				
		<div class="row" >

            <div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-12">
                    <h2 class="panel-title text-center"><b>Asset Status</h2></b>
                  </div>
                  
                </div>
              </div>
               <div class="table-responsive tabi ">
              <table id="mytable" class="table table-striped table-bordered table-list  " style="text-align: center;" id="dev-table">
							<thead>
								<tr class="st1">
                                <th class="info" >S.No</th>
                                <th class="info" >Asset Tag</th>
                                <th class="info" >Asset Name</th>
                                <th class="info" >Asset Status</th>
								<th class="info" >Asset Serial</th>
								<th class="info" >Branch Name</th>
								<th class="info" >Created By</th>
								<th class="info" >Created Date</th>
								<th class="info" >purchase Cost</th>
								 <th class="info" >Purchase Date</th>
                                <th class="info" >Supplier</th>
                                <th class="info" >Order No</th>
								<th class="info" >Warranty</th>
								<th class="info" >Notes</th>
								<th class="info" >Asset Image</th>
								<th class="info" >Model</th>
							</tr>
						</thead>
						<tbody>
						<%int i=1;
                                 for(CompanyAssetModel asset:detail){
                                  %>
							<tr class="st1">
                                <td ><%=i%></td>
								<td ><%=asset.getAssetTag()%></td>
								<td ><%=asset.getAssetName()%></td>
								<td ><%=asset.getAssetStatus()%></td>
								<td><%=asset.getAssetSerial() %></td>
								<td><%=asset.getBranchname() %></td>
								<td><%=asset.getEmpid() %></td>
								<td  style='white-space:nowrap;'><%=asset.getCreatedDate() %></td>
								<td><%=asset.getPurchaseCost()%></td>
								<td  style='white-space:nowrap;'><%=asset.getPurchasedDate() %></td>
								<td><%=asset.getSupplier()%></td>
								<td><%=asset.getOrderNo()%></td>
								<td><%=asset.getWarranty()%></td>
								<%if(null != asset.getNotes()){%>
								<td><%=asset.getNotes()%></td>
								<%}else{%>
								<td>----</td>
								<%}%>
								<td><img src="<%=asset.getAssetPic() %>"  alt="" class="img-responsive" alt=""/></td>
								<td><%=asset.getModel() %></td>
							</tr>
						<%i++; } %>
						</tbody>
								</table>		  
                             
					</div>
					</div>
					</div>
					</div>
               
             
            
						<div class="tab-pane fade" id="profile">
						<div class="row" style="margin-right: auto;margin-left: 2px;">

             <div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-12">
                    <h2 class="panel-title text-center"><b>License Status</h2></b>
                  </div>
                  
                </div>
              </div>
               
               
             <div class="table-responsive tabi ">
              <table id="mytable1" class="table table-striped table-bordered table-list " style="text-align: center;" id="dev-table">
                 <%
if(count>0){

%>
    	<div class="alert alert-danger">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			<span><strong>Alert: you have <%=count %> (license)s which have the expired date below one week
			 </strong>  </span>
		</div>
	<%} else{%>
	<div></div>
	<%} %>
                  <thead>
								<tr class="st1">
                                <th class="info" >S.No</th>
                                <th class="info" >licenseTag</th>
                                <th class="info" >Software Name</th>
                                <th class="info" >seats</th>
								<th class="info" >Manufacturer</th>
								<th class="info" >Branch Name</th>
								<th class="info" >Licensed to </th>
								<th class="info" >Licensed mail</th>
								<th class="info" >Created by</th>
								 <th class="info">Product key</th>
                                <th class="info" >Order</th>
                                <th class="info" >Purchase cost</th>
								<th class="info" >Purchase Date</th>
								<th class="info" >Expired Date</th>
								<th class="info" >Notes</th>
								<th class="info" >Created Date</th>
							</tr>
						</thead>
						<tbody>
						
						<%int j=1;
						for(CompanyLicenseModel license:details){%>
							<tr class="st1">
								<td ><%=j%></td>
								<td ><%=license.getLicenseTag()%></td>
								<td><%=license.getSoftwareName()%></td>
								<td><%=license.getSeats()%></td>
								<td><%=license.getManufacturer()%></td>
								<td><%=license.getBranchname() %></td>
								<td><%=license.getLicensedTo()%></td>
								<td><%=license.getLicensedMail()%></td>
								<td><%=license.getEmpid()%></td>
								<td><%=license.getProductKey()%></td>
								<td><%=license.getOrderNo()%></td>
								<td><%=license.getPurchaseCost()%></td>
								<td  style='white-space:nowrap;'><%=license.getPurchasedDate()%></td>
								<td><%=license.getExpirationDate() %>
								<%if(null != license.getNotes()){%>
								<td><%=license.getNotes()%></td>
								<%}else{%>
								<td>----</td>
								<%}%>
								<td><%=license.getCreatedDate() %>
							</tr>
					<%j++; } %>
						</tbody>
								</table>		  
						
            </div> 
            </div>
            </div>
            </div>
                <div class="tab-pane fade" id="messages">
						<div class="row" style="margin-right: auto;margin-left: 2px;">

             <div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-12">
                    <h2 class="panel-title text-center"><b>Accessory Status</h2></b>
                  </div>
                  
                </div>
              </div>
               
               
             <div class="table-responsive tabi">
              <table id="mytable2" class="table table-striped table-bordered table-list mytable" style="text-align: center;" id="dev-table">
                  <thead>
								<tr class="st1">
                                <th class="info" >S.No</th>
                                <th class="info" >Accessory Tag</th>
                                <th class="info" >Accessory Name</th>
                                <th class="info" >Branch Name</th>
                                <th class="info" >Category</th>
								<th class="info" >Manufacturer</th>
								<th class="info" >Model No </th>
								<th class="info" >Created by</th>
								<th class="info" >Created Date</th>
                                <th class="info" >Order No</th>
                                <th class="info" >Purchase cost</th>
								<th class="info" >Purchase Date</th>
								<th class="info" >Quantity</th>
								
							</tr>
						</thead>
						<tbody>
						<% int k=1;
						for(CompanyAccessoryModel acc:model){%>
							<tr class="st1">
								<td ><%=k%></td>
								<td ><%=acc.getAccessorytag()%></td>
								<td><%=acc.getAccessoryname()%></td>
								<td><%=acc.getBranchname() %></td>
								<td><%=acc.getCategory()%></td>
								<td><%=acc.getManufacturer()%></td>
								<td><%=acc.getModelno()%></td>
								<td><%=acc.getEmpid()%></td>
								<td  style='white-space:nowrap;'><%=acc.getCreatedDate() %></td>
								<td><%=acc.getOrderno() %></td>
								<td><%=acc.getPurchasecost() %></td>
								<td  style='white-space:nowrap;'><%=acc.getPurchaseDate() %></td>
								<td><%=acc.getQuantity() %></td>
								
							</tr>
						<%k++;}%>	
						</tbody>
								</table>		  
						
            </div> 
            </div>
            </div>
            </div>
							<div class="tab-pane fade" id="settings">
						<div class="row" style="margin-right: auto;margin-left: 2px;">

             <div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-12">
                    <h2 class="panel-title text-center"><b>Consumable Status</h2></b>
                  </div>
                  
                </div>
              </div>
               
               
             <div class="table-responsive tabi">
              <table id="mytable3" class="table table-striped table-bordered table-list mytable" style="text-align: center;" id="dev-table">
                  <thead>
								<tr class="st1">
                                <th class="info" >S.No</th>
                                <th class="info" >Consumable Tag</th>
                                <th class="info" >Consumable Name</th>
                                <th class="info" >Branch Name</th>
                                <th class="info" >Category</th>
								<th class="info" >Manufacturer</th>
								<th class="info" >Model No </th>
								<th class="info" >Item No</th>
								<th class="info" >Created by</th>
								<th class="info" >Created Date</th>
                                <th class="info" >Order No</th>
                                <th class="info" >Purchase cost</th>
								<th class="info" >Purchase Date</th>
								<th class="info" >Quantity</th>
								
							</tr>
						</thead>
						<tbody>
						<%int l=1;
						for(CompanyConsumableModel con:consume){%>
							<tr class="st1">
								<td ><%=l%></td>
								<td ><%=con.getConsumableTag() %></td>
								<td><%=con.getConsumableName() %></td>
								<td><%=con.getBranchname() %></td>
								<td><%=con.getCategory() %></td>
								<td><%=con.getManufacturer() %></td>
								<td><%=con.getModelNo() %></td>
								<td><%=con.getItemNo() %></td>
								<td><%=con.getEmpid()%> </td>
								<td  style='white-space:nowrap;'><%=con.getCreatedDate() %></td>
								<td><%=con.getOrderNo() %></td>
								<td><%=con.getPurchaseCost() %></td>
								<td  style='white-space:nowrap;'><%=con.getPurchasedDate() %></td>
								<td><%=con.getQuantity() %></td>
								
							</tr>
						<%l++;}%>	
						</tbody>
								</table>		  
						
            </div> 
            </div>
            </div>
            </div>
                
						
						<div class="tab-pane fade" id="doner">
						<div class="row" style="margin-right: auto;margin-left: 2px;">

             <div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-12">
                    <h2 class="panel-title text-center"><b>Component Status</h2></b>
                  </div>
                  
                </div>
              </div>
               
               
             <div class="table-responsive tabi">
              <table id="mytable4" class="table table-striped table-bordered table-list mytable" style="text-align: center;" id="dev-table">
                  <thead>
								<tr class="st1">
                                <th class="info" >S.No</th>
                                <th class="info" >Component Tag</th>
                                <th class="info" >Component Name</th>
                                <th class="info" >Branch Name</th>
                                <th class="info" >Category</th>
								<th class="info" >Serial No</th>
								<th class="info" >Created by</th>
								<th class="info" >Created Date</th>
                                <th class="info" >Order No</th>
                                <th class="info" >Purchase cost</th>
								<th class="info" >Purchase Date</th>
								
								
							</tr>
						</thead>
						<tbody>
						<%int m=1;
						for(CompanyComponentModel com:component){%>
							<tr class="st1">
								<td ><%=m %></td>
								<td ><%=com.getComponenttag() %></td>
								<td><%=com.getComponentName() %></td>
								<td><%=com.getBranchname() %></td>
								<td><%=com.getCategory() %></td>
								<td><%=com.getSerialNo() %></td>
								<td><%=com.getEmpid()%></td>
								<td  style='white-space:nowrap;'><%=com.getCreatedDate() %></td>
								<td><%=com.getOrderNo() %></td>
								<td><%=com.getPurchaseCost() %></td>
								<td  style='white-space:nowrap;'><%=com.getPurchasedDate() %></td>
								
								
							</tr>
						<%m++;}%>	
						</tbody>
								</table>		  
						
            </div> 
            </div>
            </div>
            </div>
            </div>

						<div class="clearfix"></div>
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
	
	








	
	<script type='text/javascript'
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src='<c:url value="/static/js/jquery.dataTables.min.js"/>'></script> 
<link rel="stylesheet" href='<c:url value="/static/css/jquery.dataTables.min.css"/>' />

<script>
	$(document).ready(function(){

		$('#mytable').DataTable();
		$('#mytable1').DataTable();
		$('#mytable2').DataTable();
		$('#mytable3').DataTable();
		$('#mytable4').DataTable();


			});
	</script>

	
</body>
</html>