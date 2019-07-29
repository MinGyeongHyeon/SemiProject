package com.kh.semi.sel.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.sel.model.vo.SelSit;
import static com.kh.semi.common.JDBCTemplate.*;

public class SelSitDao {
	private Properties prop = new Properties();

	public SelSitDao() {
		String fileName =
				SelSitDao.class.getResource("/sql/selsit/selsit-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<String> selectSelDayforDate(Connection con, String result) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list = new ArrayList<String>();

		String query = prop.getProperty("selectSelDayforDate");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, result);

			rset = pstmt.executeQuery();


			while(rset.next()) {
				String day = rset.getString("SEL_DT");

				list.add(day);
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

	public ArrayList<String> selectSelDayforDatePco(Connection con, String result) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list = new ArrayList<String>();

		String query = prop.getProperty("selectSelDayforDatePco");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, result);

			rset = pstmt.executeQuery();


			while(rset.next()) {
				String day = rset.getString("SEL_DT");

				list.add(day);
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

}
