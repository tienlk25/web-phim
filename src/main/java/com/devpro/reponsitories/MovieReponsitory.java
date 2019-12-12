package com.devpro.reponsitories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.entities.Movie;

@Repository
public interface MovieReponsitory extends JpaRepository<Movie, Integer>{
	
}
