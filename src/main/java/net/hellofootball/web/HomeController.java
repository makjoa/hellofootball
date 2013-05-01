package net.hellofootball.web;

import net.hellofootball.service.article.ArticleService;
import net.hellofootball.service.club.ClubService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

@Controller
public class HomeController {
	
	@Autowired
	ArticleService articleService;
	@Autowired
	ClubService clubService;
	
	@RequestMapping("/")
	public String home(Model model) {				
		model.addAttribute("getBoardList", articleService.getArticleList());		
		return "index";
	}
	
	@RequestMapping("/tactics")
	public String showTactics(Model model) {				
		model.addAttribute("getBestClubList", clubService.getBestClubList());		
		
		return "tactics/index";
	}	
	
	@RequestMapping("/news")
	public String index(Model model) {				
		//model.addAttribute("m_id", id);
		model.addAttribute("getNewsList", articleService.getArticleList());
		return "news/index";
		
	}
	
	@RequestMapping("/map")
	public String getGis() {					
		return "map/map";
		
	}
}
