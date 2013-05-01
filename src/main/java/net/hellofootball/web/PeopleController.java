package net.hellofootball.web;

import javax.annotation.Resource;

import net.hellofootball.service.people.PeopleService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/peoples")
public class PeopleController {
	//private static final Logger logger = LoggerFactory.getLogger(PlayerController.class);
	
	private static final int DEFAULT_PAGE_NO = 0;
	private static final int DEFAULT_PAGE_SIZE = 15;

	@Autowired
	private PeopleService peopleService;
	
	@RequestMapping("")
	public String getPeoples(Model model) {
		model.addAttribute("peoples", peopleService.getPeopleList());		
		return "player/list";
	}
	
	@RequestMapping("{id}")
	public String getPeople(@PathVariable Long id, Model model) {
		model.addAttribute("people", peopleService.getPeople(id));
		return "people/info";
	}
	
	@RequestMapping("/q/json")
	public String getPeopleJSON(@RequestParam(value = "q", required = false) String q, Model model) {
		System.out.println("=============================JSON===============================");		
		model.addAttribute("jsonData", peopleService.getPeople(q));
		
		return "jsonView";
		
	}

	@RequestMapping("/update")
	public String updateForm(String jsonData) {

		return "player/form";
	}	
}
