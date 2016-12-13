package com.spm.model;

public class ShoufeiBean extends BaseBean{

	private Integer stuId;
	
	private String name;
	
	private String no;
	//°à¼¶
	private String state;
	
	//°à¼¶
	private String className;
	
	private Integer year1;
	
	private Integer year2;
	
	private Integer xueqi;
	
	private String kaipiaoren;
	
	private String shoukuanren;
	
	private String type1;
	
	private double price1;
	
	private String type2;
	
	private double price2;
	
	private double total;
	
	private String mobile;
	
	private String remark;

	
	
	
	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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

	public String getKaipiaoren() {
		return kaipiaoren;
	}

	public void setKaipiaoren(String kaipiaoren) {
		this.kaipiaoren = kaipiaoren;
	}

	public String getShoukuanren() {
		return shoukuanren;
	}

	public void setShoukuanren(String shoukuanren) {
		this.shoukuanren = shoukuanren;
	}

	public String getType1() {
		return type1;
	}

	public void setType1(String type1) {
		this.type1 = type1;
	}

	public double getPrice1() {
		return price1;
	}

	public void setPrice1(double price1) {
		this.price1 = price1;
	}

	public String getType2() {
		return type2;
	}

	public void setType2(String type2) {
		this.type2 = type2;
	}

	public double getPrice2() {
		return price2;
	}

	public void setPrice2(double price2) {
		this.price2 = price2;
	}

	public double getTotal() {
		return price1+price2;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
