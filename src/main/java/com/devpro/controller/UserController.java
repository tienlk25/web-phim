package com.devpro.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.OkHttp3ClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.devpro.ListFavorite;
import com.devpro.Services.PostService;
import com.devpro.entities.FavoriteMovies;
import com.devpro.entities.Movie;
import com.devpro.entities.RestResponse;

import com.devpro.reponsitories.MovieReponsitory;
import com.devpro.reponsitories.SignupReponsitory;

/*
 * Để viết Rest - API dùng @RestController
 * */

@RestController
@RequestMapping("/rest/api")
public class UserController {
	/*
	 * API khác với controller thường API trả về data(json, xml, string, number).
	 * 
	 * @Requestbody của spring mapping dữ leieuj người dùng đay lên với model.
	 */
	@Autowired PostService postService;
	
	@Autowired SignupReponsitory signupReponsitory;
	
	@Autowired EntityManager entityManager;

	
	@Autowired MovieReponsitory movieReponsitory;
	
	@PostMapping(value = "/user/delete")
	public ResponseEntity<RestResponse> deleteUser(@RequestBody final Map<String, Object> data, final ModelMap model, 
			final HttpServletRequest request, final HttpServletResponse response){
		Integer entityId = (Integer) data.get("entityId");
		signupReponsitory.deleteById(entityId);
		
		
		return ResponseEntity.ok(RestResponse.success("Bạn đã xoá thành công"));
	}
	
	@PostMapping(value = "/listFavourite/add")
	public ResponseEntity<RestResponse> addToCart(@RequestBody final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		Integer movieId = (Integer) data.get("movieId");
		Movie movie = postService.movieRepository.getOne(movieId);
		System.out.println(movie.getTen() + "==================================================");
		ListFavorite.checkList(movie, request);
		return ResponseEntity.ok(RestResponse.success("Bạn đã thêm thành công "));
	}
	
	@PostMapping(value = "/listFavourite/delete")
	public ResponseEntity<RestResponse> removeFavourite(@RequestBody final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		Integer movieId = (Integer) data.get("movieId");
		Movie movie = postService.movieRepository.getOne(movieId);
		
		System.out.println(movie.getTen() + "==================================================");
		ListFavorite.deleteMovie(movie, request);
		return ResponseEntity.ok(RestResponse.success("Bạn đã xoá thành công"));
	}
	
	@PostMapping(value = "/movie/delete")
	public ResponseEntity<RestResponse> removeMovie(@RequestBody final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		Integer entityId = (Integer) data.get("entityId");
		movieReponsitory.deleteById(entityId);
		
		return ResponseEntity.ok(RestResponse.success("Bạn đã xoá thành công"));
	}
	
	//lưu phim yêu thích vào database
//	@PostMapping(value = "/add-favourite")
//	public ResponseEntity<RestResponse> addToFavourite(@RequestBody final Map<String, Object> data, final ModelMap model,
//			final HttpServletRequest request, final HttpServletResponse response) {
//		Integer movieId = (Integer) data.get("movieId");
//		Movie movie = postService.movieRepository.getOne(movieId);
//		
//		System.out.println(movie.getTen() + "==================================================");
//		try {
//			FavoriteMovies favoriteMovies = new FavoriteMovies();
//			favoriteMovies.setMovieId(movie.getId());
//			favoriteMovies.setCategoryId(movie.getCategory().getTheloaiID());
//			favoriteMovies.setImages(movie.getImages());
//			favoriteMovies.setName(movie.getTen());
//			
//			favourite.save(favoriteMovies);
//			return ResponseEntity.ok(RestResponse.success("Bạn đã add thành công "));
//		} catch (Exception e) {
//			return ResponseEntity.ok(RestResponse.failed("phim da thich "));
//			
//		}
//	}
	
	
	
	@PostMapping(value = "/user/register")
	public ResponseEntity<RestResponse> register(@RequestBody final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		String email = (String) data.get("email");
		if (!email.contains("@")) {
			return ResponseEntity.ok(RestResponse.failed("Email chưa đúng định dạng!"));
		}
		
		return ResponseEntity.ok(RestResponse.success("Bạn đã đăng kí thành công"));
	}
	
	

    @GetMapping(value = "/search")
    public List<Movie> fullTextSearch(@RequestParam(value = "search") String searchKey) {
        FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(entityManager);

        QueryBuilder queryBuilder = fullTextEntityManager.getSearchFactory()
                .buildQueryBuilder()
                .forEntity(Movie.class)
                .get();

        org.apache.lucene.search.Query query = queryBuilder
                .keyword()
                .onFields("title", "series","ten","daoDien","description")
                .matching(searchKey)
                .createQuery();

        org.hibernate.search.jpa.FullTextQuery jpaQuery
                = fullTextEntityManager.createFullTextQuery(query, Movie.class);

        return jpaQuery.getResultList();
    }
}
