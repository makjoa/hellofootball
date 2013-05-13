package net.hellofootball.service.people;

import java.util.HashMap;
import java.util.List;

import net.hellofootball.domain.people.People;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.sql.SQLException;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;

@Service 
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT ,rollbackFor = {Exception.class,SQLException.class} ,readOnly = false)

public class PeopleServiceImpl extends SqlSessionDaoSupport implements PeopleService {
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	@Override
	public List<Object> getPeopleList() {
		return null;
	}

	@Override
	public HashMap<Object, Object> getPeople(Long unique_id) {		
		return getSqlSession().selectOne("getPeople", unique_id);
	}

	@Override
	public List<HashMap> getPeople(String q) {		
		return getSqlSession().selectList("getPeopleJSON", q);
	}
	
	@Override
	public void createPeople(HashMap<String, String> map) {
		getSqlSession().insert("createPeople", map);
	}
	
	@Override
	public void createPeople2(HashMap<String, String> map) {
		getSqlSession().insert("createPeople2", map);
	}
	
	@Override
	public void createClub(HashMap<String, String> map) {
		getSqlSession().insert("createClub", map);
	}

}
