package net.hellofootball.dao.article;


import java.util.HashMap;

import net.hellofootball.domain.article.Comment;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service 
public class CommentDaoImpl extends SqlSessionDaoSupport {
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
		
	@Transactional
    public void insertComment(Comment comment) throws Exception {	
    	getSqlSession().insert("BBSCommentDAO.insertComment", comment);    	
    }
}
