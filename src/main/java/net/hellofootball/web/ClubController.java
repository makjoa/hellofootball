package net.hellofootball.web;

import java.util.List;

import net.hellofootball.service.club.ClubService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
@RequestMapping("/clubs")
public class ClubController {
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	@Autowired
	ClubService clubService;
	
	@RequestMapping("")
	public String getClubList(Model model) {				
		model.addAttribute("getBestClubList", clubService.getBestClubList());
		model.addAttribute("getClubList", clubService.getClubList());		
		return "club/index";
	}
	
	@RequestMapping("/view/{id}")
	public String getClub(@PathVariable Long id, Model model) {				
		model.addAttribute("getClub", clubService.getClub(id));
		return "club/view";
		
	}

	@RequestMapping("/q/json")
	public String getClub(@RequestParam(value = "q", required = false) String q, Model model) {
		System.out.println("=============================JSON===============================");		
		model.addAttribute("jsonData", clubService.getClubJSON(q));
		
		return "jsonView";
		
	}
	
	@RequestMapping("/q/excel")
	public String getExcelDownLoad(@RequestParam(value = "q", required = false) String q, Model model) {
		System.out.println("=============================JSON===============================");		
		model.addAttribute("jsonData", clubService.getClubJSON(q));
		
		return "jsonView";
		
	}
	
}
