package com.devpro.Services;

import java.util.List;

import javax.persistence.PersistenceContext;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devpro.entities.FavoriteMovies;
import com.devpro.entities.Movie;
import com.devpro.reponsitories.MovieReponsitory;

@Service
public class PostService {
	@Autowired
	public MovieReponsitory movieRepository;
	@PersistenceContext
	EntityManager entityManager;

//	private static int LIMIT = 1;// mỗi trang có 1 dữ liệu

	@SuppressWarnings("unchecked")
	public List<Movie> searchCategory(Integer categoryId, Integer pageNumber) {

		String jpql = "select p from Movie p where 1=1"; // JPQL: lấy tất cả Post trong db.
		if (categoryId != null) {
			jpql += " and p.category.id=" + categoryId; // select p from Post p where 1=1 and p.category.id=1
		}

		Query query = (Query) entityManager.createQuery(jpql, Movie.class);
		
//       Phân trang.
//		 query.setFirstResult((pageNumber-1) * LIMIT); 
//		 query.setMaxResults(LIMIT);

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Movie> searchCountry(Integer countryId, Integer pageNumber) {

		String jpql = "select p from Movie p where 1=1"; // JPQL: lấy tất cả Post trong db.
		if (countryId != null) {
			jpql += " and p.country.id=" + countryId; // select p from Post p where 1=1 and p.category.id=1
		}

		Query query = (Query) entityManager.createQuery(jpql, Movie.class);

		// Phân trang.
//		 query.setFirstResult((pageNumber-1) * LIMIT); 
//		 query.setMaxResults(LIMIT);

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Movie> searchHinhthuc(Integer hinhthucId, Integer pageNumber) {

		String jpql = "select p from Movie p where 1=1"; // JPQL: lấy tất cả Post trong db.
		if (hinhthucId != null) {
			jpql += " and p.hinhThuc.id=" + hinhthucId; // select p from Post p where 1=1 and p.category.id=1
		}

		Query query = (Query) entityManager.createQuery(jpql, Movie.class);

		// Phân trang.
//		 query.setFirstResult((pageNumber-1) * LIMIT); 
//		 query.setMaxResults(LIMIT);

		return query.getResultList();
	}


//	public List<FavoriteMovies> searchFavourite(Integer categoryId, Integer pageNumber) {
//
//		String jpql = "select p from Movie p where 1=1"; // JPQL: lấy tất cả Post trong db.
//		if (categoryId != null) {
//			jpql += " and p.category.id=" + categoryId; // select p from Post p where 1=1 and p.category.id=1
//		}
//
//		Query query = (Query) entityManager.createQuery(jpql, Movie.class);
//
//		// Phân trang.
////		 query.setFirstResult((pageNumber-1) * LIMIT); 
////		 query.setMaxResults(LIMIT);
//
//		return query.getResultList();
//	}

	@SuppressWarnings("unchecked")
	public List<Movie> searchWithNativeSQL() {
		String jpql = "select p.* from Movie p where p.status = 1"; // SQL
		Query query = (Query) entityManager.createNativeQuery(jpql, Movie.class);
		return query.getResultList();
	}
	
	
}
