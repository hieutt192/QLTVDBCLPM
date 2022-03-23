package models;

import java.io.Serializable;
import java.util.List;

public class Book implements Serializable {
	private int id;
	private String title, author, genres, description, img = null;
//	private List<BookBill> importingBillList;
	
	public Book(int id, String title) {
		this.id = id;
		this.title = title;
	}
	
	public Book(int id, String title, String author, String genres, String des, String img) {
		this.id = id;
		this.title = title;
		this.author = author;
		this.genres = genres;
		this.description = des;
		this.img = img;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getGenres() {
		return genres;
	}

	public void setGenres(String genres) {
		this.genres = genres;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
