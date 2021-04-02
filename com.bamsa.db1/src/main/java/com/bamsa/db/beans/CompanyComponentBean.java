package com.bamsa.db.beans;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class CompanyComponentBean {
	private int ccmid;
	private String componentName;
	private String category;
	private String serialNo;
	private String orderNo;
	private Date purchasedDate;
	private float purchaseCost;
	private int userid;
	private String componenttag;
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
	public String getComponenttag() {
		return componenttag;
	}
	public void setComponenttag(String componenttag) {
		this.componenttag = componenttag;
	}
	private Date createdDate;
	public int getCcmid() {
		return ccmid;
	}
	public void setCcmid(int ccmid) {
		this.ccmid = ccmid;
	}
	public String getComponentName() {
		return componentName;
	}
	public void setComponentName(String componentName) {
		this.componentName = componentName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Date getPurchasedDate() {
		return purchasedDate;
	}
	public void setPurchasedDate(Date purchasedDate) {
		this.purchasedDate = purchasedDate;
	}
	public float getPurchaseCost() {
		return purchaseCost;
	}
	public void setPurchaseCost(float purchaseCost) {
		this.purchaseCost = purchaseCost;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CompanyComponentBean [ccmid=");
		builder.append(ccmid);
		builder.append(", componentName=");
		builder.append(componentName);
		builder.append(", category=");
		builder.append(category);
		builder.append(", serialNo=");
		builder.append(serialNo);
		builder.append(", purchasedDate=");
		builder.append(purchasedDate);
		builder.append(", orderNo=");
		builder.append(orderNo);
		builder.append(", purchaseCost=");
		builder.append(purchaseCost);
		builder.append(", userid=");
		builder.append(userid);
		builder.append(", createdDate");
		builder.append(createdDate);
		builder.append(",componenttag");
		builder.append(componenttag);
		builder.append(",empid=");
		builder.append(empid);
		builder.append(",branchname=");
		builder.append(branchname);
        builder.append("]");
		
		return builder.toString();
	}
}
