package com.kh.semi.adminboard.model.service;

import static com.kh.semi.common.JDBCTemplate.*;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.adminboard.model.dao.AdminBoardDao;
import com.kh.semi.adminboard.model.vo.AdminBoard;
import com.kh.semi.board.parcelout.model.vo.Attachment;

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

	public int insertSupportMoneyBoard(AdminBoard ab, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new AdminBoardDao().insertThumbnailSupportContent(con, ab);

		if(result1 > 0) {
			int bid = new AdminBoardDao().selectCurrval(con);

			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setAdBoardno(bid);
			}
		}

		int result2 = new AdminBoardDao().insertSupportAttachment(con, fileList);

		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}

		return result;
	}

	public AdminBoard selectSupportList(int currentPage) {
		Connection con = getConnection();

		AdminBoard ab = new AdminBoardDao().selectSupportList(con, currentPage);

		close(con);

		return ab;
	}

	public Attachment selectSupportAttachment(int currentPage) {
		Connection con = getConnection();

		Attachment ac = new AdminBoardDao().selectSupportAttachment(con, currentPage);

		close(con);

		return ac;
	}


}
