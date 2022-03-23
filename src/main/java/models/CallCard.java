package models;

import java.io.Serializable;
import java.util.List;

public class CallCard implements Serializable {
	private int callCardId;
	private String borrowingDate, dueDate;
	private int libcardId;
	private int librarianId;

	public CallCard(int callCardId, String borrowingDate, String dueDate, int libcardId, int librarianId) {

		this.callCardId = callCardId;
		this.borrowingDate = borrowingDate;
		this.dueDate = dueDate;
		this.libcardId = libcardId;
		this.librarianId = librarianId;
	}

	
	public int getCallCardId() {
		return callCardId;
	}
	public void setCallCardId(int callCardId) {
		this.callCardId = callCardId;
	}
	public String getBorrowingDate() {
		return borrowingDate;
	}
	public void setBorrowingDate(String borrowingDate) {
		this.borrowingDate = borrowingDate;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public int getLibcardId() {
		return libcardId;
	}
	public void setLibcardId(int libcardId) {
		this.libcardId = libcardId;
	}
	public int getLibrarianId() {
		return librarianId;
	}
	public void setLibrarianId(int librarianId) {
		this.librarianId = librarianId;
	}
	
	
	
}
