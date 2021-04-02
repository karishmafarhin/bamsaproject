package com.bamsa.db.beans;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Employee {
	private int uid;
	private int hierarchyId;
	private int streamid;
	private int desigid;
	
	private String name;
	private String empId;
	private List<Employee> children = new ArrayList<Employee>();
	private String branchname;
	public String getBranchname() {
		return branchname;
	}
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}
	public int getStreamid() {
		return streamid;
	}
	public void setStreamid(int streamid) {
		this.streamid = streamid;
	}
	public int getDesigid() {
		return desigid;
	}
	public void setDesigid(int desigid) {
		this.desigid = desigid;
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getHierarchyId() {
		return hierarchyId;
	}
	public void setHierarchyId(int hierarchyId) {
		this.hierarchyId = hierarchyId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public List<Employee> getChildren() {
		return children;
	}
	public void setChildren(List<Employee> children) {
		this.children = children;
	} 
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Employee [uid=");
		builder.append(uid);
		builder.append(", hierarchyId=");
		builder.append(hierarchyId);
		builder.append(", name=");
		builder.append(name);
		builder.append(", empId=");
		builder.append(empId);
		builder.append(", children=");
		builder.append(children);
		builder.append(", streamid=");
		builder.append(streamid);
		builder.append(", desigid=");
		builder.append(desigid);
		builder.append(", branchname=");
		builder.append(branchname);
		builder.append("]");
		return builder.toString();
	}

}
