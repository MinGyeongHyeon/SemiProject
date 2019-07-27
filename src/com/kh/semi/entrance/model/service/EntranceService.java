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

		System.out.println("개인 서비스 : " + parceloutList);

		list.put("entranceList", entranceList);
		list.put("parceloutList", parceloutList);

		return list;
	}

	public int getMyEntranceAllUserListCount() {
		Connection con = getConnection();

		int listCount = new EntranceDao().getMyEntranceAllUserListCount(con);

		close(con);

		return listCount;
	}

	public int getMyParceloutAllUserListCount() {
		Connection con = getConnection();

		int listCount = new EntranceDao().getMyParceloutAllUserListCount(con);

		close(con);

		return listCount;
	}

	public HashMap<String, Object> selectAllUserApply(int currentPage, int currentPage2, int limit, int limit2) {
		Connection con = getConnection();
		HashMap<String, Object> list = new HashMap<String, Object>();

		ArrayList<Entrance> entranceList = new EntranceDao().selectAllUserEntranceApply(con, currentPage, limit);
		ArrayList<ParcelOut> parceloutList = new EntranceDao().selectAllUserParceloutApply(con, currentPage2, limit2);

		System.out.println("service 분양 : " + parceloutList);
		System.out.println("service 입소 : " + entranceList);

		list.put("entranceList", entranceList);
		list.put("parceloutList", parceloutList);

		close(con);

		return list;
	}

	public int okEntranceApply(int entAppNo) {
		Connection con = getConnection();

		int result = new EntranceDao().okEntranceApply(con, entAppNo);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		return result;
	}

	public int noEntranceApply(int entAppNo, String reason) {
		Connection con = getConnection();

		int result = new EntranceDao().noEntranceApply(con, entAppNo, reason);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		return result;
	}

	public int okEntrance(int entAppNo) {
		Connection con = getConnection();

		int result = new EntranceDao().okEntrance(con, entAppNo);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		return result;
	}

	public int noEntrance(int entAppNo, String reason) {
		Connection con = getConnection();

		int result = new EntranceDao().noEntrance(con, entAppNo, reason);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		return result;
	}

	public EntranceDogInfo selectDogInfo(int entAppNo) {
		Connection con = getConnection();

		EntranceDogInfo dogInfo = new EntranceDao().selectDogInfo(con, entAppNo);

		close(con);

		return dogInfo;
	}

	public int okParceloutApply(int pcoAppNo) {
		Connection con = getConnection();

		int result = new EntranceDao().okParceloutApply(con, pcoAppNo);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		return result;
	}

	public int noParceloutApply(int pcoAppNo, String reason) {
		Connection con = getConnection();

		int result = new EntranceDao().noParceloutApply(con, pcoAppNo, reason);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		return result;
	}

	public int okParcelout(int pcoAppNo) {
		Connection con = getConnection();

		int result = new EntranceDao().okParcelout(con, pcoAppNo);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		return result;
	}

	public int noParcelout(int pcoAppNo, String reason) {
		Connection con = getConnection();

		int result = new EntranceDao().noParcelout(con, pcoAppNo, reason);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		return result;
	}

}
