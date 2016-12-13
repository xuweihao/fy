package com.spm.model;

import java.util.ArrayList;
import java.util.List;

public class DataBean extends BaseBean{

	private String dataName;
	
	private String dataCode;
	
	private Integer pId;
	
	private List<DataBean> data = new ArrayList<DataBean>();

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getDataCode() {
		return dataCode;
	}

	public void setDataCode(String dataCode) {
		this.dataCode = dataCode;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public List<DataBean> getData() {
		return data;
	}

	public void setData(List<DataBean> data) {
		this.data = data;
	}
	
	
}
