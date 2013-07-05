package net.hellofootball.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.hellofootball.service.user.UserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class HF_UserDetailsService implements UserDetailsService {
	private static Logger logger = LoggerFactory.getLogger(HF_UserDetailsService.class);
	
	private static final String DEFAULT_ADMIN_USERNAME = "자바지기";
	
	@Autowired
	private UserService userService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		net.hellofootball.domain.user.User user = userService.findByUserName(username);
		if (user == null) {
			throw new UsernameNotFoundException(String.format("%s not found!", username));
		} else {
			return new User(username, user.getAccessToken(), true, true, true, true, createGrantedAuthorities(username));
		}
	}

	private List<GrantedAuthority> createGrantedAuthorities(String username) {
		logger.debug("UserName : {}", username);
		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		if (DEFAULT_ADMIN_USERNAME.equals(username)){
			grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_ADMINISTRATOR"));
		}
		return grantedAuthorities;
	}
}