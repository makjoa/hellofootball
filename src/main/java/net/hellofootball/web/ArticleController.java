package net.hellofootball.web;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hellofootball.domain.article.Article;
import net.hellofootball.service.article.ArticleService;
import net.hellofootball.page.model.Paging;
import net.hellofootball.page.service.PagingService;
import net.hellofootball.util.PagingUtil;
import net.hellofootball.realtimeweb.RealtimeWebServer;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/bbs")
public class ArticleController {
	
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	private int currentPage = 1;			// 현재페이지
	private int showArticleLimit = 10;	// 화면에 보여줄 리스트 개 change value if want to show more articles by one page
	private int showPageLimit = 10; 	// 화면에 페이지 수 change value if want to show more page links
	private int startArticleNum = 0;		// 시작
	private int endArticleNum = 0;		// 마지막
	private int totalNum = 0;				// 총페이지 수
	private int insertCount = 0;				// 등록수
	
	@Autowired
	ArticleService articleService;
	PagingService pagingService;
	PagingUtil pagingUtil;

	@RequestMapping(value = { "/form" } , method = RequestMethod.GET)
	public String createForm(Model model){
		model.addAttribute("Article", new Article());
		return "bbs/form";
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(Article article){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		insertCount++;
		System.out.println(insertCount);
	
		articleService.insertArticle(article);
				
		map.put("resultData", article);
		map.put("count", insertCount);
		articleCount(article.getCat_name(), map);
		
		return "redirect:/";
	}	
	public void articleCount(String m_id, HashMap<String, Object> map) {
		RealtimeWebServer.send(m_id, m_id, "new", map);
	}

	@RequestMapping("{idx}")
	public String view(@PathVariable int idx, Model model) {

		ModelAndView mav = new ModelAndView();		
		Article article = articleService.getArticle(idx);
		System.out.println(article.getNum());
		model.addAttribute("getArticle", article);
		model.addAttribute("getArticleIDX", article.getNum());
		mav.setViewName("/bbs/view");

		return "bbs/view";
	}

	@RequestMapping(value = "/l/{id}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable String id,
			@RequestParam(value="page", required=false) String page, 
			@RequestParam(value="type", required=false) String type, 
			@RequestParam(value="keyword", required=false) String keyword, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		PagingUtil pageUtil = new PagingUtil();
		List articleList;

		Paging paging = new Paging();
		String ip = request.getRemoteAddr();

		System.out.println("요청 필드= "+id);
		System.out.println("요청 페이지= "+page);
		System.out.println("요청 타입= "+type);
		System.out.println("요청 키워드= "+keyword);
		System.out.println("요청 아이피= "+ip);


		// set variables from request parameter
		if(page == null || page.trim().isEmpty() || page.equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(page);
		}		

		// expression article variables value
		startArticleNum = (currentPage - 1) * showArticleLimit;		
		endArticleNum = startArticleNum + showArticleLimit;
		//endArticleNum = startArticleNum + showArticleLimit -1;

		//전체 글의 수
		totalNum = articleService.getTotalNum(type, keyword);

		if(totalNum > 0) {

			if(endArticleNum > totalNum) 				
				endArticleNum = totalNum;
		}
		articleList = articleService.getArticleList(startArticleNum, showArticleLimit, type, keyword);		
		System.out.println("startArticleNum" + startArticleNum + "\nendArticleNum" + endArticleNum + "\nshowArticleLimit"+ showArticleLimit + "\nshowPageLimit" +showPageLimit);

		mav.addObject("getArticleList", articleList);

		mav.addObject("pagingList", paging);
		mav.setViewName("bbs/view");
		
		return mav;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String update(@RequestParam(value = "grpid", required = false) int grpid,
			RedirectAttributes redirectAttributes) {
		int a = articleService.deleteArticle(grpid);
		redirectAttributes.addFlashAttribute("message", "삭제되었습니다.");

		return "redirect:table";
	}	
	
}
