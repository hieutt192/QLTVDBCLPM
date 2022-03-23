package models;

import java.io.Serializable;

public class BookCopy implements Serializable {
	private int barcode;
	private boolean available;
	private String purchasingDate = null;
	private Book bookInfo = null;
	
	public BookCopy(int barcode, Book book) {
		this.barcode = barcode;
		this.bookInfo = book;
	}

	public int getBarcode() {
		return barcode;
	}

	public void setBarcode(int barcode) {
		this.barcode = barcode;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public String getPurchasingDate() {
		return purchasingDate;
	}

	public void setPurchasingDate(String purchasingDate) {
		this.purchasingDate = purchasingDate;
	}

	public Book getBookInfo() {
		return bookInfo;
	}

	public void setBookInfo(Book bookInfo) {
		this.bookInfo = bookInfo;
	}
}
