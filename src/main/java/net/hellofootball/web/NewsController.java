package net.hellofootball.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;

import net.hellofootball.domain.news.News;
import net.hellofootball.service.article.ArticleService;
import net.hellofootball.service.club.ClubService;
import net.hellofootball.service.news.NewsService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartRequest;

@Controller
@RequestMapping("/news")
public class NewsController {
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	
	private static final int DEFAULT_PAGE_NO = 1;
	private static final int DEFAULT_PAGE_SIZE = 15;
	
	@Autowired
	NewsService newsService;
	@Autowired
	ArticleService articleService;
	@Autowired
	ClubService clubService;
	
	@RequestMapping("")
	public String list(Model model) {				
		//model.addAttribute("m_id", id);
		model.addAttribute("getNewsList", newsService.getNewsList());
		model.addAttribute("getBestClubList", clubService.getBestClubList());
		return "news/index";
		
	}

	@RequestMapping("/json")
	public String listToJSON(@RequestParam(value="page", required=false) String page, Model model) {
		
		List newsList = new ArrayList<>();  
				
		newsList = newsService.getNewsList();
		model.addAttribute("resultData", newsList);
		
		return "jsonView";
	}
	
	@RequestMapping(value = { "/form" } , method = RequestMethod.GET)
	public String form(Model model) {		
		return "news/form";

	}	

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(@ModelAttribute("News") News news) {		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(news.toString());
		newsService.insertNews(news);						
//		map.put("count", insertCount);
//		newsCount(m_id, map);
		return "redirect:/news";
	}	
	
	@RequestMapping("{id}/form")
	public String updateForm(@PathVariable int id, Model model) {
		model.addAttribute("getNews", newsService.getNews(id));			
		return "news/form";
	}
	
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public String update(News news) {
		newsService.updateNews(news);
		return "news/view";
	}		
	
	@RequestMapping("{id}")
	public String view(@PathVariable int id, Model model) {
		model.addAttribute("getNews", newsService.getNews(id));				
		return "news/view";
	}
	
	private Integer revisedPage(Integer page) {
		if (page == null) {
			page = DEFAULT_PAGE_NO;
		}
		return page;
	}
	
}
