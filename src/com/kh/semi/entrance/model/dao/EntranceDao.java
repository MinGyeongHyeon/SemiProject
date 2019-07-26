package com.kh.semi.entrance.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.entrance.model.vo.Entrance;
import com.kh.semi.entrance.model.vo.EntranceDogInfo;
import com.kh.semi.parcelout.model.vo.ParcelOut;
import com.kh.semi.support.money.model.vo.MoneySup;

public class EntranceDao {
	private Properties prop = new Properties();

	public EntranceDao() {
		String fileName =
				EntranceDao.class.getResource("/sql/entrance/entrance-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertEntranceApp(Connection con, Entrance et) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertEntranceApp");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, et.getUserNo());
			pstmt.setString(2, et.getSelHopeDt());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectEntranceAppCurr(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("selectEntranceAppCurr");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				result = rset.getInt("CURRVAL");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return result;
	}

	public int insertEntranceDogInfo(Connection con, EntranceDogInfo dogInfo, int appCurrval) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertEntranceDogInfo");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dogInfo.getDogNm());
			pstmt.setString(2, dogInfo.getDogAge());
			pstmt.setString(3, dogInfo.getDogGender());
			pstmt.setString(4, dogInfo.getDogKind());
			pstmt.setInt(5, dogInfo.getDogWeight());
			pstmt.setInt(6, dogInfo.getDogHeight());
			pstmt.setString(7, dogInfo.getInoYn());
			pstmt.setString(8, dogInfo.getDisYn());
			pstmt.setString(9, dogInfo.getOperYn());
			pstmt.setString(10, dogInfo.getAllegy());
			pstmt.setString(11, dogInfo.getDogHobby());
			pstmt.setString(12, dogInfo.getDogBark());
			pstmt.setString(13, dogInfo.getDogBowel());
			pstmt.setString(14, dogInfo.getDogAct());
			pstmt.setString(15, dogInfo.getSeperate());
			pstmt.setString(16, dogInfo.getFurColor());
			pstmt.setString(17, dogInfo.getObYn());
			pstmt.setString(18, dogInfo.getRegYn());
			pstmt.setString(19, dogInfo.getDogChar());
			pstmt.setInt(20, appCurrval);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectEntranceDogInfoCurr(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("selectEntranceDogInfoCurr");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				result = rset.getInt("CURRVAL");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return result;
	}

	public int insertEntranceDogDetail(Connection con, EntranceDogInfo dogInfo, int dogCurrval) {
		PreparedStatement pstmt = null;
		int num1 = 0;
		int num2 = 0;
		int num3 = 0;
		int result = 0;

		if(dogInfo.getT1() != null) {
			for(int i = 0; i < dogInfo.getT1().length; i++) {
				String query = prop.getProperty("insertEntranceDogDetailIno");

				try {
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, dogInfo.getT1()[i]);
					pstmt.setInt(2, dogCurrval);

					num1 = pstmt.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(num1 > 0) {
				result += 1;
			}
		}

		if(dogInfo.getTt1() != null) {
			for(int i = 0; i < dogInfo.getTt1().length; i++) {
				String query = prop.getProperty("insertEntranceDogDetailDis");

				try {
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, dogInfo.getTt1()[i]);
					pstmt.setInt(2, dogCurrval);

					num2 = pstmt.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(num2 > 0) {
				result += 1;
			}
		}

		if(dogInfo.getTtt1() != null) {
			for(int i = 0; i < dogInfo.getTtt1().length; i++) {
				String query = prop.getProperty("insertEntranceDogDetailOper");

				try {
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, dogInfo.getTtt1()[i]);
					pstmt.setInt(2, dogCurrval);

					num3 = pstmt.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if(num3 > 0) {
				result += 1;
			}
		}

		return result;
	}

	public int getMyEntranceAllListCount(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("getMyEntranceAllListCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}


		return listCount;
	}

	public int getMyParceloutAllListCount(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		int listCount2 = 0;
		ResultSet rset = null;

		String query = prop.getProperty("getMyParceloutAllListCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount2 = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}


		return listCount2;
	}

	public ArrayList<Entrance> selectAllentranceApply(Connection con, int userNo, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Entrance> entranceList = null;

		String query = prop.getProperty("selectAllentranceApply");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			entranceList = new ArrayList<Entrance>();

			while(rset.next()) {
				Entrance et = new Entrance();
				et.setEntAppNo(rset.getInt("ENT_APP_NO"));
				et.setUserNo(rset.getInt("USER_NO"));
				et.setWriteDt(rset.getDate("WRITE_DT"));
				et.setSelHopeDt(rset.getString("SEL_HOPE_DT"));
				et.setAppSit(rset.getString("APP_SIT"));

				entranceList.add(et);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return entranceList;
	}

	public ArrayList<ParcelOut> selectAllparceloutApply(Connection con, int userNo, int currentPage2, int limit2) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ParcelOut> parcleList = null;

		String query = prop.getProperty("selectAllparceloutApply");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage2 - 1) * limit2 + 1;
			int endRow = startRow + limit2 - 1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			parcleList = new ArrayList<ParcelOut>();

			while(rset.next()) {
				ParcelOut po = new ParcelOut();
				po.setPcoAppNo(rset.getInt("PCO_APP_NO"));
				po.setUserNo(rset.getInt("USER_NO"));
				po.setAnsDt(rset.getDate("ANS_DT"));
				po.setSelAppDt(rset.getString("SEL_APP_DT"));
				po.setPcoSit(rset.getString("PCO_SIT"));

				parcleList.add(po);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return parcleList;
	}

}
