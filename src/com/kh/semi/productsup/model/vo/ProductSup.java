package com.kh.semi.productsup.model.vo;

import java.sql.Date;

public class ProductSup {

	private int supPdNo;
	private String ctgCd;
	private String pdNm;
	private Date supDt;
	private int userNo;

	public ProductSup() {}

	public ProductSup(int supPdNo, String ctgCd, String pdNm, Date supDt, int userNo) {
		super();
		this.supPdNo = supPdNo;
		this.ctgCd = ctgCd;
		this.pdNm = pdNm;
		this.supDt = supDt;
		this.userNo = userNo;
	}

	public int getSupPdNo() {
		return supPdNo;
	}

	public void setSupPdNo(int supPdNo) {
		this.supPdNo = supPdNo;
	}

	public String getCtgCd() {
		return ctgCd;
	}

	public void setCtgCd(String ctgCd) {
		this.ctgCd = ctgCd;
	}

	public String getPdNm() {
		return pdNm;
	}

	public void setPdNm(String pdNm) {
		this.pdNm = pdNm;
	}

	public Date getSupDt() {
		return supDt;
	}

	public void setSupDt(Date supDt) {
		this.supDt = supDt;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "ProductSup [supPdNo=" + supPdNo + ", ctgCd=" + ctgCd + ", pdNm=" + pdNm + ", supDt=" + supDt
				+ ", userNo=" + userNo + "]";
	}



}
