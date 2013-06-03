package net.hellofootball.web;



import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/admin")
public class AdminController {

	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	
	
	@RequestMapping
	public String userList() {
		return "admin";
	}
	
	@RequestMapping("/club")
	public String clubList(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size)  {
					
		return "admin/clubList";
		
	}
}
