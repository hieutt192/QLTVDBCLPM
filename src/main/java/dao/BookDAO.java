	package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Book;

public class BookDAO extends DAO{

	public BookDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public List<Book> findBooK(String input) throws SQLException{
		List bookList = new ArrayList<Book>();
		String sql = "SELECT * FROM tblbook WHERE title = ? or author = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, input);
		st.setString(2, input);
		ResultSet rs = st.executeQuery();
		
		while (rs.next()) {
			int id = rs.getInt("id");
			String title = rs.getString("title");
			String author = rs.getString("author");
			String genres = rs.getString("genres");
			String des = rs.getString("description");
			String img = rs.getString("img");
			bookList.add(new Book(id, title, author, genres, des,img));
		}
		return bookList;
	}
	
	public Object[] getBookDetails(int bookId) throws SQLException {
		String sql = "SELECT * FROM tblbook WHERE id = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, bookId);
		ResultSet rs = st.executeQuery();
		Book book = null;
		while (rs.next()) {
			int id = rs.getInt("id");
			String title = rs.getString("title");
			String author = rs.getString("author");
			String genres = rs.getString("genres");
			String des = rs.getString("description");
			String img = rs.getString("img");
			book = new Book(id, title, author, genres, des, img);
		}
		
		sql = "SELECT * FROM tblbookcopy WHERE bookId = ? and available = 1";
		st = con.prepareStatement(sql);
		st.setInt(1, book.getId());
		rs = st.executeQuery();
		int count = 0;
		while (rs.next()) {
			count += rs.getInt("status");
		}
		
		Object[] res = {book, count};
	
		return res;
		
	}
}
