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
@Table(name = "country")
public class Country {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
    @Column(name = "country_id	")
	private Integer countryId;
	
	@Column(name = "country", length = 11,nullable = false)
	private String name;
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "country",fetch = FetchType.LAZY)
	private List<Movie> movies = new ArrayList<Movie>();

	public List<Movie> getMovies() {
		return movies;
	}

	public void setMovies(List<Movie> movies) {
		this.movies = movies;
	}
	
	public Integer getCountryId() {
		return countryId;
	}

	public void setCountryId(Integer countryId) {
		this.countryId = countryId;
	}

	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void addMovie(Movie movie) {
		movies.add(movie);
		movie.setCountry(this);
	}
	public void removeMovie(Movie movie) {
		movies.remove(movie);
		movie.setCountry(null);
	}
	
}
