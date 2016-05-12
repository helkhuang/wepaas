package com.eit.wepaas.utils;

public class Msg {
	
	public Msg(boolean success,String text){
		this.success = success;
		this.text = text;
	}

	private boolean success;
	
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	private String text;
}
