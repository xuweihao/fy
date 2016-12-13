package com.spm.model;

public class Material extends BaseBean{

	//类型
	private int type;
	
	//物料编码
	private String code;
	
	//物料名称
	private String name;
	
	//属性
	private String property;
	
	//网点价格
	private double jiage;
	
	//分公司
	private double fgsjiage;
	
	//成本价
	private double cbjiage;

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public double getJiage() {
		return jiage;
	}

	public void setJiage(double jiage) {
		this.jiage = jiage;
	}

	public double getFgsjiage() {
		return fgsjiage;
	}

	public void setFgsjiage(double fgsjiage) {
		this.fgsjiage = fgsjiage;
	}

	public double getCbjiage() {
		return cbjiage;
	}

	public void setCbjiage(double cbjiage) {
		this.cbjiage = cbjiage;
	}
	
	
}
