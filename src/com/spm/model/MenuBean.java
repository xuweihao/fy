package com.spm.model;

public class MenuBean extends BaseBean{

	private int vId;
	
	private int hId;
	
	//horizontal ºáÏò  vertical ×ÝÏò
	private String type;
	
	private String name;
	
	private String url;

	

	public int getvId() {
		return vId;
	}

	public void setvId(int vId) {
		this.vId = vId;
	}

	public int gethId() {
		return hId;
	}

	public void sethId(int hId) {
		this.hId = hId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
