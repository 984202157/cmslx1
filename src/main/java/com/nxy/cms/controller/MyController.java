package com.nxy.cms.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.nxy.cms.entity.Article;
import com.nxy.cms.service.ArticleService;

@RequestMapping("my")
@Controller
public class MyController {
	
	@Resource
	private ArticleService articleService;
	//个人中心
	@RequestMapping(value = {"","/","index"})
	public String index(){
		return "my/index";
	}
	/**
	 * 
	 * @Title: publish 
	 * @Description: 去发布文章
	 * @return
	 * @return: String
	 */
	@GetMapping("publish")
	public String publish() {
		return "my/publish";
		
	}
	
	/**
	 * 
	 * @Title: articleDetail 
	 * @Description: 单个文章么内容
	 * @param id
	 * @return
	 * @return: Article
	 */
	@ResponseBody
	@RequestMapping("articleDetail")
	public Article articleDetail(Integer id) {
		
		return articleService.select(id);
		
	}
	//我的发布文章
	@RequestMapping("articles")
	public String articles(Model model,@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "3")Integer pageSize) {
		Article article = new Article();
		article.setUserId(1);
		
		PageInfo<Article> info = articleService.selects(article, page, pageSize);
		
		model.addAttribute("info", info);
		return "my/articles";
		
	}
	
		//发布
		@ResponseBody
		@PostMapping("publish")
		public Object publish(MultipartFile file,Article article) {
			String path ="d:/pic/";
			if(null!=file &&!file.isEmpty()){
				String original = file.getOriginalFilename();
				String Neworiginal=UUID.randomUUID().toString()+original.substring(original.lastIndexOf("."));
				File f=new File(path+Neworiginal);
				try {
					file.transferTo(f);
					article.setPicture(Neworiginal);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			article.setUserId(1);//目前没有讲登录 。1 表示数据库的一个用户的ID
			article.setCreated(new Date());
			article.setHits(0);//点击量默认 0
			article.setDeleted(0);//默认未删除
			article.setHot(0);//默认非热门
			article.setStatus(0);//默认待审核
			return articleService.insert(article) >0;
			
			
		}
	
}
