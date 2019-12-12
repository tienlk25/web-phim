package com.devpro;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.devpro.entities.FavoriteMovies;
import com.devpro.entities.Movie;

public class ListFavorite {
	private ListFavorite() {
	}

	public static Boolean checkExists(Movie movie, HttpServletRequest request) {
		Integer movieId = movie.getId();

		// 1. Lấy danh sách sản phẩm trong giỏ hàng từ SESSIOn.
		List<FavoriteMovies> listMovies = new ArrayList<FavoriteMovies>();
		HttpSession httpSession = request.getSession();
		if (httpSession.getAttribute("listMovie") != null) {
			listMovies = (List<FavoriteMovies>) httpSession.getAttribute("listMovie");
		}
		boolean isExists = true;
		for (FavoriteMovies favoriteMovies : listMovies) {
			if (favoriteMovies.getMovieId() == movieId) {

				isExists = false;
				break;
			}
		}
		return isExists;
	}

	public static void checkList(Movie movie, HttpServletRequest request) {
		Integer movieId = movie.getId();

		// 1. Lấy danh sách sản phẩm trong giỏ hàng từ SESSIOn.
		List<FavoriteMovies> listMovies = new ArrayList<FavoriteMovies>();
		HttpSession httpSession = request.getSession();
		if (httpSession.getAttribute("listMovie") != null) {
			listMovies = (List<FavoriteMovies>) httpSession.getAttribute("listMovie");
		}

		// 2. kiểm tra sản phẩm đã có trong giỏ hàng chưa?
		boolean isExists = false;
		for (FavoriteMovies favoriteMovies : listMovies) {
			if (favoriteMovies.getMovieId() == movieId) {

				isExists = true;
				break;
			}
		}

		System.out.println(isExists);
		// 3.
		if (!isExists) { // nếu chưa có trong giỏ hàng thì thêm mới.
			FavoriteMovies favoriteMovies = new FavoriteMovies();
			favoriteMovies.setMovieId(movieId);
			favoriteMovies.setCategoryId(movie.getCategory().getTheloaiID());
			favoriteMovies.setName(movie.getTen());
			favoriteMovies.setDescription(movie.getDescription());
			favoriteMovies.setTitle(movie.getTitle());
			favoriteMovies.setImages(movie.getImages());
			listMovies.add(favoriteMovies);
		}
		httpSession.setAttribute("listMovie", listMovies);
	}

	public static void deleteMovie(Movie movie, HttpServletRequest request) {
		Integer movieId = movie.getId();

		List<FavoriteMovies> listMovies = new ArrayList<FavoriteMovies>();
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("listMovie") != null) {
			listMovies = (List<FavoriteMovies>) httpSession.getAttribute("listMovie");
		}
		FavoriteMovies movieDelete = null;
		boolean isExists = false;
		for (FavoriteMovies favoriteMovies : listMovies) {
			if (favoriteMovies.getMovieId() == movieId) {
				movieDelete = favoriteMovies;
				isExists = true;
				break;
			}
		}
		if (isExists) {
			listMovies.remove(movieDelete);
		}

		httpSession.setAttribute("listMovie", listMovies);
	}
}
