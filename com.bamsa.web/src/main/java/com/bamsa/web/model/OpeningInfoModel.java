package com.bamsa.web.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class OpeningInfoModel {
	private int rqid;
	private String positionid;
	private String positiontitle;
	private String state;
	private String city;
	private String primaryskill;
	private String secondaryskill;
	private String description;
	private float rate;
	private String primevendor;
	private String endclient;
	private int createdby;
	private Date createddate;
	private int billtype;
	private String empId;
	private String contactperson;
	public String getContactperson() {
		return contactperson;
	}
	public void setContactperson(String contactperson) {
		this.contactperson = contactperson;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public int getBilltype() {
		return billtype;
	}
	public void setBilltype(int billtype) {
		this.billtype = billtype;
	}
	public int getRqid() {
		return rqid;
	}
	public void setRqid(int rqid) {
		this.rqid = rqid;
	}
	public String getPositionid() {
		return positionid;
	}
	public void setPositionid(String positionid) {
		this.positionid = positionid;
	}
	public String getPositiontitle() {
		return positiontitle;
	}
	public void setPositiontitle(String positiontitle) {
		this.positiontitle = positiontitle;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPrimaryskill() {
		return primaryskill;
	}
	public void setPrimaryskill(String primaryskill) {
	this.primaryskill = primaryskill;
	}
	public String getSecondaryskill() {
		return secondaryskill;
	}
	public void setSecondaryskill(String secondaryskill) {
		this.secondaryskill = secondaryskill;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public String getPrimevendor() {
		return primevendor;
	}
	public void setPrimevendor(String primevendor) {
		this.primevendor = primevendor;
	}
	public String getEndclient() {
		return endclient;
	}
	public void setEndclient(String endclient) {
		this.endclient = endclient;
	}
	public int getCreatedby() {
		return createdby;
	}
	public void setCreatedby(int createdby) {
		this.createdby = createdby;
	}
	public Date getCreateddate() {
		return createddate;
	}
	public void setCreateddate(Date createddate) {
		this.createddate = createddate;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OpeningInfoBean [rqid=");
		builder.append(rqid);
		builder.append(", positionid=");
		builder.append(positionid);
		builder.append(", positiontitle=");
		builder.append(positiontitle);
		builder.append(", state=");
		builder.append(state);
		builder.append(", city=");
		builder.append(city);
		builder.append(", primaryskill=");
		builder.append(primaryskill);
		builder.append(", secondaryskill=");
		builder.append(secondaryskill);
		builder.append(", description=");
		builder.append(description);
		builder.append(", rate=");
		builder.append(rate);
		builder.append(", primevendor=");
		builder.append(primevendor);
		builder.append(", endclient=");
		builder.append(endclient);
		builder.append(", createdby=");
		builder.append(createdby);
		builder.append(", createddate=");
		builder.append(createddate);
		builder.append(", billtype=");
		builder.append(billtype);
		builder.append(", empId=");
		builder.append(empId);
		builder.append(",contactPerson=");
		builder.append(contactperson);
		builder.append("]");
		return builder.toString();
	}
}
