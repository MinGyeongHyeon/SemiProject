package com.kh.semi.sel.model.vo;

import java.sql.Date;

public class SelSit {

	private String selNo;
	private String selSit;
	private String appDiv;
	private int entAppNo;
	private int pcoAppNo;
	private Date selDt;

	public SelSit() {}

	public SelSit(String selNo, String selSit, String appDiv, int entAppNo, int pcoAppNo, Date selDt) {
		super();
		this.selNo = selNo;
		this.selSit = selSit;
		this.appDiv = appDiv;
		this.entAppNo = entAppNo;
		this.pcoAppNo = pcoAppNo;
		this.selDt = selDt;
	}

	public String getSelNo() {
		return selNo;
	}

	public void setSelNo(String selNo) {
		this.selNo = selNo;
	}

	public String getSelSit() {
		return selSit;
	}

	public void setSelSit(String selSit) {
		this.selSit = selSit;
	}

	public String getAppDiv() {
		return appDiv;
	}

	public void setAppDiv(String appDiv) {
		this.appDiv = appDiv;
	}

	public int getEntAppNo() {
		return entAppNo;
	}

	public void setEntAppNo(int entAppNo) {
		this.entAppNo = entAppNo;
	}

	public int getPcoAppNo() {
		return pcoAppNo;
	}

	public void setPcoAppNo(int pcoAppNo) {
		this.pcoAppNo = pcoAppNo;
	}

	public Date getSelDt() {
		return selDt;
	}

	public void setSelDt(Date selDt) {
		this.selDt = selDt;
	}

	@Override
	public String toString() {
		return "SelSit [selNo=" + selNo + ", selSit=" + selSit + ", appDiv=" + appDiv + ", entAppNo=" + entAppNo
				+ ", pcoAppNo=" + pcoAppNo + ", selDt=" + selDt + "]";
	}



}
