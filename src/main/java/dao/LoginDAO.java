package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import models.User;

public class LoginDAO extends DAO {

	
	public LoginDAO() throws ClassNotFoundException, SQLException {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User checkUser(String username, String password) throws SQLException {
		String sql = "SELECT * FROM tbluser WHERE username = ? and password = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, username);
		st.setString(2, password);
		ResultSet rs = st.executeQuery();
		SimpleDateFormat sdf = new SimpleDateFormat();
		while (rs.next()) {
	
//			System.out.println(rs.getString("username") + " " + rs.getString("password"));
			int id = rs.getInt("id");
			String userna = rs.getString("username");
			String psw = rs.getString("password");
			String fullname = rs.getString("fullname");

			return new User(id, userna, psw,fullname);
		}
		return null;
	}


	
}
