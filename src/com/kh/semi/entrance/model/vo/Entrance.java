package com.kh.semi.entrance.model.vo;

import java.sql.Date;

public class Entrance {

	private int entAppNo;
	private int userNo;
	private Date writeDt;
	private Date selHopeDt;

	public Entrance() {}

	public Entrance(int entAppNo, int userNo, Date writeDt, Date selHopeDt) {
		super();
		this.entAppNo = entAppNo;
		this.userNo = userNo;
		this.writeDt = writeDt;
		this.selHopeDt = selHopeDt;
	}

	public int getEntAppNo() {
		return entAppNo;
	}

	public void setEntAppNo(int entAppNo) {
		this.entAppNo = entAppNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getWriteDt() {
		return writeDt;
	}

	public void setWriteDt(Date writeDt) {
		this.writeDt = writeDt;
	}

	public Date getSelHopeDt() {
		return selHopeDt;
	}

	public void setSelHopeDt(Date selHopeDt) {
		this.selHopeDt = selHopeDt;
	}

	@Override
	public String toString() {
		return "Entrance [entAppNo=" + entAppNo + ", userNo=" + userNo + ", writeDt=" + writeDt + ", selHopeDt="
				+ selHopeDt + "]";
	}



}
