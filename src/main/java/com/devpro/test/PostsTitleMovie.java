package com.devpro.test;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.ui.context.Theme;

public class PostsTitleMovie {
	
	
	private String title;
	private String imagePath;
	private String quocGia;
	private String daoDien;
	private Date ngayPhatHanh;
	
	
	

	public PostsTitleMovie(String title, String imagePath) {
		super();
		this.title = title;
		this.imagePath = imagePath;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}




	public String getImagePath() {
		return imagePath;
	}




	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}



	public static List<PostsTitleMovie> getPosts(){
		List<PostsTitleMovie> titleMovies = new ArrayList<PostsTitleMovie>();
		
		titleMovies.add(new PostsTitleMovie("The Hobbit: The Desolation of Smaug","img/hobbit-2.jpg"));
		titleMovies.add(new PostsTitleMovie("Natra: ma rồng giáng thé", "img/natra.jpg"));
		titleMovies.add(new PostsTitleMovie("The dark knight", "img/the-dark-knight.jpg"));
		titleMovies.add(new PostsTitleMovie("The Godfather", "img/the-god-father.jpg"));
		titleMovies.add(new PostsTitleMovie("Spider-man","img/spider-man-2.jpg"));
		titleMovies.add(new PostsTitleMovie("Natra", "img/Lord-Of-The-Ring3.jpg"));
		titleMovies.add(new PostsTitleMovie("Up", "img/up.jpg"));
		titleMovies.add(new PostsTitleMovie("Upr", "img/up.jpg"));
		
		return titleMovies;
	}
}
