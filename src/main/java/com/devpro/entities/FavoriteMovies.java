package com.devpro.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//@Entity
//@Table(name = "favorite_movie")
public class FavoriteMovies {
	
//	@Id
//	@Column(name = "movie_id")
	private Integer movieId;
//	@Column(name = "name")
	private String name;
	
//	@Column(name = "category_id")
	private Integer categoryId;
	
	private String description;
	
	private String title;
	
//	@OneToMany(cascade = CascadeType.ALL,mappedBy = "movie",fetch = FetchType.EAGER)
	private List<Image> images;	
	
	public List<Image> getImages() {
		return images;
	}
	public void setImages(List<Image> images) {
		this.images = images;
	}
	public Integer getMovieId() {
		return movieId;
	}
	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
