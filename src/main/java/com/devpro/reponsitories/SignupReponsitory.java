package com.devpro.reponsitories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.entities.User;

@Repository
public interface SignupReponsitory extends JpaRepository<User, Integer> {

}
