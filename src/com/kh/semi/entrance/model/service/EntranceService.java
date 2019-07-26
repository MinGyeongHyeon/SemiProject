package com.kh.semi.entrance.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.board.parcelout.model.vo.Attachment;
import com.kh.semi.entrance.model.dao.EntranceDao;
import com.kh.semi.entrance.model.vo.Entrance;
import com.kh.semi.entrance.model.vo.EntranceDogInfo;
import com.kh.semi.parcelout.model.vo.ParcelOut;


public class EntranceService {

	public int insertEntrance(ArrayList<Attachment> fileList, Entrance et, EntranceDogInfo dogInfo) {
		Connection con = getConnection();
		int num1 = 0;
		int num2 = 0;


		int result = new EntranceDao().insertEntranceApp(con, et);

		if(result > 0) {
			commit(con);
			int appCurrval = new EntranceDao().selectEntranceAppCurr(con);
			num1 = new EntranceDao().insertEntranceDogInfo(con, dogInfo, appCurrval);
			if(num1 > 0) {
				commit(con);
				int dogCurrval = new EntranceDao().selectEntranceDogInfoCurr(con);
				num2 = new EntranceDao().insertEntranceDogDetail(con, dogInfo, dogCurrval);
				if(num2 > 0) {
					System.out.println("성공했다!!");
					commit(con);
				}else {
					rollback(con);
				}
			}else {
				rollback(con);
			}
		}else {
			rollback(con);
		}

		return num2;
	}

	public int getMyEntranceAllListCount(int userNo) {
		Connection con = getConnection();

		int listCount = new EntranceDao().getMyEntranceAllListCount(con, userNo);

		close(con);

		return listCount;
	}

	public int getMyParceloutAllListCount(int userNo) {
		Connection con = getConnection();

		int listCount = new EntranceDao().getMyParceloutAllListCount(con, userNo);

		close(con);

		return listCount;
	}

	public HashMap<String, Object> selectAllApply(int userNo, int currentPage, int currentPage2, int limit,
			int limit2) {
		Connection con = getConnection();
		HashMap<String, Object> list = new HashMap<String, Object>();

		ArrayList<Entrance> entranceList = new EntranceDao().selectAllentranceApply(con, userNo, currentPage, limit);
		ArrayList<ParcelOut> parceloutList = new EntranceDao().selectAllparceloutApply(con, userNo, currentPage2, limit2);

		list.put("entranceList", entranceList);
		list.put("parceloutList", parceloutList);

		return list;
	}

}
