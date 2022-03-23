package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


import models.BookStat;

public class BookStatDAO extends DAO {

	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public BookStatDAO() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public List<BookStat> getBookStatistic(String startDate, String endDate) throws SQLException, ParseException{
		java.util.Date sDate = sdf.parse(startDate);
		java.util.Date eDate = sdf.parse(endDate);
		List<BookStat> res = new ArrayList<BookStat>();
		String sql = "select tblbook.id as bookId, tblbook.title as title, count(tblbook.id) as \"borrowedTime\" from tblbook inner join(\r\n"
				+ "tblbookcopy inner join(\r\n"
				+ "tblcallcarditem inner join\r\n"
				+ "tblcallcard on tblcallcard.id = tblcallcarditem.callcardId\r\n"
				+ ") on tblbookcopy.id = tblcallcarditem.bookcopyId\r\n"
				+ ") on tblbook.id = tblbookcopy.bookId\r\n"
				+ "where tblcallcard.borrowingDate >= ? and tblcallcard.borrowingDate <= ?\r\n"
				+ "group by tblbook.id;";
		PreparedStatement st = con.prepareStatement(sql);
		st.setDate(1,new Date(sDate.getTime()));
		st.setDate(2,new Date(eDate.getTime()));
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			String title = rs.getString("title");
			int borrowedTime = rs.getInt("borrowedTime");
			int bookId = rs.getInt("bookId");
			res.add(new BookStat(borrowedTime, bookId, title));
		}
		return res;
	}
	
	
	
}
