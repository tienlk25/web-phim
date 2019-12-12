package com.devpro.entities;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Store;
import org.hibernate.search.annotations.TermVector;

@Entity
@Table(name = "phim")
@Indexed
public class Movie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto-increment.
	@Column(name = "phim_id")
	private Integer id;
	@Column(name = "ten", length = 32, nullable = false)
	private String ten;

	@Column(name = "movie_video", length = 255, nullable = true)
	private String movieVideo;	
	
	@Column(name = "daodien", length = 45, nullable = true)
	private String daoDien;
	
	@Column(name = "ngayphathanh" ,nullable = true)
	private String ngayPhatHanh;
	
	@Column(name = "thoiluong", nullable = true)
	private Integer thoiLuong;
	
	public String getNgayPhatHanh() {
		return ngayPhatHanh;
	}

	public void setNgayPhatHanh(String ngayPhatHanh) {
		this.ngayPhatHanh = ngayPhatHanh;
	}

	@Column(name = "series", nullable = false)
	private String series;
	
	public String getSeries() {
		return series;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	@Column(name = "imdb", length = 10, nullable = false)
	private float imdb;
	
	
	
//	@Column(name = "theloai_id", nullable = false)
//	private Integer theloai;
//  detail
	
	@Column(name =  "title", nullable = false)
	private String title;
	
	@Field(termVector = TermVector.YES, analyze=Analyze.YES, store=Store.NO)
	@Column(name = "description", length = 2000, nullable = false)
	private String description;
	 //@lob dành cho kiểu dữ liệu nhiều như text
	@Lob
	@Column(name = "details", nullable = false, columnDefinition = "text")
	private String details;
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	

	//cot category
	@ManyToOne(fetch = FetchType.EAGER) // bảng con
	@JoinColumn(name = "category_id") //
	private Category category; // thằng mappedBy trỏ đến đây thay cho thể loai
	// failed to lazily initialize --------------------------------------------- Lỗi
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "movie",fetch = FetchType.EAGER)
	private List<Image> images = new ArrayList<Image>();
	
	public void addImage(Image image) {
		images.add(image);
		image.setMovie(this);
	}

	public void removeImage(Image image) {
	    images.remove(image);
		image.setMovie(null);
	}
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "movies",fetch = FetchType.LAZY)
	private List<Video> videos = new ArrayList<Video>();
	
	public void addVideo(Video video) {
		videos.add(video);
		video.setMovie(this);
	}

	public void removeVideo(Video video) {
	    videos.remove(video);
		video.setMovie(null);
	}
	
	@ManyToOne(fetch = FetchType.EAGER) // bảng con
	@JoinColumn(name = "country_id") //
	private Country country;  // thằng mappedBy trỏ đến đây thay cho thể loai
	
	@ManyToOne(fetch = FetchType.EAGER) // bảng con
	@JoinColumn(name = "hinhthuc_id") //
	private HinhThuc hinhThuc;
	
	
	public HinhThuc getHinhThuc() {
		return hinhThuc;
	}

	public void setHinhThuc(HinhThuc hinhThuc) {
		this.hinhThuc = hinhThuc;
	}

	public Country getCountry() {
		return country;
	}
	
	public void setCountry(Country country) {
		this.country = country;
	}

	// tạm thời để ngày phát hành thành String
//	public Date getNgayPhatHanh() {
//		return ngayPhatHanh;
//	}
//
//	public void setNgayPhatHanh(Date ngayPhatHanh) {
//		this.ngayPhatHanh = ngayPhatHanh;
//	}

	public String getDescription() {
		return description;
	}

	public Integer getThoiLuong() {
		return thoiLuong;
	}

	public void setThoiLuong(Integer thoiLuong) {
		this.thoiLuong = thoiLuong;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getMovieVideo() {
		return movieVideo;
	}

	public void setMovieVideo(String movieVideo) {
		this.movieVideo = movieVideo;
	}

	public String getDaoDien() {
		return daoDien;
	}

	public void setDaoDien(String daoDien) {
		this.daoDien = daoDien;
	}

	public float getImdb() {
		return imdb;
	}

	public void setImdb(float imdb) {
		this.imdb = imdb;
	}

	

}
