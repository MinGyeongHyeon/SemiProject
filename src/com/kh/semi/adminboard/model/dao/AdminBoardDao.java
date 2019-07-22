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

}
