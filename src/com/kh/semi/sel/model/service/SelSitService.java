package com.kh.semi.sel.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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

}
