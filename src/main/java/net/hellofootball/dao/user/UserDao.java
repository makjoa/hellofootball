package net.hellofootball.dao.user;

import java.util.HashMap;
import java.util.List;

import net.hellofootball.domain.user.LoginCommand;
import net.hellofootball.domain.user.User;

public interface UserDao {
	
	User loginCheck(LoginCommand loginCommand);
	
	User emailCheck(String email);

	User findByUserName(String screen_name);
	
	boolean existsUsername(String screen_name);
	
	boolean existsEmail(String email);
	
	void addUser(User user);
	
	void updateUser(User user);
	
	HashMap<String, String> findByFavouriteClub(String screen_name);
	
	void updateFavouriteClub(List clubList);
	
	HashMap<String, String> findByFavouritePlayer(String screen_name);
	
	void updateFavouritePlayer(List clubList);
	
	void updateUserPoint(int setPoint);
}
