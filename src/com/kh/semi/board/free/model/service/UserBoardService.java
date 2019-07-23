package com.kh.semi.board.free.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.board.free.model.dao.UserBoardDao;
import com.kh.semi.board.free.model.vo.UserBoard;
import static com.kh.semi.common.JDBCTemplate.*;
public class UserBoardService {

	public ArrayList<UserBoard> selectList() {
		Connection con = getConnection();

		ArrayList<UserBoard> list = new UserBoardDao().selectList(con);

		close(con);

		return list;
	}
	

	public ArrayList<UserBoard> selectList(String userId) {
		Connection con = getConnection();

		ArrayList<UserBoard> list = new UserBoardDao().selectList(con);

		close(con);

		return list;
	}
	
	//게시물 작성용 메소드
	public int insertBoard(UserBoard ub) {
		Connection con = getConnection();

		int result = new UserBoardDao().insertBoard(con, ub);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);

		return result;
	}
	public UserBoard selectOne(int num) {
		Connection con = getConnection();
		
		UserBoard ub = new UserBoardDao().selectOne(con, num);
		
		if(ub != null) {
			int result = new UserBoardDao().updateCount(con, num);
			
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		
		close(con);
				
		return ub;
	}

	public ArrayList<UserBoard> selectListBest() {
		Connection con = getConnection();

		ArrayList<UserBoard> best = new UserBoardDao().selectListBest(con);

		close(con);

		return best;
	}
	public ArrayList<UserBoard> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<UserBoard> list = new UserBoardDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new UserBoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}


	public ArrayList<UserBoard> myselectList(int currentPage, int limit, int userNo) {
		Connection con = getConnection();
		
		ArrayList<UserBoard> list = new UserBoardDao().myselectList(con, currentPage, limit, userNo);
		
		close(con);
		
		return list;
	}


	public int getmyListCount(int userNo) {
		Connection con = getConnection();
		
		int listCount = new UserBoardDao().getmyListCount(con, userNo);
		
		close(con);
		
		return listCount;
	}
	
	
	




}
