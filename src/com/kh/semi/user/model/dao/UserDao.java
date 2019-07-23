package com.kh.semi.user.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.user.controller.LoginServlet;
import com.kh.semi.user.model.vo.User;

public class UserDao {

	private Properties prop = new Properties();

	public UserDao() {
		String file = UserDao.class.getResource("/sql/user/user-query.properties").getPath();
		try {
			prop.load(new FileReader(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public int checkStatus(Connection con, User reqUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("loginCheck");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqUser.getUserId());
			pstmt.setString(2, "가입");
			pstmt.setString(3, "자체");

			rset = pstmt.executeQuery();

			String userId = "";
			String password = "";

			if(rset.next()) {
				userId = rset.getString("USER_ID");
				password = rset.getString("USER_PWD");
			}
			if(reqUser.getUserId().equals(userId) && reqUser.getUserPwd().equals(password)) {
				result = LoginServlet.LOGIN_OK;
			}else if(reqUser.getUserId().equals(userId) && !reqUser.getUserPwd().equals(password)) {
				result = LoginServlet.WRONG_PASSWORD;
			}else {
				result = LoginServlet.EXIT_NOT_MEMBER;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public User selectOne(Connection con, User reqUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User loginUser = null;

		String query = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqUser.getUserId());
			pstmt.setString(2, reqUser.getUserPwd());

			rset = pstmt.executeQuery();

			if(rset.next()) {
				loginUser = new User();
				loginUser.setUserNo(rset.getInt("USER_NO"));
				loginUser.setUserId(rset.getString("USER_ID"));
				loginUser.setUserNm(rset.getString("USER_NM"));
				loginUser.setNickNm(rset.getString("NICK_NM"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setUserHb(rset.getDate("USER_HB"));
				loginUser.setGender(rset.getString("GENDER"));
				loginUser.setAddress(rset.getString("ADDRESS"));
				loginUser.setDogYn(rset.getString("DOG_YN"));
				loginUser.setEnrollDt(rset.getDate("ENROLL_DT"));
				loginUser.setLeaveDt(rset.getDate("LEAVE_DT"));
				loginUser.setUserSit(rset.getString("USER_SIT"));
				loginUser.setUserKind(rset.getString("USER_KIND"));
				loginUser.setUserPwd(rset.getString("USER_PWD"));
				loginUser.setRtCd(rset.getString("RT_CD"));
				loginUser.setLeaveRsCd(rset.getString("LEAVE_RS_CD"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}


		return loginUser;
	}

	public int signupUser(Connection con, User ur) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("Join");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, ur.getUserId());
			pstmt.setString(2, ur.getUserNm());
			pstmt.setString(3, ur.getNickNm());
			pstmt.setString(4, ur.getEmail());
			pstmt.setDate(5, ur.getUserHb());
			pstmt.setString(6, ur.getGender());
			pstmt.setString(7, ur.getAddress());
			pstmt.setString(8, ur.getDogYn());
			pstmt.setString(9, "가입");
			pstmt.setString(10, "자체");
			pstmt.setString(11, ur.getUserPwd());
			pstmt.setString(12, ur.getRtCd());





			result = pstmt.executeUpdate();

			System.out.println(result);



		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}




		return result;
	}

	public int updateUser(Connection con, User u) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateUser");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, u.getNickNm());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getAddress());
			pstmt.setString(4, u.getDogYn());
			pstmt.setInt(5, u.getUserNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}


		return result;
	}

	public User updateSelect(Connection con, User u) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User loginUser = null;

		String query = prop.getProperty("updateSelect");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, u.getUserNo());

			rset = pstmt.executeQuery();

			if(rset.next()) {
				loginUser = new User();
				loginUser.setUserNo(rset.getInt("USER_NO"));
				loginUser.setUserId(rset.getString("USER_ID"));
				loginUser.setUserNm(rset.getString("USER_NM"));
				loginUser.setNickNm(rset.getString("NICK_NM"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setUserHb(rset.getDate("USER_HB"));
				loginUser.setGender(rset.getString("GENDER"));
				loginUser.setAddress(rset.getString("ADDRESS"));
				loginUser.setDogYn(rset.getString("DOG_YN"));
				loginUser.setEnrollDt(rset.getDate("ENROLL_DT"));
				loginUser.setLeaveDt(rset.getDate("LEAVE_DT"));
				loginUser.setUserSit(rset.getString("USER_SIT"));
				loginUser.setUserKind(rset.getString("USER_KIND"));
				loginUser.setUserPwd(rset.getString("USER_PWD"));
				loginUser.setRtCd(rset.getString("RT_CD"));
				loginUser.setLeaveRsCd(rset.getString("LEAVE_RS_CD"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return loginUser;
	}

public ArrayList<User> selectList(Connection con, int currentPage, int limit) {
	
		ArrayList<User> list=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;

		String query = prop.getProperty("selectListUserPaging");

		System.out.println("dao 호출..");

		try {
			pstmt=con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();


			list =  new ArrayList<>();

			while(rset.next()) {

				User u = new User();

				u.setUserNo(rset.getInt("USER_NO"));
				u.setUserId(rset.getString("USER_ID"));
				u.setUserNm(rset.getString("USER_NM"));
				u.setNickNm(rset.getString("NICK_NM"));
				u.setUserHb(rset.getDate("USER_HB"));
				u.setUserSit(rset.getString("USER_SIT"));
				u.setEnrollDt(rset.getDate("ENROLL_DT"));
				
				u.setGender(rset.getString("GENDER"));
				u.setEmail(rset.getString("EMAIL"));
				u.setPhone(rset.getString("PHONE"));

		       list.add(u);

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

public int secessionUser(Connection con, String leaveRsCd, int userNo) {
	PreparedStatement pstmt = null;
	int result = 0;

	System.out.println(leaveRsCd);
	System.out.println(userNo);

	String query = prop.getProperty("secessionUser");

	try {
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, leaveRsCd);
		pstmt.setInt(2, userNo);

		result = pstmt.executeUpdate();

	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}


	return result;
}

public int deleteUser(Connection con, int userNo) {

	PreparedStatement pstmt = null;
	int result = 0;

	String query = prop.getProperty("deleteUser");

	try {
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, "탈퇴");
		pstmt.setInt(2,userNo);
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		close(pstmt);
	}

	return result;
}

public int modifyUser(Connection con, User ur) {

	PreparedStatement pstmt = null;
	int result = 0;

	String query = prop.getProperty("modifyUser");

	try {
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, ur.getNickNm());
		pstmt.setString(2, ur.getEmail());
		pstmt.setDate(3, ur.getUserHb());
		pstmt.setString(4, ur.getAddress());
		pstmt.setString(5, ur.getDogYn());
		pstmt.setString(6, ur.getUserId());

		result=pstmt.executeUpdate();


	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(pstmt);
	}

	return result;

}

public User getUser(Connection con, String userId) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    User user = null;

    String query = prop.getProperty("getUser");

    try {
       pstmt = con.prepareStatement(query);
       pstmt.setString(1, userId);

       rset = pstmt.executeQuery();

       if (rset.next()) {
          user = new User();
          user.setUserNo(rset.getInt("USER_NO"));
          user.setUserId(rset.getString("USER_ID"));
          user.setUserNm(rset.getString("USER_NM"));
          user.setNickNm(rset.getString("NICK_NM"));
          user.setEmail(rset.getString("EMAIL"));
          user.setPhone(rset.getString("PHONE"));
          user.setUserHb(rset.getDate("USER_HB"));
          user.setGender(rset.getString("GENDER"));
          user.setAddress(rset.getString("ADDRESS"));
          user.setDogYn(rset.getString("DOG_YN"));
          user.setEnrollDt(rset.getDate("ENROLL_DT"));
          user.setLeaveDt(rset.getDate("LEAVE_DT"));
          user.setUserSit(rset.getString("USER_SIT"));
          user.setUserKind(rset.getString("USER_KIND"));
          user.setUserPwd(rset.getString("USER_PWD"));
          user.setRtCd(rset.getString("RT_CD"));
          user.setLeaveRsCd(rset.getString("LEAVE_RS_CD"));

       }
    } catch (SQLException e) {
       e.printStackTrace();
    } finally {
       close(rset);
       close(pstmt);
    }

    return user;
 }

public int getListCount(Connection con) {
	Statement stmt = null;
	int listCount = 0;
	ResultSet rset = null;
	
	String query = prop.getProperty("selectListUserCount");
	
	
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



}
