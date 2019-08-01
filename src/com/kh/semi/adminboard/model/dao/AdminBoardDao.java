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
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.adminboard.model.vo.AdminBoard;
import com.kh.semi.adminboard.model.vo.AdminComment;
import com.kh.semi.adminboard.model.vo.AdminStatic;
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

	public int getfreeCount(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("getfreeCount");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "잡담");
			pstmt.setString(2, "자랑");
			pstmt.setString(3, "꿀팁");


			rset = pstmt.executeQuery();

			if(rset.next()) {

				result = rset.getInt("COUNT");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return result;
	}

	public ArrayList<AdminUserBoard> selectfree(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<AdminUserBoard> list = null;
		ResultSet rset = null;
		AdminUserBoard ub = null;


		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String query = prop.getProperty("selectfree");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "잡담");
			pstmt.setString(2, "꿀팁");
			pstmt.setString(3, "자랑");
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);


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

	public int getparceloutCount(Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rset = null;

		String query = prop.getProperty("getparceloutCount");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "분양후기");

			rset = pstmt.executeQuery();

			if(rset.next()) {

				result = rset.getInt("COUNT");

			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}



		return result;
	}

	public ArrayList<AdminUserBoard> selectparcelout(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<AdminUserBoard> list = null;
		ResultSet rset = null;
		AdminUserBoard ub = null;


		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String query = prop.getProperty("selectparcelout");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "분양후기");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);


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

	public int deleteNotice(Connection con, int adBoardNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteNotice");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, adBoardNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	public int updateNotice(Connection con, AdminBoard ab) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateNotice");

		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, ab.getTitle());
			pstmt.setString(2, ab.getAdBoardCon());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}


	public int getListCounted(Connection con) {
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

	public ArrayList<AdminComment> selectListed(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<AdminComment> list = null;
		ResultSet rset = null;
		AdminComment ub = null;


		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String query = prop.getProperty("selectListed");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);


			rset = pstmt.executeQuery();


			 list = new ArrayList<AdminComment>();
			while(rset.next()) {
				ub = new AdminComment();

				ub.setBoardNo(rset.getInt("BOARD_NO"));
				ub.setbKind(rset.getString("BOARD_KIND"));
				ub.setbNm(rset.getString("BOARD_NM"));
				ub.setbDate(rset.getDate("BOARD_DT"));
				ub.setbCon(rset.getString("BOARD_CON"));
				ub.setInqCon(rset.getInt("INQ_COUNT"));
				ub.setRecCon(rset.getInt("REC_COUNT"));

				ub.setbUserNick(rset.getString("NICK_NM"));
				ub.setcCon(rset.getString("COM_CON"));
				ub.setcNo(rset.getInt("USER_NO"));

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

	public int getListCounted2(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("getListCounted2");



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

	public ArrayList<AdminComment> selectListed2(Connection con, int currentPage2, int limit2) {
		PreparedStatement pstmt = null;
		ArrayList<AdminComment> list = null;
		ResultSet rset = null;
		AdminComment ub = null;


		int startRow = (currentPage2 - 1) * limit2 + 1;
		int endRow = startRow + limit2 - 1;

		String query = prop.getProperty("selectListed2");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);


			rset = pstmt.executeQuery();


			 list = new ArrayList<AdminComment>();
			while(rset.next()) {
				ub = new AdminComment();

				ub.setBoardNo(rset.getInt("BOARD_NO"));
				ub.setbKind(rset.getString("BOARD_KIND"));
				ub.setbNm(rset.getString("BOARD_NM"));
				ub.setbDate(rset.getDate("BOARD_DT"));
				ub.setbCon(rset.getString("BOARD_CON"));
				ub.setInqCon(rset.getInt("INQ_COUNT"));
				ub.setRecCon(rset.getInt("REC_COUNT"));
				ub.setuNo(rset.getInt("USER_NO"));
				ub.setbUserNick(rset.getString("NICK_NM"));
				ub.setcCon(rset.getString("COM_CON"));
				ub.setRe(rset.getInt("REPORT_USER"));
				ub.setcNo(rset.getInt("COM_NO"));


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

	public ArrayList<Integer> CoreportCount(Connection con, ArrayList<AdminComment> list2) {
		PreparedStatement pstmt = null;
		ArrayList<Integer> reportCount = null;
		ResultSet rset = null;
		int rseult = 0;

		String query = prop.getProperty("reportCount2");

		try {
			reportCount = new ArrayList<Integer>();

			for(int i = 0; i < list2.size(); i++) {
				System.out.println("코멘트 넘버 : " + list2.get(i).getcNo());
				pstmt = con.prepareStatement(query);

				pstmt.setInt(1, list2.get(i).getcNo());


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

	public ArrayList<Integer> recCount(Connection con, ArrayList<AdminUserBoard> list) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		ArrayList<Integer> recCount = null;

		String query = prop.getProperty("recCount");

		try {
				recCount = new ArrayList<Integer>();
			for(int i = 0; i < list.size(); i++) {
				pstmt = con.prepareStatement(query);


				pstmt.setInt(1, list.get(i).getBoardNo());

				rset = pstmt.executeQuery();

				if(rset.next()) {
					result = rset.getInt("COUNT");

					recCount.add(result);
				}


			}



		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}




		return recCount;
	}
	public int getmssingCount(Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("getmssingCount");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "실종");


			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}



		return result;
	}

	public ArrayList<AdminUserBoard> selectmissing(Connection con, int currentPage, int limit) {

		PreparedStatement pstmt = null;
		ArrayList<AdminUserBoard> list = null;
		ResultSet rset = null;
		AdminUserBoard ub = null;


		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String query = prop.getProperty("selectmissing");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "실종");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);


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

	public int getmssingCount2(Connection con) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("getmssingCount2");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "보호");


			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}



		return result;

	}

	public ArrayList<AdminUserBoard> selectmissing2(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<AdminUserBoard> list = null;
		ResultSet rset = null;
		AdminUserBoard ub = null;


		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String query = prop.getProperty("selectmissing");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "보호");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);


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


	public ArrayList<HashMap<String, Object>> statics(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;

		ResultSet rset = null;
			System.out.println("다오");
		String query = prop.getProperty("statics");//회원탈퇴이유

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			list = new ArrayList<HashMap<String, Object>>();

			while(rset.next()) {
				hmap = new HashMap<String,Object>();

				hmap.put("reason1", rset.getString("L1"));
				hmap.put("reason2", rset.getString("L2"));
				hmap.put("reason3", rset.getString("L3"));
				hmap.put("reason4", rset.getString("L4"));
				hmap.put("reason5", rset.getString("L5"));

				list.add(hmap);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}


		return list;
	}

	public ArrayList<HashMap<String, Object>> statics2(Connection con) {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;

		ResultSet rset = null;
			System.out.println("다오");
		String query = prop.getProperty("statics2"); //분양강아지 종류

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "말티즈");
			pstmt.setString(2, "코카스파니엘");
			pstmt.setString(3, "비글");
			pstmt.setString(4, "믹스견");
			pstmt.setString(5, "푸들");

			rset = pstmt.executeQuery();

			list = new ArrayList<HashMap<String, Object>>();

			while(rset.next()) {
				hmap = new HashMap<String,Object>();

				hmap.put("dog_kind1", rset.getString("D1"));
				hmap.put("dog_kind2", rset.getString("D2"));
				hmap.put("dog_kind3", rset.getString("D3"));
				hmap.put("dog_kind4", rset.getString("D4"));
				hmap.put("dog_kind5", rset.getString("D5"));

				list.add(hmap);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}


		return list;
	}

	//회원가입 경로
	public ArrayList<HashMap<String, Object>> statics3(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;

		ResultSet rset = null;
			System.out.println("다오");
		String query = prop.getProperty("statics3");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			list = new ArrayList<HashMap<String, Object>>();

			while(rset.next()) {
				hmap = new HashMap<String,Object>();

				hmap.put("root1", rset.getString("L1"));
				hmap.put("root2", rset.getString("L2"));
				hmap.put("root3", rset.getString("L3"));
				hmap.put("root4", rset.getString("L4"));
				hmap.put("root5", rset.getString("L5"));

				list.add(hmap);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}


		return list;
	}

	//후원취소 이유
	public ArrayList<HashMap<String, Object>> statics4(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;

		ResultSet rset = null;
			System.out.println("다오");
		String query = prop.getProperty("statics4");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			list = new ArrayList<HashMap<String, Object>>();

			while(rset.next()) {
				hmap = new HashMap<String,Object>();

				hmap.put("can1", rset.getString("L1"));
				System.out.println(rset.getString("L1"));

				hmap.put("can2", rset.getString("L2"));
				hmap.put("can3", rset.getString("L3"));
				hmap.put("can4", rset.getString("L4"));


				list.add(hmap);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}


		return list;
	}

	public ArrayList<Object> sortlow(Connection con, int currentPage, int limit, String data) {
			ArrayList<Object> list = null;
			AdminUserBoard ub = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;


			String query = null;

			if(data.equals("sortlow")) {

				query = prop.getProperty("sortlow");
			}else {

				query = prop.getProperty("sorthigh");
			}


			try {
				pstmt = con.prepareStatement(query);

				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);

				rset = pstmt.executeQuery();

					list = new ArrayList<Object>();
				while(rset.next()) {
					ub = new AdminUserBoard();

					ub.setuNo(rset.getInt("USER_NO"));
					ub.setBoardNo(rset.getInt("BOARD_NO"));
					ub.setbKind(rset.getString("BOARD_KIND"));
					ub.setbNm(rset.getString("BOARD_NM"));
					ub.setbCon(rset.getString("BOARD_CON"));
					ub.setbUserNick(rset.getString("NICK_NM"));

					list.add(ub);
				}


			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}



		return list;
	}

	public int getSortlistCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("sortlist");

		try {
			stmt = con.createStatement();


			rset = stmt.executeQuery(query);

			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}





		return listCount;
	}

	public ArrayList<Integer> reportCount2(Connection con,ArrayList<Object> list) {
		PreparedStatement pstmt = null;
		ArrayList<Integer> list2 = null;
		ResultSet rset = null;
		int result = 0;



		String query = prop.getProperty("reportCount");

		try {
			list2 = new ArrayList<Integer>();

			AdminUserBoard ub = null;

			for(int i = 0; i < list.size(); i++) {
				ub = (AdminUserBoard) list.get(i);



				pstmt = con.prepareStatement(query);

				pstmt.setInt(1, ub.getBoardNo());


				rset = pstmt.executeQuery();

				if(rset.next()) {

					 result = rset.getInt("COUNT");

					list2.add(result);

				}

			}


		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}




		return list2;
	}


}