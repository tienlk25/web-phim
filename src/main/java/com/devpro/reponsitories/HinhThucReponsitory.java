package com.devpro.reponsitories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.entities.HinhThuc;

@Repository
public interface HinhThucReponsitory extends JpaRepository<HinhThuc, Integer>{

}
