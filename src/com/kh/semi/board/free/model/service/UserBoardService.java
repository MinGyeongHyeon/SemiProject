package com.kh.semi.board.free.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.board.free.model.dao.UserBoardDao;
import com.kh.semi.board.free.model.vo.Recub;
import com.kh.semi.board.free.model.vo.UserBoard;
import com.kh.semi.board.free.model.vo.UserBoardAttachment;

import static com.kh.semi.common.JDBCTemplate.*;
public class UserBoardService {
	public ArrayList<UserBoard> selectListBest() {
		Connection con = getConnection();

		ArrayList<UserBoard> best = new UserBoardDao().selectListBest(con);

		close(con);

		return best;
	}

	public int getListCount(String category, String what, String search, String alignment) {
		Connection con = getConnection();
		int listCount = 0;
		
		if(search.equals("")) {
			listCount = new UserBoardDao().getListCount(con, category, alignment);
		}else{
			listCount = new UserBoardDao().getListCount(con, category, what, search, alignment);
		}
		
		
		close(con);
		System.out.println("서비스에서 가져온 listCount : " + listCount);
		return listCount;
		
	}

	public ArrayList<UserBoard> selectList(int currentPage, int limit, String category, String what, String search,
			String alignment) {
		Connection con = getConnection();
		ArrayList<UserBoard> list = null;
		System.out.println("서비스에서 alignment : " + alignment);
		System.out.println("서비스에서 category : " + category);
		System.out.println("서비스에서 search : " + search);
		if(search.equals("")) {
			if(category.equals("all")) {
				list = new UserBoardDao().allselectList(con, currentPage, limit, alignment);
			}else {
				list = new UserBoardDao().cateselectList(con, currentPage, limit, category, alignment);
			}
		}else {
			if(category.equals("all")) {
				list = new UserBoardDao().allsearchselectList(con, currentPage, limit, what, search, alignment);
			}else {
				list = new UserBoardDao().catesearchselectList(con, currentPage, limit, what, search, category, alignment);
			}
			
		}
		System.out.println("서비스 리스트 : " + list);

		close(con);

		return list;
	
	}
	
	public UserBoard selectOneub(int num) {
		Connection con = getConnection();
		
		UserBoard ub = new UserBoardDao().selectOneub(con, num);
		
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

	
	

	public ArrayList<UserBoard> selectList(String userId) {
		Connection con = getConnection();

		ArrayList<UserBoard> list = new UserBoardDao().selectList(con);

		close(con);

		return list;
	}
	
	//게시물 작성용 메소드
	public int insertBoard(UserBoard ub, ArrayList<UserBoardAttachment> fileList) {
		Connection con = getConnection();

		int result = 0;
		
		int result1 = new UserBoardDao().insertBoard(con, ub);
		
		if(result1 > 0) {
			int bid = new UserBoardDao().selectCurrval(con);
			
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setBoardNo(bid);
			}
		}
		
		int result2 = new UserBoardDao().insertAttachment(con, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		return result;
	}
	

	
	public ArrayList<UserBoard> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<UserBoard> list = new UserBoardDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	public ArrayList<UserBoard> selectList(int currentPage, int limit, String category) {
		Connection con = getConnection();
		
		ArrayList<UserBoard> list = new UserBoardDao().selectList(con,currentPage, limit, category);
		
		close(con);
		
		return list;
	}
	
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new UserBoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}
	
	public int getListCount(String category) {
		Connection con = getConnection();
		
		int listCount = new UserBoardDao().getListCount(con, category);
		
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


	public HashMap<String, Object> selectOne(int num) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = null;
		
		int result = new UserBoardDao().updateCount(con, num);
		
		if(result > 0) {
			commit(con);
			
			hmap = new UserBoardDao().selectOne(con, num);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return hmap;
	}


	public int deleteUserBoard(int nno) {
		Connection con = getConnection();
		
		int result = new UserBoardDao().deleteUserBoard(con, nno);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
	
	
	close(con);
			
	return result;
	}


	public int updateUserBoard(UserBoard ub, int bNo) {
		Connection con = getConnection();

		int result = new UserBoardDao().updateUserBoard(con, ub, bNo);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);

		return result;
		
	}


	public int getsearchListCount(String what, String search) {
		Connection con = getConnection();
		
		int listCount = new UserBoardDao().getsearchListCount(con, what, search);
		
		
		close(con);
		
		return listCount;
	}


	public ArrayList<UserBoard> searchList(int currentPage, int limit, String search, String what) {
		Connection con = getConnection();
		
		ArrayList<UserBoard> list = new UserBoardDao().selectList(con, currentPage, limit, search, what);
		
		
		close(con);
		
		return list;
	}


	public int getListCountad() {
		Connection con = getConnection();
		
		int listCount = new UserBoardDao().getListCountad(con);
		
		close(con);
		
		return listCount;
	}


	public ArrayList<UserBoard> selectListad(int currentPage, int limit) {
Connection con = getConnection();
		
		ArrayList<UserBoard> list = new UserBoardDao().selectListad(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	
	public int uprecommendUserBoard(int thisBoardNo, int nowLoginUser) {
		Connection con = getConnection();
		int result = 0;

		result = new UserBoardDao().uprecommendUserBoard(con, thisBoardNo, nowLoginUser);
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);

		return result;
	}
	
	public int derecommendUserBoard(int thisBoardNo, int nowLoginUser) {
		Connection con = getConnection();
		int result = 0;

		result = new UserBoardDao().derecommendUserBoard(con,thisBoardNo,nowLoginUser);

		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);

		return result;
	}

	public Recub selectRec(int num, int logUno) {
		Connection con = getConnection();
		
		Recub rec = new UserBoardDao().selectRec(con, num, logUno);
		
		commit(con);

		return rec;
	}

	public int selectRecCount(int num) {
		Connection con = getConnection();
		
		int rec = new UserBoardDao().selectRecCount(con, num);
		
		commit(con);

		return rec;
	}

	public int selectRecCountmain(int thisBoardNo) {
		Connection con = getConnection();
		
		int rec = new UserBoardDao().selectRecCountmain(con, thisBoardNo);
		
		if(rec > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);

		return rec;
		
	}




}
