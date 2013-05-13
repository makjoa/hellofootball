package net.hellofootball.dao.user;

import java.util.HashMap;
import java.util.List;

import net.hellofootball.domain.user.User;

public interface UserDao {
	
	void updateFavouriteClub(List clubList);

	HashMap<String, String> findByFavouriteClub(String screen_name);
	
	void updateFavouritePlayer(List playerList);

	HashMap<String, String> findByFavouritePlayer(String screen_name);
}
