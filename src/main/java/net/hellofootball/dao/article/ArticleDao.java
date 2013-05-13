package net.hellofootball.dao.article;

import java.util.List;

import net.hellofootball.domain.article.Article;

public interface ArticleDao {
	
	Article select(int idx);
	
	int insertArticle(Article article);
	
	int deleteArticle(int idx);
	
	Article getArticle(int idx);
	
	List<Article> getArticleList(int startArticleNum, int showArticleLimit, String type, String keyword);
	
	List<Article> getArticleList();
		
	int getTotalNum(String type, String keyword);
	
	int getSearchTotalNum(String type, String keyword);

}
