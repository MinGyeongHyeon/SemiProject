package com.kh.semi.adminboard.model.service;

import static com.kh.semi.common.JDBCTemplate.*;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.adminboard.model.dao.AdminBoardDao;
import com.kh.semi.adminboard.model.vo.AdminBoard;

public class AdminBoardService {

	public ArrayList<AdminBoard> selectList() {

		return null;
	}

	public int getListCount() {
		Connection con = getConnection();

		int listCount = new AdminBoardDao().getListCount(con);

		close(con);

		return listCount;
	}

	public ArrayList<AdminBoard> selectList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<AdminBoard> list = new AdminBoardDao().selectList(con, currentPage, limit);

		close(con);

		return list;
	}


	public int insertBoard(AdminBoard ab) {
		Connection con = getConnection();

		int result = new AdminBoardDao().insertBoard(con, ab);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public AdminBoard selectOne(int num) {
		Connection con = getConnection();

		AdminBoard n = new AdminBoardDao().selectOne(con, num);

		close(con);

		return n;
	}

}
