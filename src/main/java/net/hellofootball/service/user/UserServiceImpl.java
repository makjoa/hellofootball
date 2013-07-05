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
import net.hellofootball.domain.user.LoginCommand;
import net.hellofootball.domain.user.User;
import net.hellofootball.service.user.UserService;

@Service
public class UserServiceImpl extends SqlSessionDaoSupport implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	
	public User loginCheck(LoginCommand loginCommand) {
		System.out.println(loginCommand.toString());
		return userDao.loginCheck(loginCommand);
	}
	
	public User emailCheck(String email) {	
		return userDao.emailCheck(email);					
	}
	
	public void addUser(User user) {
		userDao.addUser(user);
	}
	
	public void updateUser(HashMap<String, String> map) {
		
	}
	
	public void updateUserPoint(int setPoint) {		
		userDao.updateUserPoint(setPoint);
	}

	@Override
	public User findByUserName(String username) { 
		return userDao.findByUserName(username);
	}

	@Override
	public boolean existsUsername(String username) {
		return userDao.existsUsername(username);
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
