package com.bamsa.db.beans;
import org.springframework.stereotype.Component;
@Component
public class EmployeeMappings {
	private int uid;
	private int desigId;
	private int hierarchyId;
	private int streamId;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getDesigId() {
		return desigId;
	}
	public void setDesigId(int desigId) {
		this.desigId = desigId;
	}
	public int getHierarchyId() {
		return hierarchyId;
	}
	public void setHierarchyId(int hierarchyId) {
		this.hierarchyId = hierarchyId;
	}
	public int getStreamId() {
		return streamId;
	}
	public void setStreamId(int streamId) {
		this.streamId = streamId;
	}
	
}
