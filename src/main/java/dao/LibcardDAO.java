package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LibcardDAO extends DAO {
	public LibcardDAO() throws SQLException {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public boolean checkValidLibCardId(int libCardId) throws SQLException {
		String sql = "select * from tbllibcard where id = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, libCardId);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			return true;
		}
		return false;
		
	}
}
