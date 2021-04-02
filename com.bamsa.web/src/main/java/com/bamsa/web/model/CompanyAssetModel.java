package com.bamsa.web.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class CompanyAssetModel {
	private int caid;
	private String assetTag;
	private int createdBy;
	private Date createdDate;
	private String assetStatus;
	private String assetSerial;
	private String assetName;
	private Date purchasedDate;
	private String supplier;
	private String orderNo;
	private float purchaseCost;
	private int warranty;
	private String notes;
	private byte[] assetImage;
	private String model;
	private String assetPic;
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

	
	public String getAssetPic() {
		return assetPic;
	}
	public void setAssetPic(String assetPic) {
		this.assetPic = assetPic;
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
	public int getCaid() {
		return caid;
	}
	public void setCaid(int caid) {
		this.caid = caid;
	}
	public String getAssetTag() {
		return assetTag;
	}
	public void setAssetTag(String assetTag) {
		this.assetTag = assetTag;
	}
	public String getAssetStatus() {
		return assetStatus;
	}
	public void setAssetStatus(String assetStatus) {
		this.assetStatus = assetStatus;
	}
	public String getAssetSerial() {
		return assetSerial;
	}
	public void setAssetSerial(String assetSerial) {
		this.assetSerial = assetSerial;
	}
	public String getAssetName() {
		return assetName;
	}
	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}
	public Date getPurchasedDate() {
		return purchasedDate;
	}
	public void setPurchasedDate(Date purchasedDate) {
		this.purchasedDate = purchasedDate;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
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
	public int getWarranty() {
		return warranty;
	}
	public void setWarranty(int warranty) {
		this.warranty = warranty;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public byte[] getAssetImage() {
		return assetImage;
	}
	public void setAssetImage(byte[] assetImage) {
		this.assetImage = assetImage;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CompanyAssetModel [caid=");
		builder.append(caid);
		builder.append(", assetTag=");
		builder.append(assetTag);
		builder.append(", createdBy=");
		builder.append(createdBy);
		builder.append(", createdDate=");
		builder.append(createdDate);
		builder.append(", assetStatus=");
		builder.append(assetStatus);
		builder.append(", assetSerial=");
		builder.append(assetSerial);
		builder.append(", assetName=");
		builder.append(assetName);
		builder.append(", purchasedDate=");
		builder.append(purchasedDate);
		builder.append(", supplier=");
		builder.append(supplier);
		builder.append(", orderNo=");
		builder.append(orderNo);
		builder.append(", purchaseCost=");
		builder.append(purchaseCost);
		builder.append(", warranty=");
		builder.append(warranty);
		builder.append(", notes=");
		builder.append(notes);
		builder.append(", assetImage=");
		builder.append(assetImage);
		builder.append(", model=");
		builder.append(model);
		builder.append(", assetPic=");
		builder.append(assetPic);
		builder.append(",empid=");
		builder.append(empid);
		builder.append(",branchname=");
		builder.append(branchname);
		builder.append("]");
		return builder.toString();
	}


}
