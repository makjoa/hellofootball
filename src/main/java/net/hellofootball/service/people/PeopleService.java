package net.hellofootball.service.people;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.hellofootball.domain.people.People;

public interface PeopleService {
	
	public List<Object> getPeopleList();
	
	public HashMap<Object, Object> getPeople(Long unique_id);
	
	public List<HashMap> getPeople(String p);
	
	public void createPeople(HashMap<String, String> map);

	public void createPeople2(HashMap<String, String> map);
	
	public void createClub(HashMap<String, String> map);
}
