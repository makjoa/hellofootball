package net.hellofootball.service.club;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ClubService {
	
	public List<HashMap> getClubList();
	public List<HashMap> getClubJSON(String q);
	public List<HashMap> getBestClubList();
	public HashMap<Object, Object> getClub(Long id);
	
}
