package com.kh.semi.parcelout.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.semi.parcelout.model.dao.ParcelOutDao;
import com.kh.semi.parcelout.model.vo.Application;
import com.kh.semi.user.model.vo.User;

public class ParcelOutService {

	public int insertApplication(Application ap, User us) {
		Connection con = getConnection();
		int resul = 0;
		int result = new ParcelOutDao().insertApplication(con, us);

		if(result > 0) {
			commit(con);
			resul = new ParcelOutDao().insertApplication2(con,ap);
		}else {
			rollback(con);
		}



		return resul;
	}

}
