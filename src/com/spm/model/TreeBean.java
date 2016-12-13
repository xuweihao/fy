package com.spm.model;

import java.util.ArrayList;
import java.util.List;

public class TreeBean {

	private int id;
	
	private String text;
	
	private String state;
	
	private List<TreeBean> children = new ArrayList<TreeBean>();
	
	private String url;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}


	public List<TreeBean> getChildren() {
		return children;
	}

	public void setChildren(List<TreeBean> children) {
		this.children = children;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
