package net.hellofootball.service.article;


import java.util.List;


import net.hellofootball.domain.article.Article;

public interface ArticleService {
			
	Article select(int idx);
	
	int insertArticle(Article article);
	
	int deleteArticle(int idx);
	
	Article getArticle(int idx);
	
	List<Article> getArticleList(int startArticleNum, int showArticleLimit, String type, String keyword);
	
	List<Article> getArticleList();
		
	int getTotalNum(String type, String keyword);
	
	int getSearchTotalNum(String type, String keyword);
	
}
