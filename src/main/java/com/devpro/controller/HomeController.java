package com.devpro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.ListFavorite;
import com.devpro.Services.PostService;
import com.devpro.entities.Movie;
import com.devpro.entities.User;
import com.devpro.reponsitories.CategoriesReponsitory;
import com.devpro.reponsitories.CountryReponsitory;

import com.devpro.reponsitories.HinhThucReponsitory;
import com.devpro.reponsitories.MovieReponsitory;
import com.devpro.test.PostsTitleMovie;

/*
 * Trang mặc định truy cập website.
 * @author admin
 * */
@Controller
public class HomeController {
	@Autowired
	PostService postService;
	@Autowired CategoriesReponsitory categoriesReponsitory;
	@Autowired MovieReponsitory movieReponsitory;   

	@Autowired CountryReponsitory countryReponsitory;
	@Autowired HinhThucReponsitory hinhThucReponsitory;

	@RequestMapping(value = { "/" }, method = { RequestMethod.GET })
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		
		// để lấy các tham số trên url: ví dụ ?abc=1&edf=2
//		int pageNumber =   Integer.parseInt(request.getParameter("page"));

		// đẩy danh sách posts xuống tầng view thông qua ModelMap.
		// bản chất ModelMap chính là 1 map.
		// mỗi items trong map cần có tên.
//		   model.addAttribute("_posts", TestPost.getPosts());
//		model.addAttribute("_posts", postService.search(null, pageNumber));
		model.addAttribute("_categories", categoriesReponsitory.findAll());
		model.addAttribute("country",countryReponsitory.findAll());
		model.addAttribute("hinhthuc",hinhThucReponsitory.findAll());
		model.addAttribute("_posts", movieReponsitory.findAll());
		return "index";
	}
	
	@RequestMapping(value = {"/category/{categoryId}"}, method = { RequestMethod.GET })
	public String indexWithCategory(@PathVariable int categoryId, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		
		model.addAttribute("_posts", postService.searchCategory(categoryId, null)); //Category
		model.addAttribute("name",categoriesReponsitory.getOne(categoryId));
		model.addAttribute("_categories", categoriesReponsitory.findAll());
		
		model.addAttribute("country",countryReponsitory.findAll());
		model.addAttribute("hinhthuc",hinhThucReponsitory.findAll());
		// trả về tên view.
		return "category";
	}
	
	@RequestMapping(value = { "/country/{countryId}" }, method = { RequestMethod.GET })
	public String indexWithCountry(@PathVariable int countryId, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		
		model.addAttribute("_posts", postService.searchCountry(countryId, null));
		model.addAttribute("name",countryReponsitory.getOne(countryId));
		model.addAttribute("_categories", categoriesReponsitory.findAll());
		model.addAttribute("country",countryReponsitory.findAll());
		model.addAttribute("hinhthuc",hinhThucReponsitory.findAll());
		// trả về tên view.
		return "category";
	}
	
	@RequestMapping(value = { "/hinhthuc/{hinhthucId}" }, method = { RequestMethod.GET })
	public String indexWithHinhthuc(@PathVariable int hinhthucId, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {		
		
		model.addAttribute("_posts", postService.searchHinhthuc(hinhthucId, null));
		model.addAttribute("name",hinhThucReponsitory.getOne(hinhthucId));
		model.addAttribute("_categories", categoriesReponsitory.findAll());
		model.addAttribute("country",countryReponsitory.findAll());
		model.addAttribute("hinhthuc",hinhThucReponsitory.findAll());
		// trả về tên view.
		return "category";
	}

	@RequestMapping(value = { "/details/{postId}" }, method = { RequestMethod.GET })
	public String details(@PathVariable int postId, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		Movie movie = postService.movieRepository.getOne(postId);
		
		model.addAttribute("movie",movie);	
		model.addAttribute("_categories", categoriesReponsitory.findAll());
		model.addAttribute("country",countryReponsitory.findAll());
		model.addAttribute("hinhthuc",hinhThucReponsitory.findAll());
		
		if(ListFavorite.checkExists(movie, request) == true) {
			model.addAttribute("status", "success");
		}else {
			model.addAttribute("status", "failed");
		}
		// trả về tên view.
		return "details";
	}

	@RequestMapping(value = { "/category" }, method = { RequestMethod.GET })
	public String category(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		return "category";
	}

	@RequestMapping(value = { "/favourite-movie" }, method = { RequestMethod.GET })
	public String viewGiohang(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("country",countryReponsitory.findAll());
		model.addAttribute("_categories", categoriesReponsitory.findAll());
		model.addAttribute("country",countryReponsitory.findAll());
		model.addAttribute("hinhthuc",hinhThucReponsitory.findAll());
//		model.addAttribute("movie", movieReponsitory.getOne(postId));
//		model.addAttribute("listMovie", favouriteMovieReponsitory.findAll());
		
		// trả về tên view.
		return "list-movie-like";
	}
	
//	@RequestMapping(value = { "/cart/finish" }, method = { RequestMethod.GET })
//	public String cartFinish(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
//		
////		1. lấy danh sách sản phẩm đã chọn mua
//		List<Cart> carts = new ArrayList<Cart>();
//		HttpSession httpSession = request.getSession();
//		if (httpSession.getAttribute("giohang") != null) {
//			carts = (List<Cart>) httpSession.getAttribute("giohang");
//		}
//		
//		// 2. tạo hoá đơn
//		Bill bill = new Bill();
//		bill.setName("Hoá đơn ngày " +  new Date().toString());
//		
//		// 3. bổ sung sản phẩm vào hoá đơn.
//		for(Cart cart :  carts) {
//			BillPost billPost = new BillPost();
//			billPost.setPostId(cart.getProductId());
//			billPost.setPrice(cart.getPrice());
//			billPost.setQuality(cart.getQuality());			
//			bill.addBillPost(billPost);
//		}
//		
//		// 4. lưu hoá đơn
//		billRepository.save(bill);
//		
//		// trả về tên view.
//		return "giohang";
//	}
	
	@RequestMapping(value = {"/contact"},method = { RequestMethod.GET})
	public String contact(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("_categories", categoriesReponsitory.findAll());
		model.addAttribute("country",countryReponsitory.findAll());
		model.addAttribute("hinhthuc",hinhThucReponsitory.findAll());
		model.addAttribute("country",countryReponsitory.findAll());
		return "contact";
	}
	
	@RequestMapping(value = {"/login"},method = {RequestMethod.GET})
	public String login(final ModelMap model, final HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("_categories", categoriesReponsitory.findAll());
		model.addAttribute("country",countryReponsitory.findAll());
		model.addAttribute("hinhthuc",hinhThucReponsitory.findAll());
		return "login";
	}
	
	@RequestMapping(value = { "/search" }, method = { RequestMethod.POST })
	public String search(@ModelAttribute("signup") String keyWord,final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		
		return "login";
	}
}
