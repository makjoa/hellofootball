package net.hellofootball.web;

import java.util.List;

import net.hellofootball.service.article.BBSCommentService;
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
public class BBSCommentController {
	protected final Logger logger = Logger.getLogger(this.getClass().getName());

	
}
