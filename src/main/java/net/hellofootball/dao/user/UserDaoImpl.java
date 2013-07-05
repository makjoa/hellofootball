package net.hellofootball.dao.user;

import java.util.HashMap;
import java.util.List;

import net.hellofootball.domain.user.LoginCommand;
import net.hellofootball.domain.user.User;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {

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

	@Override
	public User loginCheck(LoginCommand loginCommand) {
		
		return getSqlSession().selectOne("loginCheck", loginCommand);
	}

	@Override
	public User emailCheck(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findByUserName(String screen_name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean existsUsername(String screen_name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean existsEmail(String email) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUserPoint(int setPoint) {
		// TODO Auto-generated method stub
		
	}
}
