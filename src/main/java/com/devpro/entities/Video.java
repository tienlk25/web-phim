package com.devpro.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "video")
public class Video {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto-increment.
	@Column(name = "video_id")
	private Integer id;
	
	@Column(name = "videopath")
	private String videoPath;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "mime")
	private String mime;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "movie_id")
	private Movie movies;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getVideoPath() {
		return videoPath;
	}

	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMime() {
		return mime;
	}

	public void setMime(String mime) {
		this.mime = mime;
	}

	public Movie getMovie() {
		return movies;
	}

	public void setMovie(Movie movie) {
		this.movies = movie;
	}
	
	
	
}
