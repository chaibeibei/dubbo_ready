package com.chaiyinning.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chaiyinning.pojo.Article;
import com.chaiyinning.service.ArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class ArticleController {

	@Resource
	private ArticleService articleService;
	
	@RequestMapping("list")
	public String getList(String dim,String start,String end,@RequestParam(defaultValue="1") Integer currentPage,Model m) {
		PageHelper.startPage(currentPage,20);
		List<Article> list=articleService.getList(dim,start,end);
		PageInfo<Article> pageInfo = new PageInfo<>(list);
		m.addAttribute("dim",dim);
		m.addAttribute("start",start);
		m.addAttribute("end",end);
		m.addAttribute("pageInfo",pageInfo);
		return "list";
	}
}
