package com.devpro.Services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;



//@Service
//public class UserDetailsServiceImpl implements UserDetailsService{
//
//	@Autowired UserDao UserDao;
//	
//	@Autowired RoleDao roleDao;
//	
//	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		com.devpro.entities.User user = this.UserDao.findUserAccount(username);
//		
//		if(user == null) {
//			System.out.println("User not found! "+ username);
//			throw new UsernameNotFoundException("User "+ username + "was not found in the database ");
//		}
//		
//		System.out.println("Found User: " + user);
//		
//		//[Role_user, Role_Admin,..]
//		List<String> roleName= this.roleDao.getRoleName(user.getId());
//		
//		List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
//		
//		if(roleName != null) {
//			for (String role: roleName) {
//				GrantedAuthority authority = new SimpleGrantedAuthority(role);
//				grantList.add(authority);
//			}
//		}
//		
//		UserDetails userDetails = new User(user.getEmail(),user.getPassword(), grantList );
//		
//		return null;
//	}
//
//}
