package com.bamsa.db.beans;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class EmployeeTask {
	
	private int tid;
	private int uid;
	private String empid;
	private String taskdescription;
	private int givenby;
	private Date deadline;
	private Date givendate;
	private String givenbyname;
	private char tasktype;
	private int npid;
	private String projectname;
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	private String status;
	private String reason;
	
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public char getTasktype() {
		return tasktype;
	}
	public void setTasktype(char tasktype) {
		this.tasktype = tasktype;
	}
	
	public int getNpid() {
		return npid;
	}
	public void setNpid(int npid) {
		this.npid = npid;
	}
	public String getGivenbyname() {
		return givenbyname;
	}
	public void setGivenbyname(String givenbyname) {
		this.givenbyname = givenbyname;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public String getTaskdescription() {
		return taskdescription;
	}
	public void setTaskdescription(String taskdescription) {
		this.taskdescription = taskdescription;
	}
	public int getGivenby() {
		return givenby;
	}
	public void setGivenby(int givenby) {
		this.givenby = givenby;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public Date getGivendate() {
		return givendate;
	}
	public void setGivendate(Date givendate) {
		this.givendate = givendate;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("EmployeeTasks [tid=");
		builder.append(tid);
		builder.append(",uid=");
		builder.append(uid);
		builder.append(", empid=");
		builder.append(empid);
		builder.append(", taskdescription=");
		builder.append(taskdescription);
		builder.append(", givenby=");
		builder.append(givenby);
		builder.append(", deadline=");
		builder.append(deadline);
		builder.append(", givendate=");
		builder.append(givendate);
		builder.append(", givenbyname=");
		builder.append(givenbyname);
		builder.append(", tasktype=");
		builder.append(tasktype);
		builder.append(", npid=");
		builder.append(npid);
		builder.append(", status=");
		builder.append(status);
		builder.append(", reason=");
		builder.append(reason);
		builder.append(", projectname=");
		builder.append(projectname);
		builder.append("]");
		return builder.toString();
	}
}
