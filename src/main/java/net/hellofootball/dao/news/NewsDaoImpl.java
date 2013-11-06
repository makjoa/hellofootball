package net.hellofootball.dao.news;

import java.util.HashMap;
import java.util.List;

import net.hellofootball.domain.news.News;
import net.hellofootball.domain.user.User;

import org.apache.log4j.Logger;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Component;

@Component
public class NewsDaoImpl extends EgovAbstractMapper implements NewsDao{
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Override
	public List<HashMap> getNewsList() {
		return getSqlSession().selectList("getNewsList");
	}

	@Override
	public void insertNews(News news) {
		getSqlSession().insert("insertNews", news);
	}
	
	@Override
	public void updateNews(News news) {
		getSqlSession().update("updateNews", news);
	}	
	
	@Override
	public News getNews(int id) {
		return getSqlSession().selectOne("getNews", id);
	}

}
