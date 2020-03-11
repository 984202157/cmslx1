package com.nxy.cms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.nxy.cms.entity.Article;
import com.nxy.cms.entity.Category;
import com.nxy.cms.entity.Channel;
import com.nxy.cms.entity.Slide;
import com.nxy.cms.service.ArticleService;
import com.nxy.cms.service.ChannelService;
import com.nxy.cms.service.SlideService;

@Controller
public class IndexController {
	@Resource
	private ChannelService channelService;
	
	@Resource
	private ArticleService articleService;
	
	@Resource
	private SlideService slideService;
	
	@RequestMapping(value={"","/","index"})
	public String index(Model m,Article article,@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="4")Integer pageSize){
		m.addAttribute("article", article);
		List<Channel> channels = channelService.selects();
		m.addAttribute("channels", channels);
		if(article.getChannelId()!=null){
			List<Category> category = channelService.selectsid(article.getChannelId());
			m.addAttribute("category", category);
		}
		if(article.getChannelId()==null){
			article.setHot(1);
			List<Slide> list = slideService.selects();
			m.addAttribute("list", list);
		}
		PageInfo<Article> lastArticle = articleService.selects(new Article(), 1, 10);
		m.addAttribute("lastArticle", lastArticle);
		
		PageInfo<Article> info = articleService.selects(article, page, pageSize);
		m.addAttribute("info", info);
		return "/index/index";
	}
	/**
	 * 
	 * @Title: articleDetail 
	 * @Description: 文章详情
	 * @param id
	 * @return
	 * @return: String
	 */
	@RequestMapping("articleDetail")
	public String articleDetail(Integer id,Model model) {
		Article article = articleService.select(id);
		model.addAttribute("article", article);
		return "index/articleDetail";
	}
}
