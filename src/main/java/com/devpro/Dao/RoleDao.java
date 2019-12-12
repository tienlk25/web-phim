package com.devpro.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



//@Repository
//public class RoleDao {
//	@Autowired
//	private EntityManager entityManager;
//	
//	public List<String> getRoleName(Integer userId) {
//		
//		String jpql = "Select ur.role.roleName from " + UserRole.class.getName() + "ur" + "where ur.user.id =: userId"; 
//		Query query = this.entityManager.createQuery(jpql, String.class);
//		query.setParameter("id", userId);
//		return query.getResultList();
//	}
//
//}
