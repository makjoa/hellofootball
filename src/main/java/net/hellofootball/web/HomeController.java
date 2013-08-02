package net.hellofootball.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import net.hellofootball.domain.user.LoginCommand;
import net.hellofootball.service.article.ArticleService;
import net.hellofootball.service.club.ClubService;
import net.hellofootball.service.news.NewsService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	ArticleService articleService;
	@Autowired
	ClubService clubService;
	@Autowired
	NewsService newsService;

	
	@RequestMapping("/")
	public String home(@CookieValue(value="remember_checked_on", required=false) String cookieValue, Model model, LoginCommand loginCommand, HttpServletRequest request) {
		
		System.out.println(cookieValue);
		String cValue = cookieValue;
		Cookie[] cookies = request.getCookies();
		
		System.out.println("COOKIE NAME : " + cValue);
		
		model.addAttribute("loginCommand", new LoginCommand());
		model.addAttribute("getBoardList", articleService.getArticleList());
		model.addAttribute("getNewsList", newsService.getNewsList());
		model.addAttribute("getBestClubList", clubService.getBestClubList());
		return "index";
	}
	
	@RequestMapping("/tactics")
	public String showTactics(Model model, LoginCommand loginCommand) {		
		model.addAttribute("getBestClubList", clubService.getBestClubList());		
		
		return "tactics/index";
	}	
	
	@RequestMapping("/map")
	public String getGis() {					
		return "map/map";
		
	}
}
