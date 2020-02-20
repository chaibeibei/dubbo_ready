package com.chaiyinning.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chaiyinning.pojo.Article;

public interface ArticleDao {

	List<Article> getList(@Param("dim")String dim,@Param("start") String start, @Param("end")String end);

}
