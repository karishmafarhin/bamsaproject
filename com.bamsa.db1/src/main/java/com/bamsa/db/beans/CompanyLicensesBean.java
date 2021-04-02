package com.bamsa.db.beans;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class CompanyLicensesBean {
	private int clid;
	private String licenseTag;
	private int createdBy;
	private Date createdDate;
	private String softwareName;
	private int seats;
	private String manufacturer;
	private String licensedTo;
	private String licensedMail;
	private String productKey;
	private String orderNo;
	private float purchaseCost;
	private Date purchasedDate;
	private Date expirationDate;
	private String notes;
	private String empid;
	private String branchname;
	 
	 public String getBranchname() {
		return branchname;
	}
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public String getLicenseTag() {
		return licenseTag;
	}
	public void setLicenseTag(String licenseTag) {
		this.licenseTag = licenseTag;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public int getClid() {
		return clid;
	}
	public void setClid(int clid) {
		this.clid = clid;
	}
	public String getSoftwareName() {
		return softwareName;
	}
	public void setSoftwareName(String softwareName) {
		this.softwareName = softwareName;
	}
	public int getSeats() {
		return seats;
	}
	public void setSeats(int seats) {
		this.seats = seats;
	}
	
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getLicensedTo() {
		return licensedTo;
	}
	public void setLicensedTo(String licensedTo) {
		this.licensedTo = licensedTo;
	}
	public String getLicensedMail() {
		return licensedMail;
	}
	public void setLicensedMail(String licensedMail) {
		this.licensedMail = licensedMail;
	}
	public String getProductKey() {
		return productKey;
	}
	public void setProductKey(String productKey) {
		this.productKey = productKey;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public float getPurchaseCost() {
		return purchaseCost;
	}
	public void setPurchaseCost(float purchaseCost) {
		this.purchaseCost = purchaseCost;
	}
	public Date getPurchasedDate() {
		return purchasedDate;
	}
	public void setPurchasedDate(Date purchasedDate) {
		this.purchasedDate = purchasedDate;
	}
	public Date getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CompanyLicensesBean [clid=");
		builder.append(clid);
		builder.append(", softwareName=");
		builder.append(softwareName);
		builder.append(", licenseTag=");
		builder.append(licenseTag);
		builder.append(", createdBy=");
		builder.append(createdBy);
		builder.append(", createdDate=");
		builder.append(createdDate);
		builder.append(", seats=");
		builder.append(seats);
		builder.append(", manufacturer=");
		builder.append(manufacturer);
		builder.append(", purchasedDate=");
		builder.append(purchasedDate);
		builder.append(", licensedTo=");
		builder.append(licensedTo);
		builder.append(", orderNo=");
		builder.append(orderNo);
		builder.append(", purchaseCost=");
		builder.append(purchaseCost);
		builder.append(", licensedMail=");
		builder.append(licensedMail);
		builder.append(", productKey=");
		builder.append(productKey);
		builder.append(", expirationDate=");
		builder.append(expirationDate);
		builder.append(", notes=");
		builder.append(notes);
		builder.append(",empid=");
		builder.append(empid);
		builder.append(",branchname=");
		builder.append(branchname);
		builder.append("]");
		
		return builder.toString();
	}

}
