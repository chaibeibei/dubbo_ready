package com.chaiyinning.service;

import java.util.List;

import com.chaiyinning.pojo.Article;

public interface ArticleService {

	List<Article> getList(String dim, String start, String end);

}
