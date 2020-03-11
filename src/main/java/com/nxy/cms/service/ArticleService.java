package com.nxy.cms.service;

import com.github.pagehelper.PageInfo;
import com.nxy.cms.entity.Article;

public interface ArticleService {

	int insert(Article article);

	PageInfo<Article> selects(Article article, Integer page, Integer pageSize);

	Article select(Integer id);
	int update(Article article);

}
