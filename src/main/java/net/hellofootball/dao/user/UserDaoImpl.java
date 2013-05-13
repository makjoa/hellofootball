package net.hellofootball.dao.user;

import java.util.HashMap;
import java.util.List;

import net.hellofootball.domain.user.User;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

@Component
public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao{

	

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> findByFavouriteClub(String screen_name) { 
		return (HashMap<String, String>) getSqlSession().selectList("findByFavouriteClub", screen_name);
	}
	
	@Override
	public void updateFavouriteClub(List clubList) {
		getSqlSession().insert("updateFavouriteClub", clubList);
	}

	@Override
	public void updateFavouritePlayer(List playerList) {
		getSqlSession().insert("updateFavouritePlayer", playerList);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, String> findByFavouritePlayer(String screen_name) {
		return (HashMap<String, String>) getSqlSession().selectList("findByFavouritePlayer", screen_name);
	}
}
