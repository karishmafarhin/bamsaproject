package com.bamsa.web.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class CalendarModal {
	private Date date;
	private String note;
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CalendarModal [date=");
		builder.append(date);
		builder.append(", note=");
		builder.append(note);
		builder.append("]");
		return builder.toString();
	}

}
