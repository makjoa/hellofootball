package net.hellofootball.web;

import net.hellofootball.domain.user.LoginCommand;
import net.hellofootball.service.article.ArticleService;
import net.hellofootball.service.club.ClubService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	ArticleService articleService;
	@Autowired
	ClubService clubService;

	
	@RequestMapping("/")
	public String home(Model model, LoginCommand loginCommand) {			
		model.addAttribute("loginCommand", new LoginCommand());
		model.addAttribute("getBoardList", articleService.getArticleList());
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
