package com.bamsa.web.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class AssetTicketModel {


	private int atid;
	 private String assettype;
	 private String tag;
	 private int requestto;
	 private String purpose;
	 private String remarks;
	 private Date fromdate;
	 private Date todate;
	 private int risedby;
	 private Date riseddate;
	 private String thstatus;
	 private int approvedby;
	 private Date approveddate;
	 private String bstatus;
	 private String rstatus;
 private String empid;
	 
	 public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	 
	 public int getAtid() {
		return atid;
	}
	public void setAtid(int atid) {
		this.atid = atid;
	}
	public String getAssettype() {
		return assettype;
	}
	public void setAssettype(String assettype) {
		this.assettype = assettype;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getRequestto() {
		return requestto;
	}
	public void setRequestto(int requestto) {
		this.requestto = requestto;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Date getFromdate() {
		return fromdate;
	}
	public void setFromdate(Date fromdate) {
		this.fromdate = fromdate;
	}
	public Date getTodate() {
		return todate;
	}
	public void setTodate(Date todate) {
		this.todate = todate;
	}
	public int getRisedby() {
		return risedby;
	}
	public void setRisedby(int risedby) {
		this.risedby = risedby;
	}
	public Date getRiseddate() {
		return riseddate;
	}
	public void setRiseddate(Date riseddate) {
		this.riseddate = riseddate;
	}
	public String getThstatus() {
		return thstatus;
	}
	public void setThstatus(String thstatus) {
		this.thstatus = thstatus;
	}
	public int getApprovedby() {
		return approvedby;
	}
	public void setApprovedby(int approvedby) {
		this.approvedby = approvedby;
	}
	public Date getApproveddate() {
		return approveddate;
	}
	public void setApproveddate(Date approveddate) {
		this.approveddate = approveddate;
	}
	public String getBstatus() {
		return bstatus;
	}
	public void setBstatus(String bstatus) {
		this.bstatus = bstatus;
	}
	public String getRstatus() {
		return rstatus;
	}
	public void setRstatus(String rstatus) {
		this.rstatus = rstatus;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AssetTicketModel [atid=");
		builder.append(atid);
		builder.append(", assettype=");
		builder.append(assettype);
		builder.append(", tag=");
		builder.append(tag);
		builder.append(", requestto=");
		builder.append(requestto);
		builder.append(", purpose=");
		builder.append(purpose);
		builder.append(", remarks=");
		builder.append(remarks);
		builder.append(", fromdate=");
		builder.append(fromdate);
		builder.append(", todate=");
		builder.append(todate);
		builder.append(", risedby=");
		builder.append(risedby);
		builder.append(", riseddate=");
		builder.append(riseddate);
		builder.append(", thstatus=");
		builder.append(thstatus);
		builder.append(", approvedby=");
		builder.append(approvedby);
		builder.append(", approveddate=");
		builder.append(approveddate);
		builder.append(", bstatus=");
		builder.append(bstatus);
		builder.append(", rstatus=");
		builder.append(rstatus);
		builder.append(",empid=");
		builder.append(empid);
		builder.append("]");
		return builder.toString();
	}

   

}
