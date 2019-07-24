package com.kh.semi.parcelout.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.parcelout.model.vo.Application;
import com.kh.semi.user.model.vo.User;

import static com.kh.semi.common.JDBCTemplate.*;

public class ParcelOutDao {

	private Properties prop = new Properties();

	public ParcelOutDao() {

		String fileName = ParcelOutDao.class.getResource("/sql/parceloutApplication/application-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}


	public int insertApplication(Connection con, User us) {
			PreparedStatement pstmt = null;
			int result = 0;

			String query = prop.getProperty("PcoApp");

			try {
				pstmt = con.prepareStatement(query);

				pstmt.setInt(1, us.getUserNo());
				pstmt.setString(2, "분양대기");




				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}




		return result;
	}


	public int insertApplication2(Connection con, ArrayList<String> list) {
			PreparedStatement pstmt = null;
			int result = 0;


			try {
				String test = "";
				for(int i = 1; i <= list.size(); i++) {

					String query = prop.getProperty("insertApplication2");
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1 , i);
					if(i <= 3 || i == 9 || i == 10 || i == 11 || i == 13) {
						test = "서술";
						pstmt.setString(2, test);
					}else if(i == 4 || i == 6 || i == 7 || i == 16 || i == 17) {
						test = "선다";
						pstmt.setString(2, test);
					}else if(i == 5 || i == 8 || i == 12 || i == 14 || i== 15 ||i ==18 || i ==19){
						test = "선택";
						pstmt.setString(2, test);
					}
					pstmt.setString(3, list.get((i-1)));
					pstmt.setString(4, "Q"+i);

					result = pstmt.executeUpdate();

				}




			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}


		return result;
	}

}
