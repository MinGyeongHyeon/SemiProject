package com.kh.semi.parcelout.model.vo;

import java.sql.Date;

public class ParcelOut {

	private int pcoAppNo;
	private int userNo;
	private Date selAppDt;
	private String pcoSit;

	public ParcelOut() {}

	public ParcelOut(int pcoAppNo, int userNo, Date selAppDt, String pcoSit) {
		super();
		this.pcoAppNo = pcoAppNo;
		this.userNo = userNo;
		this.selAppDt = selAppDt;
		this.pcoSit = pcoSit;
	}

	public int getPcoAppNo() {
		return pcoAppNo;
	}

	public void setPcoAppNo(int pcoAppNo) {
		this.pcoAppNo = pcoAppNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getSelAppDt() {
		return selAppDt;
	}

	public void setSelAppDt(Date selAppDt) {
		this.selAppDt = selAppDt;
	}

	public String getPcoSit() {
		return pcoSit;
	}

	public void setPcoSit(String pcoSit) {
		this.pcoSit = pcoSit;
	}

	@Override
	public String toString() {
		return "ParcelOut [pcoAppNo=" + pcoAppNo + ", userNo=" + userNo + ", selAppDt=" + selAppDt + ", pcoSit="
				+ pcoSit + "]";
	}



}
