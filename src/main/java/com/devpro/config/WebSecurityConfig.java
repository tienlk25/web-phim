package com.devpro.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;



@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Override
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
          .withUser("tien").password(passwordEncoder().encode("123")).roles("USER")
          .and()
          .withUser("user2").password(passwordEncoder().encode("user2Pass")).roles("USER")
          .and()
          .withUser("admin").password(passwordEncoder().encode("adminPass")).roles("ADMIN");
    } 
	
	
    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http
          .csrf().disable()
          .authorizeRequests()
          .antMatchers("/admin/**").hasRole("ADMIN")
          .antMatchers("/*").permitAll()
          .and()
          .formLogin()
          .loginPage("/login")
          .loginProcessingUrl("/perform_login")
          .defaultSuccessUrl("/", true)
          .usernameParameter("uname")
          .passwordParameter("psw")
          //.failureUrl("/login.html?error=true")
//          .failureHandler(authenticationFailureHandler())
          .and()
          .logout()
          .logoutUrl("/logout")
          .logoutSuccessUrl("/")
          .deleteCookies("JSESSIONID");
//          .logoutSuccessHandler(logoutSuccessHandler());
    }
     
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	/*  ================================================ */
//	@Autowired
//	private UserDetailsServiceImpl userDetailsService; // kiểm tra user có trong database
//	
//	
//	/*
//	 * mã hoá password
//	 * */
//	@Bean 
//	public BCryptPasswordEncoder passwordEncoder() {
//		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
//		return bCryptPasswordEncoder;
//	}
//	
//	@Autowired
//	public void ConfigureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//		// sét dặt dịch vụ để tìm kiếm user trong database.
//		// và set đặt password encoder
//		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());	
//	}
//	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		
//		super.configure(http);
//		http.csrf().disable();
//		
//		// các trang yêu cầu login
//		http.authorizeRequests().antMatchers("/","/login").permitAll();
//		
//		//trang /userInfo yêu cầu login với vai trò của user hoặc admin
//		//nếu chưa login nó sẽ redirect tới trang login
//		http.authorizeRequests().antMatchers("/userInfo","/cart/checkout").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");
//		
//		//trang chỉ danh cho admin
//		http.authorizeRequests().antMatchers("/admin").access("hasAnyRole('ROLE_ADMIN')");
//		
//		//khi người dùng đã login, với vai trò của role_user
//		//nhưng truy cập vào vai trò admin
//		// thì một ngoại lệ sẽ ném ra.
//		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
//		
//		//cấu hình cho login form 
//		http.authorizeRequests().and().formLogin()
//		           //Submit url của trang login
//		          .loginPage("/login")
//		          .defaultSuccessUrl("/signup")//dường dẫn tới trang đăng nhập thành công
//		          .failureUrl("/login?error = true")// dường dẫn tới trang đăng nhâph thất bại
//		          .usernameParameter("username")
//		          .passwordParameter("password")
//		          
//		          
//		          //cấu hình chó logout page
//		          .and().logout().logoutUrl("/logout").logoutSuccessUrl("logoutSuccessful");
//	}
//	
}
