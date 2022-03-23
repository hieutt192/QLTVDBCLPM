package models;

public class CallCardItem {
	private static int id = 0;
	private int callCardId, bookCopyId;
	private String timeStamp;
	
	
	
	public static int generateId() {
		id ++;
		return id;
	}



	public CallCardItem(int callCardId, int bookCopyId) {
		super();
		this.callCardId = callCardId;
		this.bookCopyId = bookCopyId;
	}
	
}
