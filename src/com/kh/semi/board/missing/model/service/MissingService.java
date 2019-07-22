package com.kh.semi.board.missing.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.board.missing.model.dao.MissingDao;
import com.kh.semi.board.missing.model.vo.Missing;
import com.kh.semi.board.missing.model.vo.MissingAttachment;
public class MissingService {
	

	
	//페이징 처리 후 게시물 목록 조회용 메소드
	public ArrayList<Missing> selectList(int currentPage, int limit) {
		Connection con= getConnection();
		ArrayList<Missing> list= new MissingDao().selectList(con,currentPage,limit);
		
		close(con);
		
		
		
		return list;
	}
	
	
	public int MissingInsert(Missing b, ArrayList<MissingAttachment> fileList) {
Connection con = getConnection();
		
		int result = 0;
		
		int result1 = new MissingDao().insertMissingContent(con, b);
		int result3 = new MissingDao().insertMissingContent2(con, b);
		
		if(result1 > 0) {
			int bid = new MissingDao().missingselectCurrval(con);
			
			for(int i = 0; i < fileList.size(); i++) {
			//	fileList.get(i).setBid(bid);
			}
		}
		
		int result2 = new MissingDao().insertAttachment(con, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		return result;
	}
	public ArrayList<HashMap<String, Object>> missingselectThumbnailList() {
Connection con = getConnection();
		System.out.println("서비스");
		ArrayList<HashMap<String, Object>> list =
				new MissingDao().missingselectThumbnailList(con);
		System.out.println("서비스2");
		close(con);
		
		return list;
	}
	public HashMap<String, Object> missingselectThumbnailMap(int num) {
		System.out.println("어딩ㅇㅇㅇㅇ");
Connection con = getConnection();
		
		HashMap<String, Object> hmap = null;
		
		int result = new MissingDao().missingupdateCount(con,num);
		System.out.println("result"+result);
		if(result > 0) {
			commit(con);
			hmap = new MissingDao().missingselectThumbnailMap(con, num);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return hmap;
	
	}
	public Missing missingselectup(int num) {
		Connection con = getConnection();

		Missing ub = new MissingDao().missingselectup(con, num);

		close(con);

	return ub;
	}
	public int updateMissing(Missing b) {
		Connection con = getConnection();

		int result = new MissingDao().missingupdateOutcon(con,b);
		int result2 = new MissingDao().missingupdateOutcon2(con,b);

		if(result > 0) {
			commit(con);
		}else{
			rollback(con);
		}

		close(con);

	return result;
	}
	public int deletemissing(int num) {
		Connection con = getConnection();

		int result = new MissingDao().deletemissing(con,num);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);



	return result;
	}



	public int getListoutCount() {

		Connection con = getConnection();

		int listCount = new MissingDao().missinggetoutListCount(con);

		close(con);

		return listCount;
	}

	
	public ArrayList<HashMap<String, Object>> selectOutList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<HashMap<String,Object>> list = new MissingDao().missingselectOutList(con,currentPage,limit);


		close(con);

		return list;
	}


	public int MissinggetListCount() {
		Connection con = getConnection();

		int listCount = new MissingDao().MissinggetListCount(con);

		close(con);

		return listCount;
	}


	public ArrayList<HashMap<String, Object>> MissngselectList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<HashMap<String,Object>> list = new MissingDao().MissingselectOutList(con,currentPage,limit);


		close(con);

		return list;
	}


	public int ProInsert(Missing b, ArrayList<MissingAttachment> fileList) {
Connection con = getConnection();
		
		int result = 0;
		
		int result1 = new MissingDao().insertMissingContent(con, b);
		System.out.println(b.getBoardDiv());
		int result3 = new MissingDao().insertProContent2(con, b);
		
		if(result1 > 0) {
			int bid = new MissingDao().missingselectCurrval(con);
			
			for(int i = 0; i < fileList.size(); i++) {
			//	fileList.get(i).setBid(bid);
			}
		}
		
		int result2 = new MissingDao().insertAttachment2(con, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		return result;
	}


	public int ProgetListCount() {
		Connection con = getConnection();

		int listCount = new MissingDao().ProgetListCount(con);

		close(con);

		return listCount;
	}


	public ArrayList<HashMap<String, Object>> ProselectList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<HashMap<String,Object>> list = new MissingDao().ProselectList(con,currentPage,limit);


		close(con);

		return list;
	}


	public int updatePro(Missing b) {
		Connection con = getConnection();

		int result = new MissingDao().missingupdateOutcon(con,b);
		int result2 = new MissingDao().proupdateOutcon2(con,b);

		if(result > 0) {
			commit(con);
		}else{
			rollback(con);
		}

		close(con);

	return result;
	}


	public HashMap<String, Object> missingselectThumbnailMap2(int num) {
		System.out.println("어딩ㅇㅇㅇㅇ");
Connection con = getConnection();
		
		HashMap<String, Object> hmap = null;
		
		int result = new MissingDao().missingupdateCount(con,num);
		System.out.println("result"+result);
		if(result > 0) {
			commit(con);
			hmap = new MissingDao().missingselectThumbnailMap2(con, num);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return hmap;
	}


	public Missing missingselectup2(int num) {
		Connection con = getConnection();

		Missing ub = new MissingDao().missingselectup2(con, num);

		close(con);

	return ub;
	}



	

}