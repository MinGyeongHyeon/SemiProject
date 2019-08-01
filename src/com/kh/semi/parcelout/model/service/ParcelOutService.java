package com.kh.semi.parcelout.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.parcelout.model.dao.ParcelOutDao;
import com.kh.semi.parcelout.model.vo.Application;
import com.kh.semi.parcelout.model.vo.ParcelOut;
import com.kh.semi.user.model.vo.User;

public class ParcelOutService {

	public int insertApplication(ArrayList<Application> list, User us, Application ap) {
		Connection con = getConnection();
		int resul = 0;
		int result = new ParcelOutDao().insertApplication(con, us ,ap);

		if(result > 0) {
			commit(con);
			resul = new ParcelOutDao().insertApplication2(con,list);
		}else {
			rollback(con);
		}

		return resul;
	}

	public ParcelOut parceloutInfo(int pcoAppNo) {

		Connection con = getConnection();
		
		ParcelOut pco = new ParcelOutDao().parceloutInfo(con,pcoAppNo);
		
		close(con);
		
		return pco;
	}

}
