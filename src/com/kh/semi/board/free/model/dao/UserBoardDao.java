package com.kh.semi.board.free.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;


import static com.kh.semi.common.JDBCTemplate.*;


import com.kh.semi.board.free.model.vo.UserBoard;
import com.kh.semi.board.free.model.vo.UserBoardAttachment;


public class UserBoardDao {
	private Properties prop = new Properties();


	public UserBoardDao() {
		String fileName =
				UserBoardDao.class.getResource("/sql/board/free/board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	//게시물 전체 조회
	public ArrayList<UserBoard> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<UserBoard> list = null;

		String query = prop.getProperty("selectList");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			list = new ArrayList<UserBoard>();

			while(rset.next()) {
				UserBoard ub = new UserBoard();

				ub.setbNo(rset.getInt("BOARD_NO"));
				ub.setbKind(rset.getString("BOARD_KIND"));
				ub.setbNm(rset.getString("BOARD_NM"));
				ub.setbDate(rset.getDate("BOARD_DT"));
				ub.setbCon(rset.getString("BOARD_CON"));
				ub.setInqCon(rset.getInt("INQ_COUNT"));
				ub.setRecCon(rset.getInt("REC_COUNT"));
				ub.setsGrade(rset.getInt("STAR_GRADE"));
				ub.setbUserNick(rset.getString("NICK_NM"));
				ub.setStatus(rset.getString("STATUS"));



				System.out.println(ub);



				list.add(ub);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}





	//게시물 작성용 메소드
	public int insertBoard(Connection con, UserBoard ub) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ub.getbKind());
			pstmt.setString(2, ub.getbNm());
			pstmt.setString(3, ub.getbCon());
			pstmt.setInt(4, ub.getuNo());
			//여긴 필요한 값 각자 알아서

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	//조회수 증가
	public int updateCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public UserBoard selectOneub(Connection con, int num) {
		System.out.println("num : " + num);
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		UserBoard ub = null;

		String query = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			System.out.println("다오 넘 : " + num);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				ub = new UserBoard();

				ub.setbNo(rset.getInt("BOARD_NO"));
				ub.setbKind(rset.getString("BOARD_KIND"));
				ub.setbNm(rset.getString("BOARD_NM"));
				ub.setbDate(rset.getDate("BOARD_DT"));
				ub.setbCon(rset.getString("BOARD_CON"));
				ub.setInqCon(rset.getInt("INQ_COUNT"));
				ub.setRecCon(rset.getInt("REC_COUNT"));
				ub.setbUserNick(rset.getString("NICK_NM"));

			}
			
			System.out.println(ub);


		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return ub;
	}


	public ArrayList<UserBoard> selectListBest(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<UserBoard> best = null;

		String query = prop.getProperty("selectBestList");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			best = new ArrayList<UserBoard>();

			while(rset.next()) {
				UserBoard ubbest = new UserBoard();

				ubbest.setbNo(rset.getInt("BOARD_NO"));
				ubbest.setbKind(rset.getString("BOARD_KIND"));
				ubbest.setbNm(rset.getString("BOARD_NM"));
				ubbest.setbDate(rset.getDate("BOARD_DT"));
				ubbest.setbCon(rset.getString("BOARD_CON"));
				ubbest.setInqCon(rset.getInt("INQ_COUNT"));
				ubbest.setRecCon(rset.getInt("REC_COUNT"));
				ubbest.setsGrade(rset.getInt("STAR_GRADE"));
				ubbest.setbUserNick(rset.getString("NICK_NM"));
				ubbest.setStatus(rset.getString("STATUS"));



				System.out.println(ubbest);



				best.add(ubbest);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return best;
	}


	public ArrayList<UserBoard> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UserBoard> list = null;
		
		String query = prop.getProperty("selectListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);

			//조회를 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<UserBoard>();
			
			while(rset.next()) {
				UserBoard ub = new UserBoard();

				ub.setbNo(rset.getInt("BOARD_NO"));
				ub.setbKind(rset.getString("BOARD_KIND"));
				ub.setbNm(rset.getString("BOARD_NM"));
				ub.setbDate(rset.getDate("BOARD_DT"));
				ub.setbCon(rset.getString("BOARD_CON"));
				ub.setInqCon(rset.getInt("INQ_COUNT"));
				ub.setRecCon(rset.getInt("REC_COUNT"));
				ub.setsGrade(rset.getInt("STAR_GRADE"));
				ub.setbUserNick(rset.getString("NICK_NM"));
				ub.setStatus(rset.getString("STATUS"));



				System.out.println(ub);



				list.add(ub);

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return list;
	}

	public ArrayList<UserBoard> selectList(Connection con, int currentPage, int limit, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UserBoard> list = null;
		
		String query = prop.getProperty("selectListCateWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);

			//조회를 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<UserBoard>();
			
			while(rset.next()) {
				UserBoard ub = new UserBoard();

				ub.setbNo(rset.getInt("BOARD_NO"));
				ub.setbKind(rset.getString("BOARD_KIND"));
				ub.setbNm(rset.getString("BOARD_NM"));
				ub.setbDate(rset.getDate("BOARD_DT"));
				ub.setbCon(rset.getString("BOARD_CON"));
				ub.setInqCon(rset.getInt("INQ_COUNT"));
				ub.setRecCon(rset.getInt("REC_COUNT"));
				ub.setsGrade(rset.getInt("STAR_GRADE"));
				ub.setbUserNick(rset.getString("NICK_NM"));
				ub.setStatus(rset.getString("STATUS"));



				System.out.println(ub);



				list.add(ub);

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return list;
	}
	

	public ArrayList<UserBoard> myselectList(Connection con, int currentPage, int limit, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UserBoard> list = null;
		
		String query = prop.getProperty("selectmyListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);

			//조회를 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<UserBoard>();
			
			while(rset.next()) {
				UserBoard ub = new UserBoard();

				ub.setbNo(rset.getInt("BOARD_NO"));
				ub.setbKind(rset.getString("BOARD_KIND"));
				ub.setbNm(rset.getString("BOARD_NM"));
				ub.setbDate(rset.getDate("BOARD_DT"));
				ub.setbCon(rset.getString("BOARD_CON"));
				ub.setInqCon(rset.getInt("INQ_COUNT"));
				ub.setRecCon(rset.getInt("REC_COUNT"));
				ub.setsGrade(rset.getInt("STAR_GRADE"));
				ub.setbUserNick(rset.getString("NICK_NM"));
				ub.setStatus(rset.getString("STATUS"));



				System.out.println(ub);



				list.add(ub);

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return list;
	}

	public int getListCount(Connection con, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;

		
		String query = prop.getProperty("selectListCategoryCount");
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;

	}
	
	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectListCount");
		
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public int getmyListCount(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;

		
		String query = prop.getProperty("selectmyListCount");
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}


	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				bid = rset.getInt("currval");
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return bid;
	}


	public int insertAttachment(Connection con, ArrayList<UserBoardAttachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1,"자유");
				pstmt.setString(2, fileList.get(i).getOriginNm());
				pstmt.setString(3, fileList.get(i).getChangeNm());
				pstmt.setString(4, fileList.get(i).getFilePath());
				pstmt.setString(5,"0");
				
				int level = 0;
				if(i == 0) {
					level = 0;
				}else {
					level = 1;
				}
				
				pstmt.setInt(5, level);
				
				result += pstmt.executeUpdate();
					
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public HashMap<String, Object> selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		UserBoard ub = null;
		UserBoardAttachment at = null;
		ArrayList<UserBoardAttachment> list = null;
		String query = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);

			rset = pstmt.executeQuery();

			list = new ArrayList<UserBoardAttachment>();
			if(rset.next()) {
				ub = new UserBoard();
				ub.setbNo(rset.getInt("BOARD_NO"));
				ub.setbKind(rset.getString("BOARD_KIND"));
				ub.setbNm(rset.getString("BOARD_NM"));
				ub.setbDate(rset.getDate("BOARD_DT"));
				ub.setbCon(rset.getString("BOARD_CON"));
				ub.setInqCon(rset.getInt("INQ_COUNT"));
				ub.setRecCon(rset.getInt("REC_COUNT"));
				ub.setbUserNick(rset.getString("NICK_NM"));
				
				at = new UserBoardAttachment();
				at.setFileKind(rset.getString("FILE_KIND"));
				at.setAttachmentNo(rset.getInt("ATTACHMENT_NO"));
				at.setOriginNm(rset.getString("ORIGIN_NM"));
				at.setChangeNm(rset.getString("CHANGE_NM"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setUploadDt(rset.getDate("UPLOAD_DT"));
				at.setAdBoardno(rset.getInt("AD_BOARD_NO"));
				at.setBoardNo(rset.getInt("BOARD_NO"));
				at.setEntNo(rset.getInt("ENT_NO"));
				at.setFileLevel(rset.getString("FILE_LEVEL"));
				
				list.add(at);
			}
			
			hmap = new HashMap<String, Object>();
			hmap.put("board", ub);
			hmap.put("attachment", list);


		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return hmap;
	}


	public int deleteUserBoard(Connection con, int nno) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteUserBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}


		return result;
	}


	public int updateUserBoard(Connection con, UserBoard ub, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateUserBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ub.getbNm());
			pstmt.setString(2, ub.getbKind());
			pstmt.setString(3, ub.getbCon());
			pstmt.setInt(4, bNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}


		return result;
	}


	public int getsearchListCount(Connection con, String what, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = null;
		if(what.equals("writer")) {
			query = prop.getProperty("getsearchListCountWriter");
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, search);
				
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
		}else if(what.equals("title")) {
			query = prop.getProperty("getsearchListCountTitle");
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, search);
				
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
		}else {
			query = prop.getProperty("getsearchListCountTicon");
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, search);
				pstmt.setString(2, search);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
		}
		
		
		
		
		
		return listCount;
	}


	public ArrayList<UserBoard> selectList(Connection con, int currentPage, int limit, String search,
			String what) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UserBoard> list = null;
		
		String query = null;
		if(what.equals("writer")) {
			query = prop.getProperty("selectListWriterWithPaging");
			try {
				pstmt = con.prepareStatement(query);

				//조회를 시작할 행 번호와 마지막 행 번호 계산
				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;
				
				pstmt.setString(1, search);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<UserBoard>();
				
				while(rset.next()) {
					UserBoard ub = new UserBoard();

					ub.setbNo(rset.getInt("BOARD_NO"));
					ub.setbKind(rset.getString("BOARD_KIND"));
					ub.setbNm(rset.getString("BOARD_NM"));
					ub.setbDate(rset.getDate("BOARD_DT"));
					ub.setbCon(rset.getString("BOARD_CON"));
					ub.setInqCon(rset.getInt("INQ_COUNT"));
					ub.setRecCon(rset.getInt("REC_COUNT"));
					ub.setsGrade(rset.getInt("STAR_GRADE"));
					ub.setbUserNick(rset.getString("NICK_NM"));
					ub.setStatus(rset.getString("STATUS"));



					System.out.println(ub);



					list.add(ub);

					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
		}else if(what.equals("title")) {
			query = prop.getProperty("selectListTitleWithPaging");
			try {
				pstmt = con.prepareStatement(query);

				//조회를 시작할 행 번호와 마지막 행 번호 계산
				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;
				
				pstmt.setString(1, search);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<UserBoard>();
				
				while(rset.next()) {
					UserBoard ub = new UserBoard();

					ub.setbNo(rset.getInt("BOARD_NO"));
					ub.setbKind(rset.getString("BOARD_KIND"));
					ub.setbNm(rset.getString("BOARD_NM"));
					ub.setbDate(rset.getDate("BOARD_DT"));
					ub.setbCon(rset.getString("BOARD_CON"));
					ub.setInqCon(rset.getInt("INQ_COUNT"));
					ub.setRecCon(rset.getInt("REC_COUNT"));
					ub.setsGrade(rset.getInt("STAR_GRADE"));
					ub.setbUserNick(rset.getString("NICK_NM"));
					ub.setStatus(rset.getString("STATUS"));



					System.out.println(ub);



					list.add(ub);

					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
			
		}else {
			query = prop.getProperty("selectListTiconWithPaging");
			
			try {
				pstmt = con.prepareStatement(query);

				//조회를 시작할 행 번호와 마지막 행 번호 계산
				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;
				
				pstmt.setString(1, search);
				pstmt.setString(2, search);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<UserBoard>();
				
				while(rset.next()) {
					UserBoard ub = new UserBoard();

					ub.setbNo(rset.getInt("BOARD_NO"));
					ub.setbKind(rset.getString("BOARD_KIND"));
					ub.setbNm(rset.getString("BOARD_NM"));
					ub.setbDate(rset.getDate("BOARD_DT"));
					ub.setbCon(rset.getString("BOARD_CON"));
					ub.setInqCon(rset.getInt("INQ_COUNT"));
					ub.setRecCon(rset.getInt("REC_COUNT"));
					ub.setsGrade(rset.getInt("STAR_GRADE"));
					ub.setbUserNick(rset.getString("NICK_NM"));
					ub.setStatus(rset.getString("STATUS"));



					System.out.println(ub);



					list.add(ub);

					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
		}
				
		
		
		
		
		
		return list;
	}


	public int getListCountad(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectListCountad");
		
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}


	public ArrayList<UserBoard> selectListad(Connection con,int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UserBoard> list = null;
		
		String query = prop.getProperty("selectListadWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);

			//조회를 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<UserBoard>();
			
			while(rset.next()) {
				UserBoard ub = new UserBoard();

				ub.setbNo(rset.getInt("BOARD_NO"));
				ub.setbKind(rset.getString("BOARD_KIND"));
				ub.setbNm(rset.getString("BOARD_NM"));
				ub.setbDate(rset.getDate("BOARD_DT"));
				ub.setbCon(rset.getString("BOARD_CON"));
				ub.setInqCon(rset.getInt("INQ_COUNT"));
				ub.setRecCon(rset.getInt("REC_COUNT"));
				ub.setsGrade(rset.getInt("STAR_GRADE"));
				ub.setbUserNick(rset.getString("NICK_NM"));
				ub.setStatus(rset.getString("STATUS"));



				System.out.println(ub);



				list.add(ub);

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return list;
	}


	
	
}









