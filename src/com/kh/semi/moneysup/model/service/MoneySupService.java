package com.kh.semi.moneysup.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.adminboard.model.dao.AdminBoardDao;
import com.kh.semi.adminboard.model.vo.AdminBoard;
import com.kh.semi.moneysup.model.dao.MoneySupDao;
import com.kh.semi.moneysup.model.vo.MoneySup;

public class MoneySupService {

	public int insertMoneySupApp(MoneySup ms) {
		Connection con = getConnection();

		int result = new MoneySupDao().insertMoneySupApp(con, ms);

		close(con);

		return result;
	}

	public int getListCount() {
		Connection con = getConnection();

		int listCount = new MoneySupDao().getListCount(con);

		close(con);

		return listCount;
	}

	public ArrayList<MoneySup> selectList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<MoneySup> list = new MoneySupDao().selectList(con, currentPage, limit);

		close(con);

		return list;
	}

}
