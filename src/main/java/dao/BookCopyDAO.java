package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.Book;
import models.BookCopy;

public class BookCopyDAO extends DAO {

	public BookCopyDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookCopy getAddedBookCopy(int barcode) throws SQLException {
		String sql = "select tblbook.title, tblbookcopy.id, tblbook.id from tblbookcopy inner join tblbook on tblbookcopy.bookId = tblbook.id where tblbookcopy.id = ? and tblbookcopy.available = 1";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, barcode);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			int bookId = rs.getInt("tblbook.id");
			String title = rs.getString("tblbook.title");
			return  new BookCopy(barcode, new Book(bookId,title));
		}
		return null;
	}	
}
