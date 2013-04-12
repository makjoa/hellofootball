package net.hellofootball.web;

import java.util.List;

import net.hellofootball.service.club.ClubService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

@Controller
@RequestMapping("club")
public class ClubController {
	
	@Autowired
	ClubService clubService;
	
	@Autowired 
	MongoTemplate mongoTemplate;
	
	@RequestMapping("/")
	public String home(Model model) {				
		model.addAttribute("getClubList", clubService.getClubList());		
		return "index";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String list(@PathVariable String id, Model model) {		
		model.addAttribute("m_id", id);
		model.addAttribute("getBestClubList", clubService.getBestClubList());
		model.addAttribute("getClubList", clubService.getClubList());
		System.out.println(clubService.getBestClubList());
		return "club/index";
		
	}

}
