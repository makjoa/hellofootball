package net.hellofootball.dao.article;


import java.util.HashMap;
import java.util.List;

import net.hellofootball.domain.article.Article;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Service 
@Transactional
public class ArticleDaoImpl extends EgovAbstractMapper implements ArticleDao {
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();

	public Article select(int idx) { 
		return (Article)getSqlSession().selectOne("tables", idx);
	}

	public Article getArticle(int idx) {
		return (Article)getSqlSession().selectOne("article.getArticle", idx);
	}

	@SuppressWarnings("unchecked")
	public List<Article> getArticleList(int startArticleNum, int endArticleNum, String type, String keyword) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		if(logger.isDebugEnabled()) {

			logger.debug("action Write, method");
		}
		try {
			return (List)getSqlSession().selectList("article.getArticleList", valueMap);
		} catch(Exception e) {
			e.printStackTrace();
			return null;	
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Article> getArticleList() {
		return (List)getSqlSession().selectList("article.getArticleList", valueMap);
	}
		
	@Override
	public int getTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);		
		return (Integer) getSqlSession().selectOne("article.getTotalNum", valueMap);
	}

	@Override
	public int getSearchTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) getSqlSession().selectOne("getSearchTotalNum", valueMap);
	}
	
	public int insertArticle(Article article) {

		int b = getSqlSession().insert("article.insertArticle", article);
		return b;
	}
	
	public int deleteArticle(int idx) {
		int b = getSqlSession().delete("deleteArticle", idx);
		return b;
	}
}
