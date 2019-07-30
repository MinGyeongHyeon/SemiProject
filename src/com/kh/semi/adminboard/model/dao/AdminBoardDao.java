package com.kh.semi.adminboard.model.dao;

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

import com.kh.semi.adminboard.model.vo.AdminBoard;
import com.kh.semi.adminboard.model.vo.AdminUserBoard;
import com.kh.semi.board.parcelout.model.vo.Attachment;

public class AdminBoardDao {
	private Properties prop = new Properties();

	public AdminBoardDao() {
		String fileName =
				AdminBoardDao.class.getResource("/sql/adminBoard/adminBoard-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection con) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("selectListCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "공지");

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

	public ArrayList<AdminBoard> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminBoard> list = null;

		String query = prop.getProperty("selectListWithPageing");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setString(1, "공지");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<AdminBoard>();

			while(rset.next()) {
				AdminBoard ab = new AdminBoard();
				ab.setAdBoardNo(rset.getInt("AD_BOARD_NO"));
				ab.setTitle(rset.getString("TITLE"));
				ab.setAdBoardCon(rset.getString("AD_BOARD_CON"));
				ab.setWriteDt(rset.getDate("WRITE_DT"));
				ab.setBoardDiv(rset.getString("BOARD_DIV"));
				ab.setAdNo(rset.getInt("AD_NO"));
				ab.setStatus(rset.getString("STATUS"));
				ab.setNickNm(rset.getString("NICK_NM"));

				list.add(ab);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int insertBoard(Connection con, AdminBoard ab) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ab.getTitle());
			pstmt.setString(2, ab.getAdBoardCon());
			pstmt.setString(3, "공지");
			pstmt.setInt(4, ab.getAdNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public AdminBoard selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminBoard ab = null;

		String query = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				ab = new AdminBoard();
				ab.setAdBoardNo(rset.getInt("AD_BOARD_NO"));
				ab.setTitle(rset.getString("TITLE"));
				ab.setAdBoardCon(rset.getString("AD_BOARD_CON"));
				ab.setWriteDt(rset.getDate("WRITE_DT"));
				ab.setBoardDiv(rset.getString("BOARD_DIV"));
				ab.setAdNo(rset.getInt("AD_NO"));
				ab.setStatus(rset.getString("STATUS"));
				ab.setNickNm(rset.getString("NICK_NM"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ab;
	}

	public int insertThumbnailSupportContent(Connection con, AdminBoard ab) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertsupportBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ab.getTitle());
			pstmt.setString(2, ab.getAdBoardCon());
			pstmt.setString(3, "후원");
			pstmt.setString(4, "금전후원");
			pstmt.setInt(5, ab.getAdNo());
			pstmt.setString(6, ab.getSup_Mon());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;

		String query = prop.getProperty("selectsupportCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				bid = rset.getInt("currval");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return bid;
	}

	public int insertSupportAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertSupportAttachment");

		System.out.println("FILE LIST ? " + fileList);

			try {
				for(int i = 0; i < fileList.size(); i++) {
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, fileList.get(i).getOriginNm());
					pstmt.setString(2, fileList.get(i).getChangeNm());
					pstmt.setString(3, fileList.get(i).getFilePath());
					pstmt.setInt(4, fileList.get(i).getAdBoardno());
					pstmt.setString(5, "후원");

					result += pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

		return result;
	}

	public AdminBoard selectSupportList(Connection con, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdminBoard ab = null;

		String query = prop.getProperty("selectSupportList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "후원");
			pstmt.setString(2, "금전후원");
			pstmt.setString(3, String.valueOf(currentPage).toString());
			rset = pstmt.executeQuery();

			if(rset.next()) {
				ab = new AdminBoard();
				ab.setAdBoardNo(rset.getInt("AD_BOARD_NO"));
				ab.setTitle(rset.getString("TITLE"));
				ab.setAdBoardCon(rset.getString("AD_BOARD_CON"));
				ab.setWriteDt(rset.getDate("WRITE_DT"));
				ab.setAdNo(rset.getInt("AD_NO"));
				ab.setRecCount(rset.getInt("REC_COUNT"));
				ab.setViewCount(rset.getInt("VIEW_COUNT"));
				ab.setNickNm(rset.getString("NICK_NM"));

			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}


		return ab;
	}

	public Attachment selectSupportAttachment(Connection con, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment ac = null;

		String query = prop.getProperty("selectSupportAttachment");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, String.valueOf(currentPage).toString());

			rset = pstmt.executeQuery();

			if(rset.next()) {
				ac = new Attachment();
				ac.setAttachmentNo(rset.getInt("ATTACHMENT_NO"));
				ac.setOriginNm(rset.getString("ORIGIN_NM"));
				ac.setChangeNm(rset.getString("CHANGE_NM"));
				ac.setFilePath(rset.getString("FILE_PATH"));
				ac.setUploadDt(rset.getDate("UPLOAD_DT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return ac;
	}

	public int getListCountad(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("getListCountad");



		try {
			stmt = con.createStatement();



			rset = stmt.executeQuery(query);

			if(rset.next()) {
				result = rset.getInt(1);
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}




		return result;
	}
	public int getListCountad2(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("getListCountad2");



		try {
			stmt = con.createStatement();



			rset = stmt.executeQuery(query);

			if(rset.next()) {
				result = rset.getInt(1);
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}




		return result;
	}

	public ArrayList<AdminUserBoard> selectListad(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<AdminUserBoard> list = null;
		ResultSet rset = null;
		AdminUserBoard ub = null;


		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String query = prop.getProperty("selectListad");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);


			rset = pstmt.executeQuery();


			 list = new ArrayList<AdminUserBoard>();
			while(rset.next()) {
				ub = new AdminUserBoard();

				ub.setBoardNo(rset.getInt("BOARD_NO"));
				ub.setbKind(rset.getString("BOARD_KIND"));
				ub.setbNm(rset.getString("BOARD_NM"));
				ub.setbDate(rset.getDate("BOARD_DT"));
				ub.setbCon(rset.getString("BOARD_CON"));
				ub.setInqCon(rset.getInt("INQ_COUNT"));
				ub.setRecCon(rset.getInt("REC_COUNT"));
				ub.setuNo(rset.getInt("USER_NO"));
				ub.setbUserNick(rset.getString("NICK_NM"));


				list.add(ub);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return list;
	}
	public ArrayList<AdminUserBoard> selectListad2(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<AdminUserBoard> list = null;
		ResultSet rset = null;
		AdminUserBoard ub = null;


		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String query = prop.getProperty("selectListad2");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);


			rset = pstmt.executeQuery();


			 list = new ArrayList<AdminUserBoard>();
			while(rset.next()) {
				ub = new AdminUserBoard();

				ub.setBoardNo(rset.getInt("BOARD_NO"));
				ub.setbKind(rset.getString("BOARD_KIND"));
				ub.setbNm(rset.getString("BOARD_NM"));
				ub.setbDate(rset.getDate("BOARD_DT"));
				ub.setbCon(rset.getString("BOARD_CON"));
				ub.setInqCon(rset.getInt("INQ_COUNT"));
				ub.setRecCon(rset.getInt("REC_COUNT"));
				ub.setuNo(rset.getInt("USER_NO"));
				ub.setbUserNick(rset.getString("NICK_NM"));


				list.add(ub);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return list;
	}

	public ArrayList<Integer> reportCount(Connection con, ArrayList<AdminUserBoard> list2) {
		PreparedStatement pstmt = null;
		ArrayList<Integer> reportCount = null;
		ResultSet rset = null;
		int rseult = 0;

		String query = prop.getProperty("reportCount");

		try {
			reportCount = new ArrayList<Integer>();
			for(int i = 0; i < list2.size(); i++) {

				pstmt = con.prepareStatement(query);

				pstmt.setInt(1, list2.get(i).getBoardNo());


				rset = pstmt.executeQuery();

				if(rset.next()) {

					 rseult = rset.getInt("COUNT");

					reportCount.add(rseult);

				}

			}


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {

		}




		return reportCount;
	}

	public ArrayList<AdminUserBoard> selectAll(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<AdminUserBoard> list = null;
		ResultSet rset = null;
		AdminUserBoard ub = null;


		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String query = prop.getProperty("selectListad");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);


			rset = pstmt.executeQuery();


			 list = new ArrayList<AdminUserBoard>();
			while(rset.next()) {
				ub = new AdminUserBoard();

				ub.setBoardNo(rset.getInt("BOARD_NO"));
				ub.setbKind(rset.getString("BOARD_KIND"));
				ub.setbNm(rset.getString("BOARD_NM"));
				ub.setbDate(rset.getDate("BOARD_DT"));
				ub.setbCon(rset.getString("BOARD_CON"));
				ub.setInqCon(rset.getInt("INQ_COUNT"));
				ub.setRecCon(rset.getInt("REC_COUNT"));
				ub.setuNo(rset.getInt("USER_NO"));
				ub.setbUserNick(rset.getString("NICK_NM"));


				list.add(ub);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return list;
	}


}
