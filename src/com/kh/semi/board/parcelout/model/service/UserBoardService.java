package com.kh.semi.board.parcelout.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.board.parcelout.model.dao.UserBoardDao;
import com.kh.semi.board.parcelout.model.vo.Attachment;
import com.kh.semi.board.parcelout.model.vo.UserBoard;


public class UserBoardService {



	public int getListoutCount() {

		Connection con = getConnection();

		int listCount = new UserBoardDao().getoutListCount(con);

		close(con);

		return listCount;
	}
	public int insertOutuploadFiles(UserBoard b, ArrayList<Attachment> fileList) {
		Connection con = getConnection();

		int result = 0;

		int result1 = new UserBoardDao().insertOutuploadFiles(con, b);

		if(result1 > 0) {
			int bid = new UserBoardDao().selectCurrval(con);

			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setAttachmentNo(bid);
			}
			if(bid > 0) {
				System.out.println("이게 맞냐 진짜 확인 : " + bid);
				commit(con);
			}
		}

		int result2 = new UserBoardDao().insertAttachment(con , fileList);

		if(result1 > 0 && result2 >0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);

		return result;


	}
	public ArrayList<HashMap<String, Object>> selectOutList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<HashMap<String,Object>> list = new UserBoardDao().selectOutList(con,currentPage,limit);


		close(con);

		return list;
	}
	public HashMap<String, Object> selectParceloutOne(int num) {
			Connection con = getConnection();

			HashMap<String , Object> hmap = null;

			int result = new UserBoardDao().updateCount(con , num);
			System.out.println(result);

			if(result > 0) {
				commit(con);
				hmap = new UserBoardDao().selectParceloutOne(con, num);

			}else {
				rollback(con);
			}

			close(con);


		return hmap;



	}
	public int updateRec(int num) {
			Connection con = getConnection();

			int result = new UserBoardDao().updateRec(con,num);

			if(result >0) {
				commit(con);
			}else {
				rollback(con);
			}
			close(con);




		return result;
	}
	public UserBoard selectmodified(int num) {
			Connection con = getConnection();

			UserBoard ub = new UserBoardDao().selectModified(con, num);

			close(con);

		return ub;
	}
	public int updateOutcon(UserBoard ub) {
			Connection con = getConnection();

			int result = new UserBoardDao().updateOutcon(con,ub);

			if(result > 0) {
				commit(con);
			}else{
				rollback(con);
			}

			close(con);

		return result;
	}
	public int deleteParcelout(int num) {
			Connection con = getConnection();

			int result = new UserBoardDao().deleteParcelout(con,num);

			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
			close(con);



		return result;
	}
	public ArrayList<HashMap<String, Object>> selectOutList2(int i, int j) {
		Connection con = getConnection();

		ArrayList<HashMap<String,Object>> list = new UserBoardDao().selectOutList2(con,i,j);


		close(con);

		return list;
	}
	public ArrayList<HashMap<String, Object>> outselectConUno(String outselect, String selectinput) {
		Connection con = getConnection();

		ArrayList<HashMap<String,Object>> list = new UserBoardDao().outselectConUno(con,outselect,selectinput);

		close(con);

		return list;
	}




}
