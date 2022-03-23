package models;

import java.io.Serializable;

public class BorrowingTurn implements Serializable{
	private int bookcopyId, callcardId;
	private String title, borrowingDate, dueDate;
	public BorrowingTurn(int bookcopyId, int callcardId, String title, String borrowingDate, String dueDate) {
		super();
		this.bookcopyId = bookcopyId;
		this.callcardId = callcardId;
		this.title = title;
		this.borrowingDate = borrowingDate;
		this.dueDate = dueDate;
	}
	public int getBookcopyId() {
		return bookcopyId;
	}
	public void setBookcopyId(int bookcopyId) {
		this.bookcopyId = bookcopyId;
	}
	public int getCallcardId() {
		return callcardId;
	}
	public void setCallcardId(int callcardId) {
		this.callcardId = callcardId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getborrowingDate() {
		return borrowingDate;
	}
	public void setborrowingDate(String borrowingDate) {
		this.borrowingDate = borrowingDate;
	}
	public String getdueDate() {
		return dueDate;
	}
	public void setdueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	
	
}
