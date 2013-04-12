package net.hellofootball.service.club;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service 
@Transactional
public class ClubServiceImpl extends SqlSessionDaoSupport implements ClubService {

	@Autowired 
	MongoTemplate mongoTemplate;
	
	
	private static String COLLECTION_NAME = "club";	
	
	@Override
	public  List<HashMap> getClubList() {
		Query query = new Query(new Criteria("DIVISION_ID").is(11)).with(new Sort(Sort.Direction.DESC, "REP"));				
		return mongoTemplate.find(query, HashMap.class, COLLECTION_NAME);
	}
	
	@Override
	public List<HashMap> getBestClubList() {
		Query query = new Query(new Criteria("REP").gt(8500)).with(new Sort(Sort.Direction.DESC, "REP"));		
		System.out.println(query);
		return mongoTemplate.find(query, HashMap.class, COLLECTION_NAME);		
	}

}
