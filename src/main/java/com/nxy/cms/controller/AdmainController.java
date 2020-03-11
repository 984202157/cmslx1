package com.nxy.cms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.nxy.cms.entity.Article;
import com.nxy.cms.entity.User;
import com.nxy.cms.service.ArticleService;
import com.nxy.cms.service.UserService;

@RequestMapping("/admin")
@Controller
public class AdmainController {
	@Resource
	private ArticleService service;
	@Resource
	private UserService userService;
	
	@RequestMapping( value={"","/","admin" })
	public String articlesGl(){
		return "/admin/index";
	}
	
	@RequestMapping("users")
	public String users(Model model,User user,@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "5")Integer pageSize){
		PageInfo<User> info = userService.selects(user, page, pageSize);
		model.addAttribute("info", info);
		model.addAttribute("user", user);
		return "/admin/users";
	}
	@RequestMapping( "articles")
	public String article(Model model,Article article,@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "5")Integer pageSize){
		PageInfo<Article> info = service.selects(article, page, pageSize);
		model.addAttribute("info", info);
		model.addAttribute("article", article);
		return "/admin/articles";
	}
	@ResponseBody
	@RequestMapping("update")
	public boolean update(Article article) {
		return service.update(article) >0;
	}
	@ResponseBody
	@RequestMapping("updateUser")
	public boolean updateUser(User user) {
		return userService.updateUser(user) >0;
	}
	
	
	@ResponseBody
	@RequestMapping("articleDetail")
	public Article articleDetail(Integer id) {
		Article select = service.select(id);
		System.out.println(select.getTitle());
		return select;
		
	}
}
