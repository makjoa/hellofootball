package net.hellofootball.service.user;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.hellofootball.dao.user.UserDao;
import net.hellofootball.domain.user.User;
import net.hellofootball.service.user.UserService;

@Service 
@Transactional
public class UserServiceImpl extends SqlSessionDaoSupport implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	
	public User loginCheck(String id, String password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);	
		return (User)getSqlSession().selectOne("user.loginProcess", map);						
	}
	
	public User emailCheck(String email) {	
		return (User) getSqlSession().selectOne("emailCheck", email);					
	}
	
	public void addUser(User user) {
		getSqlSession().insert("user.addUser", user);
	}
	
	public void updateUser(HashMap<String, String> map) {
		
	}
	
	public void updateUserPoint(int setPoint) {
		
		getSqlSession().update("updateUserPoint", setPoint);
	}

	@Override
	public User findByUserName(String username) { 
		return (User)getSqlSession().selectOne("user.findByUserName", username);
	}

	@Override
	public boolean existsUsername(String username) {
		return getSqlSession().selectOne("user.existsUsername", username);
	}

	@Override
	public boolean existsEmail(String email) {
		return false;
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public HashMap<String, String> findByFavouriteClub(String screen_name) {		
		return userDao.findByFavouriteClub(screen_name);
	}	

	@Override
	public void updateFavouriteClub(List clubList) {
		userDao.updateFavouriteClub(clubList);		
	}

	@Override
	public HashMap<String, String> findByFavouritePlayer(String screen_name) {		
		return userDao.findByFavouritePlayer(screen_name);
	}	

	@Override
	public void updateFavouritePlayer(List playerList) {
		userDao.updateFavouritePlayer(playerList);		
	}

}
