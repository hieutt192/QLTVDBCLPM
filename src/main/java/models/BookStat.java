package models;

import java.io.Serializable;

public class BookStat implements Serializable {
	private int borrowedTime, bookId;
	private String title;

	public BookStat(int borrowedTime, int bookId, String title) {
		//super();
		this.borrowedTime = borrowedTime;
		this.bookId = bookId;
		this.title = title;
	}

	public int getBorrowedTime() {
		return borrowedTime;
	}

	public void setBorrowedTime(int borrowedTime) {
		this.borrowedTime = borrowedTime;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
