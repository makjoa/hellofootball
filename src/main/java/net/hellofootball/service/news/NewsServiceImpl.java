package net.hellofootball.service.news;

import java.util.HashMap;
import java.util.List;

import net.hellofootball.dao.news.NewsDao;
import net.hellofootball.domain.news.News;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service 
public class NewsServiceImpl extends SqlSessionDaoSupport implements NewsService {
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private NewsDao newsDao;
	
	@Override
	public List<HashMap> getNewsList() {
		return newsDao.getNewsList();
	}
	
	@Override
	public void insertNews(News news) {
		newsDao.insertNews(news);
	}
	
	@Override
	public void updateNews(News news) {
		newsDao.updateNews(news);
	}
	
	@Override
	public News getNews(int id) {
		return newsDao.getNews(id);
	}	
}
