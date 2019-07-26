package com.kh.semi.parcelout.model.vo;



public class ParcelOut {

	private int pcoAppNo;
	private int userNo;
	private String selAppDt;
	private String pcoSit;
	private Date ansDt;

	public ParcelOut() {}


	public ParcelOut(int pcoAppNo, int userNo, String selAppDt, String pcoSit) {

		super();
		this.pcoAppNo = pcoAppNo;
		this.userNo = userNo;
		this.selAppDt = selAppDt;
		this.pcoSit = pcoSit;
		this.ansDt = ansDt;
	}



	public Date getAnsDt() {
		return ansDt;
	}



	public void setAnsDt(Date ansDt) {
		this.ansDt = ansDt;
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

	public String getSelAppDt() {
		return selAppDt;
	}

	public void setSelAppDt(String selAppDt) {
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
