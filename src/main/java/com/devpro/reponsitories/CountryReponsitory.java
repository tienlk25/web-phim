package com.devpro.reponsitories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.entities.Country;

@Repository
public interface CountryReponsitory extends JpaRepository<Country, Integer>{

}
