package kr.co.megait.service;

import java.sql.SQLException;
import java.util.LinkedHashMap;

import kr.co.megait.model.Login;


public interface LoginService {

	void LoginServiceInsert(Login login) throws SQLException;
	LinkedHashMap LoginServiceList() throws SQLException;
	
}
