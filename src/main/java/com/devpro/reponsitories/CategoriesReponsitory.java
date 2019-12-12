package com.devpro.reponsitories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import com.devpro.entities.Category;

@Repository
public interface CategoriesReponsitory extends JpaRepository<Category, Integer> {

}
