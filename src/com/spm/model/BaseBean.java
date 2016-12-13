package com.spm.model;

public class BaseBean {

	private Integer id;
	
	private String createDate;
	
	private String createUser;
	
	private String updateDate;
	
	private String updateUser;
	
	private String deleteFlag;
	
	private String enableFlag;

	private int userId;
	
	private int rows;
	
	private int page;
	
	private int count;
	
	private int num1;
	
	private int num2;

	

	public String getEnableFlag() {
		return enableFlag;
	}

	public void setEnableFlag(String enableFlag) {
		this.enableFlag = enableFlag;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}


	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getNum1() {
		return (page-1)*rows;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public int getNum2() {
		return page*rows;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	
	
	
}
