<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<%
	UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);

	if (userData == null) {
		response.sendRedirect("/bamsa");
	}
%>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Asset Tracking</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="" />


<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<link rel="stylesheet" href='<c:url value="/static/css/tabstyle.css"/>' />
<style>
.active {
	font-weight: bold;
	background-color: #eaeaea !important;
}
</style>

<!-- HTML code from Bootply.com editor -->
<%
	List<String> branchnames = (List) request.getAttribute("report");

	String successmessage = (String) request.getAttribute("successmessage");
	if (successmessage == null) {
		successmessage = "";
	}
	String errormessage = (String) request.getAttribute("errormessage");
	if (errormessage == null) {
		errormessage = "";
	}
%>
<%
	EmployeeDetailsModel empModel = (EmployeeDetailsModel) request.getSession()
			.getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);
	
	boolean showall = false;

	if (null!=empModel && (empModel.getStreamId() == 0 || empModel.getStreamId() == 6)) {
		showall = true;
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
		$(document).ready(function() {
			$("#assets").addClass("act");
			$("#createnew").addClass("actv");
		});

	</script>

<style>
.modeling{
	width:68% !important;
	float:left !important;
}
</style>
	<div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
            <div class="page-title">
  
  
  
              <div style="/*! margin-left: 161px; */" class="col col-xs-12">
       <div class="btn-group btn-breadcrumb">
             <%if(showall){ %>
            <a href="showTicket" id="riseticket" class="btn btn-info">Raise Ticket</a>
            <a href="viewTicket" class="btn btn-info">Ticket Show</a>
            <a href="CompanyAssets" id="createnew" class="btn btn-info">Create New</a>
            <a href="licensedetails" class="btn btn-info">View All</a>
            <%}else{ %>
             <a href="showTicket" id="riseticket" class="btn btn-info">Raise Ticket</a>
            <a href="viewTicket" class="btn btn-info">Ticket Show</a>
            <%} %>
        </div>
        
	</div>
	
<div class="title_left text-center">
               <h3 style="padding: 11px;">Add Asset/License/Accessory/Consumable/Component</h3>
              </div>

				
				<h3 style="text-align: center; color: green"><%=successmessage %></h3>
				<h3 style="text-align: center; color: red"><%=errormessage %></h3>
				
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


					<div class="tab-content">
						<div class="tab-pane fade in active" id="home">
							<div class="row">
								<div class="col-md-8 col-md-offset-1">
									<div >
										<div class="box-header with-border">
											<h4 class="box-title text-left text-primary"
												style="margin-top: -20px; margin-bottom: 33px; font-family: intial;">
												<b>Add Asset</b>
											</h4>

										</div>
										<!-- /.box-header -->

										<div class="box-body">
											<form:form id="create-form" class="form-horizontal"
												action="registerAsset" method="post"
												enctype="multipart/form-data" name="assetregistration">
												<!-- CSRF Token -->


												<!-- Asset Tag -->
												<div class="form-group ">
													<label for="asset_tag" class="col-md-4 control-label">Asset
														Tag </label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text" name="asset_tag"
															id="asset_tag" maxlength="35" value="" required />


													</div>
												</div>
												<!-- Model -->
												<div class="form-group ">
													<label for="parent" class="col-md-4 control-label">Model
														</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" id="model_select_id"
															name="model_id" maxlength="35" required />
													</div>
												</div>
												<div class="form-group ">
													<label for="status_id" class="col-md-4 control-label">Status
														</label>
													<div class="col-md-7 col-sm-10 ">
														<select class="modeling" style="width:52%"
															id="status_select_id" name="status_id" required>
															<option value="" selected="selected">Select
																Status</option>
															<option value="<%=ApplicationConstants.ARCHIVED%>">Archived</option>
															<option
																value="<%=ApplicationConstants.BROKEN_NOT_FIXABLE%>">Broken
																- Not Fixable</option>
															<option value="<%=ApplicationConstants.LOST_OR_STOLEN%>">Lost/Stolen</option>
															<option
																value="<%=ApplicationConstants.OUT_OF_DIAGNOSTICS%>">Out
																for Diagnostics</option>
															<option value="<%=ApplicationConstants.OUT_FOR_REPAIR%>">Out
																for Repair</option>
															<option value="<%=ApplicationConstants.PENDING%>">Pending</option>
															<option value="<%=ApplicationConstants.READY_TO_DEPLOY%>">Ready
																to Deploy</option>
														</select>

													</div>

												</div>
												<div class="form-group ">
													<label for="serial" class="col-md-4 control-label">Select Branch </label> 
													<div class="col-md-7 col-sm-10 ">
													<select class="modeling" style="width:52%"
														name="branchname" required="required">
														<option value="">Select</option>
														<%
															for (String m : branchnames) {
														%>
														<option value="<%=m%>"><%=m%></option>
														<%
															}
														%>
													</select>
													</div>
													</div>


												
												<!-- Serial -->
												<div class="form-group ">
													<label for="serial" class="col-md-4 control-label">Serial
														 </label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling " type="text" name="serial"
															id="serial" value="" maxlength="35" required />

													</div>
												</div>
												<!-- Name -->
												<div class="form-group ">
													<label for="name" class="col-md-4 control-label">Asset
														Name </label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling " type="text" name="assetname"
															id="name" value="" maxlength="35" required />

													</div>
												</div>
												<!-- Purchase Date -->
												<div class="form-group ">
													<label for="purchase_date" class="col-md-4 control-label">Purchase
														Date</label>
													<div class="col-md-7 col-sm-10 ">
														<input type="text" class="modeling datepickers "
															name="purchasedate" placeholder="dd-mm-yy" required />

													</div>

												</div>
												<div class="form-group ">
													<label for="supplier_id" class="col-md-4 control-label">Supplier
														</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" name="supplier_id" required />

													</div>

												</div>
												<!-- Order Number -->
												<div class="form-group ">
													<label for="order_number" class="col-md-4 control-label">Order
														Number </label>
													<div class="col-md-7 col-sm-10 ">
														<input class=" modeling" type="text"
															name="order_number" id="order_number" value="" required />

													</div>
												</div>
												<!-- Purchase Cost -->
												<div class="form-group ">
													<label for="purchase_cost" class="col-md-4 control-label">Purchase
														Cost </label>
													<div class="col-md-5 ">
														<div class="input-group" style="z-index: 0">
															<span class="input-group-addon"> INR </span> <input
																style="width:189px" class="select2 form-control"
																type="text" name="purchase_cost" id="purchase_cost"
																value=""
																pattern="^([1-9]{1})([0-9]{1,99})(\.[0-9]{1,2})?$"
																required />

														</div>
													</div>
												</div>
												<!-- Warranty -->
												<div class="form-group ">
													<label for="warranty_months" class="col-md-4 control-label">Warranty
														</label>
													<div class="col-md-5 ">
														<div class="input-group" style="z-index: 0">

															<span class="input-group-addon">Months</span> <input
																style="width: 167px" class="select2 form-control"
																type="text" name="warranty_months" id="warranty_months"
																value="" pattern="[\d]+" required />
														</div>



													</div>
												</div>
												<!-- Notes -->
												<div class="form-group ">
													<label for="notes" class="col-md-4 control-label">Notes</label>
													<div class="col-md-7 col-sm-12 ">
														<textarea class=" modeling" id="notes"
															name="notes"></textarea>

													</div>
												</div>

												<div class="form-group ">
													<label class="col-md-4 control-label" for="image">Upload
														Image </label>
													<div class="col-md-5 ">
														<!-- <input name="image" type="file"> -->
														<input type="file" id="file-upload" style="float:left;" accept="image/*"
															name="image" required />

													</div>
												</div>
												<div class="box-footer text-center">

													<button type="submit" class="btn btn-success">
														<i class="fa fa-check icon-white"></i> Save
													</button>
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="profile">
							<div class="row">
								<div class="col-md-8 col-md-offset-1">
									<div >
										<div class="box-header with-border">
											<h4 class="box-title text-left text-primary"
												style="margin-top: -20px; margin-bottom: 33px; font-family: intial;">
												<b>Add License </b>
											</h4>

										</div>
										<!-- /.box-header -->

										<div class="box-body">
											<form id="create-form" class="form-horizontal" method="post"
												action="registerLicense" autocomplete="off" role="form"
												enctype="multipart/form-data">
												<!-- CSRF Token -->
												<input type="hidden" name="_token" value="">


												<!-- software name -->
												<div class="form-group ">
													<label for="asset_tag" class="col-md-4 control-label">License
														Tag </label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text"
															name="License_tag" id="License_tag" value="" required />


													</div>
												</div>
												<div class="form-group ">
													<label for="serial" class="col-md-4 control-label">Select Branch </label> 
													<div class="col-md-7 col-sm-10 ">
													<select class="modeling" style="width:52%"
														name="branchname" required="required">
														<option value="">Select</option>
														<%
															for (String m : branchnames) {
														%>
														<option value="<%=m%>"><%=m%></option>
														<%
															}
														%>
													</select>
													</div>
													</div>
												
												<div class="form-group ">
													<label for="asset_tag" class="col-md-4 control-label">Software
														Name</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text" name="software"
															id="software" value="" required />


													</div>
												</div>
												<!-- product key-->
												<div class="form-group ">
													<label for="notes" class="col-md-4 control-label">Product
														Key</label>
													<div class="col-md-7 col-sm-10 ">
														<input class=" modeling" type="text" id="product"
															name="product" maxlength="35" required />

													</div>
												</div>
												<!-- Seeds -->
												<div class="form-group ">
													<label for="seats" class="col-md-4 control-label">Seats
													</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text" name="seats"
															id="seats" value="" pattern="[\d]+" required />

													</div>
												</div>

												<div class="form-group ">
													<label for="status_id" class="col-md-4 control-label">Manufacturer</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text"
															name="manufacturer" id="manufacturer" value="" required />

													</div>
												</div>
												<!-- License name -->
												<div class="form-group ">
													<label for="Licensename" class="col-md-4 control-label">Licensed
														to Name </label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text" name="Licensed"
															id="Licensed" value="" required />

													</div>
												</div>
												<!-- License to mail -->
												<div class="form-group ">
													<label for="Licensemail" class="col-md-4 control-label">Licensed
														to Email</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="email"
															name="Licensedemail" id="Licensedemail" value="" required />

													</div>
												</div>
												<!-- Purchase Date -->
												<div class="form-group ">
													<label for="purchase_date" class="col-md-4 control-label">Purchase
														Date </label>
													<div class="col-md-7 col-sm-10 ">
														<input type="text" class="datepickers modeling"
															name="purchasedate" placeholder="dd-mm-yy" required />

													</div>

												</div>

												<!-- Order Number -->
												<div class="form-group ">
													<label for="order_number" class="col-md-4 control-label">Order
														Number </label>
													<div class="col-md-7 col-sm-10">
														<input class="modeling" type="text"
															name="order_number" id="order_number" maxlength="35" value="" required />

													</div>
												</div>
												<!-- Purchase Cost -->
												<div class="form-group ">
													<label for="purchase_cost" class="col-md-4 control-label">Purchase
														Cost </label>
													<div class="col-md-5">
														<div class="input-group" style="z-index: 0">
															<span class="input-group-addon"> INR </span> <input
																style="width: 191px"  type="text"
																name="purchase_cost" id="purchase_cost" value=""
																pattern="^([1-9]{1})([0-9]{1,99})(\.[0-9]{1,2})?$"
																required />

														</div>
													</div>
												</div>
												<!-- Expiration Date -->
												<div class="form-group ">
													<label for="expiration_date" class="col-md-4 control-label">Expiration
														Date</label>
													<div class="col-md-7 col-sm-10 ">
														<input type="text" class="datepickers modeling"
															name="expiraydate" placeholder="dd-mm-yy" required />

													</div>

												</div>
												<!-- Notes -->
												<div class="form-group ">
													<label for="notes" class="col-md-4 control-label">Notes</label>
													<div class="col-md-7 col-sm-12 ">
														<textarea class=" modeling" id="notes"
															name="notes"></textarea>

													</div>
												</div>

												<div class="box-footer text-center">

													<button type="submit" class="btn btn-success">
														<i class="fa fa-check icon-white"></i> Save
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="messages">
							<div class="row">
								<div class="col-md-8 col-md-offset-1">
									<div >
										<div class="box-header with-border">
											<h4 class="box-title text-left text-primary"
												style="margin-top: -20px; margin-bottom: 33px; font-family: intial;">
												<b>Add Accessory</b>
											</h4>

										</div>
										<!-- /.box-header -->

										<div class="box-body">
											<form id="create-form" class="form-horizontal" method="post"
												action="registeraccessory">
												<!-- CSRF Token -->
												<input type="hidden" name="_token" value="">


												<!--Accessory Name -->
												<div class="form-group ">
													<label for="asset_tag" class="col-md-4 control-label">Accessory
														Tag </label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text"
															name="accessorytag" id="accessory_tag" value="" required />


													</div>
												</div>
												<div class="form-group ">
													<label for="serial" class="col-md-4 control-label">Select Branch </label> 
													<div class="col-md-7 col-sm-10 ">
													<select class="modeling" style="width:52%"
														name="branchname" required="required">
														<option value="">Select</option>
														<%
															for (String m : branchnames) {
														%>
														<option value="<%=m%>"><%=m%></option>
														<%
															}
														%>
													</select>
													</div>
													</div>
												
												<div class="form-group ">
													<label for="asset_tag" class="col-md-4 control-label">Accessory
														Name</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text" name="software"
															id="software" value="" required />


													</div>
												</div>
												<div class="form-group ">
													<label for="category_id" class="col-md-4 control-label">Category</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text" name="category"
															id="category" value="" required />
													</div>
												</div>
												<div class="form-group ">
													<label for="status_id" class="col-md-4 control-label">Manufacturer</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text"
															name="manufacturer" id="manufacturer" value="" required />
													</div>
												</div>
												<!-- Model -->
												<div class="form-group ">
													<label for="parent" class="col-md-4 control-label">ModelNo</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" id="model_select_id"
															name="modelid" required />
													</div>
												</div>
												<!-- Purchase Date -->
												<div class="form-group ">
													<label for="purchase_date" class="col-md-4 control-label">Purchase
														Date </label>
													<div class="col-md-7 col-sm-10 ">
														<input type="text" class="datepickers modeling"
															name="purchasedate" placeholder="dd-mm-yy" required />

													</div>

												</div>

												<!-- Order Number -->
												<div class="form-group ">
													<label for="order_number" class="col-md-4 control-label">Order
														Number </label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text"
															name="ordernumber" id="order_number" value="" required />

													</div>
												</div>
												<!-- Purchase Cost -->
												<div class="form-group ">
													<label for="purchase_cost" class="col-md-4 control-label">Purchase
														Cost </label>
													<div class="col-md-5">
														<div class="input-group" style="z-index: 0">
															<span class="input-group-addon"> INR </span> <input
																style="width: 188px" class="form-control" type="text"
																name="purchasecost" id="purchase_cost" value=""
																pattern="^([1-9]{1})([0-9]{1,99})(\.[0-9]{1,2})?$"
																required />

														</div>
													</div>
												</div>
												<div class="form-group ">
													<label for="order_number" class="col-md-4 control-label">Quantity</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text"
															name="Quantitynumber" id="Quantity_number" value=""
															pattern="[\d]+" required />

													</div>
												</div>
												<div class="box-footer text-center">

													<button type="submit" class="btn btn-success">
														<i class="fa fa-check icon-white"></i> Save
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="tab-pane fade" id="settings">
							<div class="row">
								<div class="col-md-8 col-md-offset-1">
									<div >
										<div class="box-header with-border">
											<h4 class="box-title text-left text-primary"
												style="margin-top: -20px; margin-bottom: 33px; font-family: intial;">
												<b>Add Consumable</b>
											</h4>

										</div>
										<!-- /.box-header -->

										<div class="box-body">
											<form id="create-form" class="form-horizontal" method="post"
												action="registerConsumable" autocomplete="off" role="form"
												enctype="multipart/form-data">
												<!-- CSRF Token -->
												<input type="hidden" name="_token" value="">


												<!--Consumable Name-->
												<div class="form-group ">
													<label for="asset_tag" class="col-md-4 control-label">Consumable
														Tag</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text"
															name="consumable_tag" id="consumable_tag" value=""
															required />


													</div>
												</div>
												<div class="form-group ">
													<label for="asset_tag" class="col-md-4 control-label">Consumable
														Name</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text" name="consumable"
															id="consumable" value="" required />


													</div>
												</div>
												<div class="form-group ">
													<label for="category_id" class="col-md-4 control-label">Category</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text" name="category"
															id="category" value="" required />
													</div>
												</div>
												<div class="form-group ">
													<label for="serial" class="col-md-4 control-label">Select Branch </label> 
													<div class="col-md-7 col-sm-10 ">
													<select class="modeling" style="width:53%"
														name="branchname" required="required">
														<option value="">Select</option>
														<%
															for (String m : branchnames) {
														%>
														<option value="<%=m%>"><%=m%></option>
														<%
															}
														%>
													</select>
													</div>
													</div>
											
												
												<div class="form-group ">
													<label for="status_id" class="col-md-4 control-label">Manufacturer</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text"
															name="manufacturer" id="manufacturer" value="" required />
													</div>
												</div>
												<!-- Model -->
												<div class="form-group ">
													<label for="parent" class="col-md-4 control-label">ModelNo</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" id="model_select_id"
															name="model_id" required />
													</div>
												</div>
												<!-- ItemNO -->
												<div class="form-group ">
													<label for="parent" class="col-md-4 control-label">ItemNO</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" id="itemno" name="itemno"
															required />
													</div>
												</div>
												<!-- Purchase Date -->
												<div class="form-group ">
													<label for="purchase_date" class="col-md-4 control-label">Purchase
														Date </label>
													<div class="col-md-7 col-sm-10 ">
														<input type="text" class="datepickers modeling"
															name="purchasedate" placeholder="dd-mm-yy" required />

													</div>

												</div>

												<!-- Order Number -->
												<div class="form-group ">
													<label for="order_number" class="col-md-4 control-label">Order
														Number </label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text"
															name="order_number" id="order_number" value="" required />

													</div>
												</div>
												<!-- Purchase Cost -->
												<div class="form-group ">
													<label for="purchase_cost" class="col-md-4 control-label">Purchase
														Cost </label>
													<div class="col-md-5">
														<div class="input-group" style="z-index: 0">
															<span class="input-group-addon"> INR </span> <input
																style="width: 190px" class="form-control" type="text"
																name="purchase_cost" id="purchase_cost" value=""
																pattern="^([1-9]{1})([0-9]{1,99})(\.[0-9]{1,2})?$"
																required />

														</div>
													</div>
												</div>
												<div class="form-group ">
													<label for="order_number" class="col-md-4 control-label">Quantity</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text"
															name="Quantity_number" id="Quantity_number" value=""
															pattern="[\d]+" required />

													</div>
												</div>
												<div class="box-footer text-center">

													<button type="submit" class="btn btn-success">
														<i class="fa fa-check icon-white"></i> Save
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="doner">
							<div class="row">
								<div class="col-md-8 col-md-offset-1">
									<div >
										<div class="box-header with-border">
											<h4 class="box-title text-left text-primary"
												style="margin-top: -20px; margin-bottom: 33px; font-family: intial;">
												<b>Add Component</b>
											</h4>

										</div>
										<!-- /.box-header -->

										<div class="box-body">
											<form id="create-form" class="form-horizontal" method="post"
												action="registercomponent">
												<!-- CSRF Token -->

												<!--Component Name-->
												<div class="form-group ">
													<label for="asset_tag" class="col-md-4 control-label">Component
														Tag </label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text"
															name="componenttag" id="component_tag" value="" required />


													</div>
												</div>
												<div class="form-group ">
													<label for="asset_tag" class="col-md-4 control-label">Component
														Name</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text" name="component"
															id="component" value="" required />


													</div>
												</div>
												<div class="form-group ">
													<label for="category_id" class="col-md-4 control-label">Category</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text" name="category"
															id="category" required />
													</div>
												</div>
                                                <div class="form-group ">
													<label for="serial" class="col-md-4 control-label">Select Branch </label> 
													<div class="col-md-7 col-sm-10 ">
													<select class="modeling" style="width:52%"
														name="branchname" required="required">
														<option value="">Select</option>
														<%
															for (String m : branchnames) {
														%>
														<option value="<%=m%>"><%=m%></option>
														<%
															}
														%>
													</select>
													</div>
													</div>
											
												<!--SerialNo-->
												<div class="form-group ">
													<label for="parent" class="col-md-4 control-label">SerialNo</label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling"
															"
															id="serialno" name="serialno" required />
													</div>
												</div>
												<!-- Purchase Date -->
												<div class="form-group ">
													<label for="purchase_date" class="col-md-4 control-label">Purchase
														Date </label>
													<div class="col-md-7 col-sm-12 ">
														<input type="text" class="datepickers modeling"
															name="purchasedate" placeholder="dd-mm-yy" required />

													</div>

												</div>

												<!-- Order Number -->
												<div class="form-group ">
													<label for="order_number" class="col-md-4 control-label">Order
														Number </label>
													<div class="col-md-7 col-sm-10 ">
														<input class="modeling" type="text"
															name="ordernumber" id="order_number" value="" required />

													</div>
												</div>
												<!-- Purchase Cost -->
												<div class="form-group ">
													<label for="purchase_cost" class="col-md-4 control-label">Purchase
														Cost </label>
													<div class="col-md-5">
														<div class="input-group" style="z-index: 0">
															<span class="input-group-addon"> INR </span> <input
																style="width: 190px" class="form-control" type="text"
																name="purchase_cost" id="purchase_cost" value=""
																pattern="^([1-9]{1})([0-9]{1,99})(\.[0-9]{1,2})?$"
																required />

														</div>
													</div>
												</div>
												<div class="box-footer text-center">

													<button type="submit" class="btn btn-success">
														<i class="fa fa-check icon-white"></i> Save
													</button>
												</div>
											</form>
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







	<!-- JavaScript jQuery code from Bootply.com editor  -->
	<script>
		jQuery(document).ready(function() {
			$(".datepickers").datepicker({
				dateFormat : 'dd-mm-yy',
				changeMonth : true,
				changeYear : true,
				yearRange : "-100:+100"

			});

		});
	</script>
	<script type='text/javascript'
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>