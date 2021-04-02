package com.bamsa.db.exceptions;

public class DBUpdateException extends Exception {
	private String errorCode="";
	
	private static final long serialVersionUID = -884968095965361138L;

	public DBUpdateException(){
		super();
	}
	
	public DBUpdateException(String message){
		super(message);
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
}
