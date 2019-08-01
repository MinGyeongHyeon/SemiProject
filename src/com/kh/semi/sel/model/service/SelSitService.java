package com.kh.semi.sel.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.sel.model.dao.SelSitDao;
import com.kh.semi.sel.model.vo.SelSit;

public class SelSitService {

	public ArrayList<String> selectSelDayforDate(String result) {
		Connection con = getConnection();

		ArrayList<String> list = new SelSitDao().selectSelDayforDate(con, result);

		close(con);

		return list;
	}

	public ArrayList<String> selectSelDayforDatePco(String result) {
		Connection con = getConnection();

		ArrayList<String> list = new SelSitDao().selectSelDayforDatePco(con, result);

		close(con);

		return list;
	}

	public HashMap<String, Object> selectAllSelDate(String result) {
		Connection con = getConnection();
		HashMap<String, Object> list = new HashMap<String, Object>();

		ArrayList<SelSit> list1 = new SelSitDao().selectAllSelEntranceDate(con, result);
		ArrayList<SelSit> list2 = new SelSitDao().selectAllSelParceloutDate(con, result);

		list.put("entrance", list1);
		list.put("parcelout", list2);

		close(con);

		return list;
	}

	public HashMap<String, Object> selectTodaySelHistory() {
		Connection con = getConnection();
		HashMap<String, Object> list = new HashMap<String, Object>();

		ArrayList<SelSit> list1 = new SelSitDao().selectTodaySelEntranceHistory(con);
		ArrayList<SelSit> list2 = new SelSitDao().selectTodaySelParcelHistory(con);

		list.put("entrance", list1);
		list.put("parcelout", list2);

		close(con);

		return list;
	}

	public int updateSelsitParcel(int selNo, String result) {
		Connection con = getConnection();
		int num = 0;

		if(result.equals("완료")) {
			int num1 = new SelSitDao().updateSelSitPco(con, selNo);
			if(num1 > 0) {
				commit(con);
				int num2 = new SelSitDao().selectPcoNo(con, selNo);
				int num3 = new SelSitDao().updateAppSitPco(con, num2);
				if(num3 > 0) {
					commit(con);
					num++;
				}else {
					rollback(con);
				}
			}else {
				rollback(con);
			}
		}else {
			int num1 = new SelSitDao().updateSelSitPco2(con, selNo);
			if(num1 > 0) {
				commit(con);
				num++;
			}else {
				rollback(con);
			}
		}

		return num;
	}

}
