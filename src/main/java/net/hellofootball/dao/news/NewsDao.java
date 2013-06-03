package net.hellofootball.dao.news;

import java.util.HashMap;
import java.util.List;

import net.hellofootball.domain.news.News;
import net.hellofootball.domain.user.User;

public interface NewsDao {
	
	List<HashMap> getNewsList();		
	void insertNews(News news);
	void updateNews(News news);
	News getNews(int id);
}
