package com.chaiyinning.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chaiyinning.dao.ArticleDao;
import com.chaiyinning.pojo.Article;
import com.chaiyinning.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService{

	@Resource
	private ArticleDao articleDao;

	@Override
	public List<Article> getList(String dim, String start, String end) {
		// TODO Auto-generated method stub
		return articleDao.getList(dim, start, end);
	}
}
