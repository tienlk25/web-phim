package com.devpro.entities;

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
@Table(name = "hinhthuc")
public class HinhThuc {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name = "hinhthuc_id")
	private Integer hinhThucId;
	
	@Column(name ="hinhthuc")
	private String name;
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "hinhThuc",fetch = FetchType.LAZY)
	private List<Movie> movies = new ArrayList<Movie>();

	public Integer getHinhThucId() {
		return hinhThucId;
	}

	public void setHinhThucId(Integer hinhThucId) {
		this.hinhThucId = hinhThucId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Movie> getMovies() {
		return movies;
	}

	public void setMovies(List<Movie> movies) {
		this.movies = movies;
	}
	
	public void addMovie(Movie movie) {
		movies.add(movie);
		movie.setHinhThuc(this);
	}
	public void removeMovie(Movie movie) {
		movies.remove(movie);
		movie.setHinhThuc(null);
	}
	
}
