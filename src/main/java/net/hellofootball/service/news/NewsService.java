package net.hellofootball.service.news;

import java.util.HashMap;
import java.util.List;

import net.hellofootball.domain.news.News;

public interface NewsService {
	
	public List<HashMap> getNewsList();
	
	public void insertNews(News news);

	public void updateNews(News news);
	
	public News getNews(int id);
	
}
