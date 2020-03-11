package com.nxy.cms.dao;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.nxy.cms.entity.Article;

public interface ArticleDao {


	int insert(Article article);

	List<Article> selects(Article article);

	Article select(Integer id);
	int update(Article article);
	
	
}
