package net.hellofootball.service.people;

import java.util.HashMap;
import java.util.Map;

import  net.hellofootball.domain.player.Player;

public interface PeopleService {
	
	public void list(Map<String, Object> map);
	
	public Player findsPlayer(int idx);
	
	public void createPeople(HashMap<String, String> map);

	public void createPeople2(HashMap<String, String> map);
	
	public void createClub(HashMap<String, String> map);
}
