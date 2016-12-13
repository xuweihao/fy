package com.spm.model;

public class Student extends BaseBean{

	private String name;
	
	private String parentName;
	//Äê¼¶
	private String state;
	
	//°à¼¶
	private String className;
	
	private Integer year1;
	
	private Integer year2;
	
	private Integer xueqi;
	
	private Integer sfsf;
	
	private ShoufeiBean sf;
	
	
	
	public Integer getSfsf() {
		return sfsf;
	}

	public void setSfsf(Integer sfsf) {
		this.sfsf = sfsf;
	}

	public ShoufeiBean getSf() {
		return sf;
	}

	public void setSf(ShoufeiBean sf) {
		this.sf = sf;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Integer getYear1() {
		return year1;
	}

	public void setYear1(Integer year1) {
		this.year1 = year1;
	}

	public Integer getYear2() {
		return year2;
	}

	public void setYear2(Integer year2) {
		this.year2 = year2;
	}

	public Integer getXueqi() {
		return xueqi;
	}

	public void setXueqi(Integer xueqi) {
		this.xueqi = xueqi;
	}
	
	
	
	
}
