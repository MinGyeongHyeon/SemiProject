package com.kh.semi.support.money.model.service;

import static com.kh.semi.common.JDBCTemplate.*;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.support.money.model.dao.MoneySupDao;
import com.kh.semi.support.money.model.vo.MoneySup;

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

	public ArrayList<MoneySup> selectList(int currentPage, int limit, int userNo) {
		Connection con = getConnection();

		ArrayList<MoneySup> list = new MoneySupDao().selectList(con, currentPage, limit, userNo);

		close(con);

		return list;
	}

	public ArrayList<MoneySup> selectListAll(int currentPage, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	public int okApplyMoney(int monSupNo) {
		Connection con = getConnection();

		int result = new MoneySupDao().okApplyMoney(con, monSupNo);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int okConfirmMoney(int monSupNo) {
		Connection con = getConnection();

		int result = new MoneySupDao().okConfirmMoney(con, monSupNo);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);

		return result;
	}

}
