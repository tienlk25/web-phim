package com.devpro.entities;



import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "categories")
public class Category implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1586518196774047537L;

//	@Id
//	@Column(name = "movie_id")
//	private Integer movieID;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto-increment.
	@Column(name = "category_id")
	private Integer theloaiID;
	
//	@Column(name =  "phim_id")
//	private Integer phimID;
	
	@Column(name = "category" , length = 45, nullable = false)
	private String name;

	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "category", fetch = FetchType.LAZY)
	private List<Movie> movies = new ArrayList<Movie>();
	
	public void addMovie(Movie movie) {
		movies.add(movie);
		movie.setCategory(this);
	}
	public void removeMovie(Movie movie) {
		movies.remove(movie);
		movie.setCategory(null);
	}
	
	public List<Movie> getMovies() {
		return movies;
	}
	public void setMovies(List<Movie> movies) {
		this.movies = movies;
	}
	public Integer getTheloaiID() {
		return theloaiID;
	}

	public void setTheloaiID(Integer theloaiID) {
		this.theloaiID = theloaiID;
	}

//	public Integer getPhimID() {
//		return phimID;
//	}
//
//	public void setPhimID(Integer phimID) {
//		this.phimID = phimID;
//	}

	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
