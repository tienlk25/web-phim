package com.devpro.controller.admin;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.entities.Image;
import com.devpro.entities.Movie;
import com.devpro.entities.User;
import com.devpro.entities.Video;
import com.devpro.reponsitories.CategoriesReponsitory;
import com.devpro.reponsitories.CountryReponsitory;
import com.devpro.reponsitories.HinhThucReponsitory;
import com.devpro.reponsitories.MovieReponsitory;

import javassist.expr.NewArray;


@Controller
public class AdminMovieController {
	
	@Autowired CategoriesReponsitory categoriesReponsitory;
	@Autowired MovieReponsitory movieReponsitory;
	@Autowired CountryReponsitory countryReponsitory;
	@Autowired HinhThucReponsitory hinhThucReponsitory;
	@Value("${file.upload.pathImg}") private String imagePath; 
	@Value("${file.upload.pathVideo}") private String videoPath; 
	
	@RequestMapping(value = {"/admin/add-movie"},method = {RequestMethod.GET})
	public String setMovie(final ModelMap model,final HttpServletRequest request,HttpServletResponse response) {
		
		model.addAttribute("country",countryReponsitory.findAll());
		model.addAttribute("categories",categoriesReponsitory.findAll());
		model.addAttribute("hinhthuc",hinhThucReponsitory.findAll());
		model.addAttribute("movie", new Movie());
		return "admin/add-movie";
	}
	@RequestMapping(value = {"/admin/add-movie"},method = {RequestMethod.POST})
	public String saveMovie(@RequestParam("postImage") MultipartFile postImage,@RequestParam("postVideo") MultipartFile postVideo
			, @ModelAttribute("movie") Movie movie
			, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IllegalStateException, IOException {
	
		if( postImage != null && postImage.getSize() > 0 ) {
			Image image = new Image();
			image.setName(postImage.getOriginalFilename());
			image.setMime(postImage.getContentType());
			image.setImagePath(imagePath);			
			movie.addImage(image);
			
			// lưu file vào folder trên server.
			// E:/eclipse-workspace/java-web-devpro-001/java-web-001/upload/abc.jpeg
			postImage.transferTo(new File(imagePath + "/" + postImage.getOriginalFilename()));
		}
		if( postVideo != null && postVideo.getSize() > 0 ) {
			Video video = new Video();
			video.setName(postVideo.getOriginalFilename());
			video.setMime(postVideo.getContentType());
			video.setVideoPath(videoPath);			
			movie.addVideo(video);
			
			// lưu file vào folder trên server.
			// E:/eclipse-workspace/java-web-devpro-001/java-web-001/upload/abc.jpeg
			postVideo.transferTo(new File(videoPath + "/" + postVideo.getOriginalFilename()));
		}
		
		
		movieReponsitory.save(movie);
		
		
		return "admin/add-movie";
	}
	
	@RequestMapping(value = {"/admin/list-movie"},method = {RequestMethod.GET})
	public String listMovie(final ModelMap model,final HttpServletRequest request, HttpServletResponse response) {
		List<Movie> listMovies = movieReponsitory.findAll();
	    model.addAttribute("listMovies",listMovies);
	    
		return "admin/list-movie";
	}
	
	@RequestMapping(value = {"/admin/edit-movie/{id}"},method = {RequestMethod.GET})
	public String editMovie(@PathVariable int id, final ModelMap model,final HttpServletRequest request, HttpServletResponse response) {		
		Movie movie = movieReponsitory.getOne(id);
		model.addAttribute("country",countryReponsitory.findAll());
		model.addAttribute("categories",categoriesReponsitory.findAll());
		model.addAttribute("hinhthuc",hinhThucReponsitory.findAll());
		model.addAttribute("movie", movie);	    
		return "admin/edit-movie";
	}	
	
	@RequestMapping(value = {"/admin/edit-movie"}, method = {RequestMethod.POST} )
	public String saveEditMovie(@ModelAttribute("contact") Movie movie,final ModelMap model,final HttpServletRequest request, HttpServletResponse response) {
		// lưu dữ liệu vào database.
		movieReponsitory.save(movie);		
		// trả về thông báo cho người dùng
		model.addAttribute("status","success");
		return listMovie(model, request, response);
	}

}
