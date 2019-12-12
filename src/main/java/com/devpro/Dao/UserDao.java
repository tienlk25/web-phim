package com.devpro.Dao;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devpro.entities.User;

//@Repository
//public class UserDao {
//	@Autowired
//	private EntityManager entityManager;
//	
//	public User findUserAccount(String userName) {
//		try {
//			String jpql = "Select p from" + User.class.getName() + "p"
//					+ "Where p.email = :userName";
//			Query query = entityManager.createQuery(jpql, User.class);
//			query.setParameter("email", userName);
//			return (User) query.getSingleResult();
//		} catch (Exception e) {
//			return null;
//		}
//		
//	}
//}
