package com.bamsa.db.beans;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class ClockTimeBean {
	private int ctid;
	private int uid;
	private String clockInipAddress;
	private String clockOutipAddress;
	private Date clockInDay;
	private Date clockOutDay;
	private String empid;
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getCtid() {
		return ctid;
	}
	public void setCtid(int ctid) {
		this.ctid = ctid;
	}
	public String getClockInipAddress() {
		return clockInipAddress;
	}
	public void setClockInipAddress(String clockInipAddress) {
		this.clockInipAddress = clockInipAddress;
	}
	public String getClockOutipAddress() {
		return clockOutipAddress;
	}
	public void setClockOutipAddress(String clockOutipAddress) {
		this.clockOutipAddress = clockOutipAddress;
	}
	public Date getClockInDay() {
		return clockInDay;
	}
	public void setClockInDay(Date clockInDay) {
		this.clockInDay = clockInDay;
	}
	
	public Date getClockOutDay() {
		return clockOutDay;
	}
	public void setClockOutDay(Date clockOutDay) {
		this.clockOutDay = clockOutDay;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ClockTimeBean [uid=");
		builder.append(uid);
		builder.append(",ctid");
		builder.append(ctid);		
		builder.append(", ClockInipAddress=");
		builder.append(clockInipAddress);
		builder.append(", ClockOutipAddress=");
		builder.append(clockOutipAddress);
		builder.append(", ClockInDay=");
		builder.append(clockInDay);
		builder.append(", ClockOutDay=");
		builder.append(clockOutDay);
		builder.append(", empid=");
		builder.append(empid);
		builder.append("]");
		return builder.toString();
	}
	

}
