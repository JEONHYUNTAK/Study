package kr.co.megait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import kr.co.megait.common.ConnectionDB;
import kr.co.megait.model.Login;


public class LoginDaoImpl implements LoginDao{

	@Override
	public void LoginInsert(Login login) throws SQLException {
		
		//변수 받아서 변수 처리
		int login_idx = login.getLogin_idx();
		int member_idx = login.getMember_idx();
		String login_time = login.getLogin_time();
		String login_check_yn = login.getLogin_check_yn();

		Connection conn = null;
		ConnectionDB connectionDB = new ConnectionDB();
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = connectionDB.YesConnectionDB();
			
			sql = "insert into login(member_idx, login_time, login_check_yn) "
					+ "values (?, now(), ?) ";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_idx);
			pstmt.setString(2, login_check_yn);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			conn.close();
		}

	}

	@Override
	public LinkedHashMap LoginList() throws SQLException {
		Connection conn = null;
		ConnectionDB connectionDB = new ConnectionDB();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		LinkedHashMap login_info = new LinkedHashMap();
		LinkedHashMap login_list = new LinkedHashMap();
		
		try {
			conn = connectionDB.YesConnectionDB();
			sql = "select * from login "
					+ "join member on member.member_idx=login.member_idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				login_info.put("login_idx", rs.getInt("login_idx"));
				login_info.put("member_idx", new Integer( rs.getInt("member_idx") ));
				login_info.put("login_time", new String( rs.getString("login_time") ));
				login_info.put("login_check_yn", new String( rs.getString("login_check_yn") ));

				login_info.put("member_id", new String( rs.getString("member_id") ));
				login_info.put("member_name", new String( rs.getString("member_name") ));
				
				login_list.put( String.valueOf((rs.getInt("login_idx"))), new LinkedHashMap(login_info) );
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		
		
		return login_list;

	}

}
