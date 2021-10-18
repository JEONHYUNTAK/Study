package kr.co.megait.service;

import java.sql.SQLException;
import java.util.LinkedHashMap;

import kr.co.megait.dao.LoginDao;
import kr.co.megait.dao.LoginDaoImpl;
import kr.co.megait.model.Login;


public class LoginServiceImpl implements LoginService{
	
	private LoginDao loginDao;
	
	public LoginServiceImpl() {
		loginDao = new LoginDaoImpl();
	}

	@Override
	public void LoginServiceInsert(Login login) throws SQLException {
		loginDao.LoginInsert(login);
	}

	@Override
	public LinkedHashMap LoginServiceList() throws SQLException {
		
		LinkedHashMap login_list = new LinkedHashMap();
		login_list = loginDao.LoginList();
		
		return login_list;

	}


}
