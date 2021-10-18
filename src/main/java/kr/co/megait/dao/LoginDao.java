package kr.co.megait.dao;

import java.sql.SQLException;
import java.util.LinkedHashMap;

import kr.co.megait.model.Login;


public interface LoginDao {
	
	void LoginInsert(Login login) throws SQLException;
	LinkedHashMap LoginList() throws SQLException;
	
}
