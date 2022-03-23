package models;

import java.io.Serializable;
import java.util.List;

public class CallCardDetail implements Serializable {
	private CallCard callcard;
	private List<BookCopy> borrowingBooks;
	public CallCardDetail(CallCard callcard, List<BookCopy> borrowingBooks) {
		super();
		this.callcard = callcard;
		this.borrowingBooks = borrowingBooks;
	}
	public CallCard getCallcard() {
		return callcard;
	}
	public void setCallcard(CallCard callcard) {
		this.callcard = callcard;
	}
	public List<BookCopy> getBorrowingBooks() {
		return borrowingBooks;
	}
	public void setBorrowingBooks(List<BookCopy> borrowingBooks) {
		this.borrowingBooks = borrowingBooks;
	}
	
	
	
}
