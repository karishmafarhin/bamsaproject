package com.bamsa.web.model;

import org.springframework.stereotype.Component;

@Component
public class AutoContactModel {
	private String label;
	private String value;
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AutoContactModel [label=");
		builder.append(label);
		builder.append(", value=");
		builder.append(value);
		builder.append("]");
		return builder.toString();
	}

}
