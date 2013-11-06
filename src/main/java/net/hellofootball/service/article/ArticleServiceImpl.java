package net.hellofootball.service.article;


import java.util.HashMap;
import java.util.List;

import net.hellofootball.dao.article.ArticleDao;
import net.hellofootball.domain.article.Article;

import org.apache.log4j.Logger;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service 
@Transactional
public class ArticleServiceImpl extends EgovAbstractMapper implements ArticleService {
	@Autowired
	private ArticleDao articleDao;
	
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();

	public Article select(int idx) { 
		return articleDao.select(idx);
	}

	public Article getArticle(int idx) {
		return articleDao.getArticle(idx);
	}

	public List<Article> getArticleList(int startArticleNum, int endArticleNum, String type, String keyword) {
		return articleDao.getArticleList(startArticleNum, endArticleNum, type, keyword);
	}
	
	public List<Article> getArticleList() {
		return articleDao.getArticleList();
	}
		
	@Override
	public int getTotalNum(String type, String keyword) {
		return articleDao.getTotalNum(type, keyword);
	}

	@Override
	public int getSearchTotalNum(String type, String keyword) {
		return articleDao.getSearchTotalNum(type, keyword);
	}
	
	public int insertArticle(Article article) {
		return articleDao.insertArticle(article);
	}
	
	public int deleteArticle(int idx) {
		return articleDao.deleteArticle(idx);
	}
}
