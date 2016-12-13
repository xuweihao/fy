package com.spm.model;

public class UserBean extends BaseBean{

	private String name;
	
	private String userCode;
	
	private String pwd;
	
	private Integer sex;
	
	private String sexName;
	
	private String address;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getSexName() {
		return sexName;
	}

	public void setSexName(String sexName) {
		this.sexName = sexName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	
}
