package net.hellofootball.service.club;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.apache.log4j.Logger;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service 
@Transactional
public class ClubServiceImpl extends EgovAbstractMapper implements ClubService {
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	private static String COLLECTION_NAME = "club";	
	
	@Override
	public List<HashMap> getClubList() {
//		Query query = new Query(new Criteria("DIVISION_ID").is(11)).with(new Sort(Sort.Direction.DESC, "REP"));				
//		return mongoTemplate.find(query, HashMap.class, COLLECTION_NAME);
		return getSqlSession().selectList("getClubList");
	}

	@Override
	public List<HashMap> getClubJSON(String q) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("getClubJSON", q);
	}
	
	@Override
	public List<HashMap> getBestClubList() {
//		Query query = new Query(new Criteria("REP").gt(8500)).with(new Sort(Sort.Direction.DESC, "REP"));		
//		System.out.println(query);
//		return mongoTemplate.find(query, HashMap.class, COLLECTION_NAME);
		return getSqlSession().selectList("getBestClubList");
	}
	
	@Override
	public HashMap<Object, Object> getClub(Long id) {
//		Query query = new Query(new Criteria("REP").gt(8500)).with(new Sort(Sort.Direction.DESC, "REP"));				
//		return mongoTemplate.find(query, HashMap.class, COLLECTION_NAME);		
		return getSqlSession().selectOne("getClub", id);
	}
	
}
