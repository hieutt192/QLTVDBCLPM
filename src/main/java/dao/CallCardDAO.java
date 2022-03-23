package dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import models.*;

public class CallCardDAO extends DAO  {

	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public CallCardDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int generateCallCardId() throws SQLException {
		String sql = "select * from tblcallcard ORDER BY id DESC LIMIT 1";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			return rs.getInt("id") + 1;
		}
		return 1;
	}
	
	
	public void submit(CallCard callcard, List<BookCopy>addedBooks) throws ParseException, SQLException {
		int id = callcard.getCallCardId();
		Date borrowingDate = new Date(sdf.parse(callcard.getBorrowingDate()).getTime());
		Date dueDate = new Date(sdf.parse(callcard.getDueDate()).getTime());
		int libcardId = callcard.getLibcardId();
		int librarianId = callcard.getLibrarianId();
		String sql = "insert into tblcallcard value(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, id);
		st.setDate(2, borrowingDate);
		st.setDate(3, dueDate);
		st.setInt(4, libcardId);
		st.setInt(5, librarianId);
		st.execute();
		
		int callCardItemId = 1;
		
		sql = "select * from tblcallcard ORDER BY id DESC LIMIT 1";
		st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			callCardItemId = rs.getInt("id") + 1;
		}
				
		sql = "insert into tblcallcarditem(tblcallcarditem.id,tblcallcarditem.callCardId,tblcallcarditem.bookCopyId)  value(?,?,?)";
		st = con.prepareStatement(sql);
		for(BookCopy addedBook: addedBooks) {
			st.setInt(1, callCardItemId);
			st.setInt(2, id);
			st.setInt(3, addedBook.getBarcode());
			st.execute();
		}
		sql = "update tblbookcopy set tblbookcopy.available = 0 where tblbookcopy.id = ?";
		st = con.prepareStatement(sql);
		for(BookCopy addedBook: addedBooks) {
			st.setInt(1, addedBook.getBarcode());
			st.execute();
		}
	}
	
	public List<BorrowingTurn> getBorrowList(String startDate, String endDate, int bookId) throws SQLException, ParseException {
		List<BorrowingTurn> borrowList = new ArrayList<BorrowingTurn>();
		String sql = "select tblbook.title, tblbookcopy.id as 'bookcopyId', tblcallcard.borrowingDate, tblcallcard.dueDate, tblcallcard.id as 'callcardId' from tblbook inner join(\r\n"
				+ "tblbookcopy inner join(\r\n"
				+ "tblcallcarditem inner join\r\n"
				+ "tblcallcard on tblcallcard.id = tblcallcarditem.callcardId\r\n"
				+ ") on tblbookcopy.id = tblcallcarditem.bookcopyId\r\n"
				+ ") on tblbook.id = tblbookcopy.bookId\r\n"
				+ "where tblbook.id = ? and tblcallcard.borrowingDate >= ? and tblcallcard.borrowingDate <= ?\r\n"
				+ "";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, bookId);
		st.setDate(2, new Date(sdf.parse(startDate).getTime()));
		st.setDate(3, new Date(sdf.parse(endDate).getTime()));
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			String title = rs.getString("title");
			String borrowingDate = sdf.format(rs.getDate("borrowingDate"));
			String dueDate = sdf.format(rs.getDate("dueDate"));
			int bookcopyId = rs.getInt("bookcopyId");
			int callcardId = rs.getInt("callcardId");
			borrowList.add(new BorrowingTurn(bookcopyId, callcardId, title, borrowingDate, dueDate));
		}
		return borrowList;
	}
	
	public CallCardDetail getCallCardDetail(int callcardId) throws SQLException {
		
		String sql = "select tblbook.title,  tblbookcopy.id as 'bookcopyId', tblbook.id as 'bookId' from tblcallcard inner join(\r\n"
				+ "tblcallcarditem inner join (\r\n"
				+ "tblbookcopy inner join tblbook\r\n"
				+ "on tblbookcopy.bookId = tblbook.id) \r\n"
				+ "on tblcallcarditem.bookcopyId = tblbookcopy.id)\r\n"
				+ "on tblcallcard.id = tblcallcarditem.callcardId\r\n"
				+ "where tblcallcard.id = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1,callcardId);
		ResultSet rs = st.executeQuery();
		List<BookCopy> borrowingBooks = new ArrayList<BookCopy>();
		while (rs.next()) {
			String title = rs.getString("title");
			int bookcopyId = rs.getInt("bookcopyId");
			int bookId = rs.getInt("bookId");
			borrowingBooks.add(new BookCopy(bookcopyId, new Book(bookId, title)));
		}
		
		sql = "select * from tblcallcard where id = ?";
		st = con.prepareStatement(sql);
		st.setInt(1, callcardId);
		rs = st.executeQuery();
		while (rs.next()) {
			int libcardId = rs.getInt("libcardId");
			int librarianId = rs.getInt("librarianId");
			String borrowingDate = sdf.format(rs.getDate("borrowingDate"));
			String dueDate = sdf.format(rs.getDate("dueDate"));
			return new CallCardDetail(new CallCard(callcardId, borrowingDate, dueDate, libcardId, librarianId), borrowingBooks);
		}
		return null;
		
	}
	

}
