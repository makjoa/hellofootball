package net.hellofootball.domain.user;

import java.util.ArrayList;
import java.util.Date;

import javax.validation.constraints.*;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import net.hellofootball.util.CommonUtil;

/**
 * @author  kenu
 */
public class User {
	/**
	 * @uml.property  name="username"
	 */
	@NotEmpty
	@Size(min = 2, max = 30)
	@Pattern(regexp = "[_a-z0-9-]*")
	private String username;
	/**
	 * @uml.property  name="name"
	 */
	@NotEmpty
	@Size(min = 2, max = 30)
	private String name;
	/**
	 * @uml.property  name="nickname"
	 */
	private String nickname;
	/**
	 * @uml.property  name="password"
	 */
	@NotEmpty
	@Size(min = 2, max = 30)
	private String password;
	/**
	 * @uml.property  name="email"
	 */
	@NotEmpty
	@Size(min = 2, max = 30)
	private String passwordConfirm;
	/**
	 * @uml.property  name="email"
	 */
	@NotEmpty
	@Size(max = 320)
	@Email
	private String email;
	/**
	 * @uml.property  name="joindate"
	 */
	private Date   joindate;
	/**
	 * @uml.property  name="profile"
	 */
	private String profile;
	/**
	 * @uml.property  name="mailing"
	 */
	private String mailing;
	/** 
	 * @uml.property name="point"
	 */
	private long point;
	/**
	 * @uml.property  name="sid"
	 */
	private long sid;
	/**
	 * @uml.property  name="role"
	 */
	private long unique_id;
	
	private String favourite_clubs;
	
	private String favourite_players;
	
	private ArrayList<String>   role;

	private String accessToken;
	
	public User() {
		
	}

	public User(String username, String name, String nickname, String password,
			String passwordConfirm, String email, Date joindate,
			String profile, String mailing, long point, long sid,
			long unique_id, String favourite_clubs, String favourite_players,
			ArrayList<String> role, String accessToken) {
		super();
		this.username = username;
		this.name = name;
		this.nickname = nickname;
		this.password = password;
		this.passwordConfirm = passwordConfirm;
		this.email = email;
		this.joindate = joindate;
		this.profile = profile;
		this.mailing = mailing;
		this.point = point;
		this.sid = sid;
		this.unique_id = unique_id;
		this.favourite_clubs = favourite_clubs;
		this.favourite_players = favourite_players;
		this.role = role;
		this.accessToken = accessToken;
	}

	// setters
	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @param nickname
	 * @uml.property  name="nickname"
	 */
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	/**
	 * @param role
	 * @uml.property  name="role"
	 */
	public void setRole(ArrayList<String> role) {
		this.role = role;
	}

	/**
	 * @param email
	 * @uml.property  name="email"
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * Sets the password.
	 * @param password  The password to set
	 * @uml.property  name="password"
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @param  date
	 * @uml.property  name="joindate"
	 */
	public void setJoindate(Date date) {
		joindate = (Date) date.clone();
	}
	/**
	 * @param  profile
	 * @uml.property  name="profile"
	 */
	public void setProfile(String profile) {
		this.profile = profile;
	}


	// getters
	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public String getUsername() {
		return this.username;
	}

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getNickname() {
		return this.nickname;
	}

	/**
	 * @return
	 * @uml.property  name="role"
	 */
	public ArrayList<String> getRole() {
		return this.role;
	}

	/**
	 * @return
	 * @uml.property  name="email"
	 */
	public String getEmail() {
		return this.email;
	}

	/**
	 * Returns the password.
	 * @return  String
	 * @uml.property  name="password"
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * Returns the joindate.
	 * @return  Date
	 * @uml.property  name="joindate"
	 */
	public String getJoindate() {
		return CommonUtil.formatDate(joindate, "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * @return  profile
	 * @uml.property  name="profile"
	 */
	public String getProfile() {
		return profile;
	}

	/**
	 * @return
	 * @uml.property  name="mailing"
	 */
	public String getMailing() {
		return (mailing == null) ? "N" : mailing;
	}

	/**
	 * @param mailing
	 * @uml.property  name="mailing"
	 */
	public void setMailing(String mailing) {
		this.mailing = mailing;
	}

	/** 
	 * @uml.property  name="point"
	 */
	public long getPoint() {
		return point;
	}

	/**
	 * Setter of the property <tt>point</tt>
	 * @param point  The point to set.
	 * @uml.property  name="point"
	 */
	public void setPoint(long point) {
		this.point = point;
	}

	/**
	 * Getter of the property <tt>sid</tt>
	 * @return  Returns the sid.
	 * @uml.property  name="sid"
	 */
	public long getSid() {
		return sid;
	}

	/**
	 * Setter of the property <tt>sid</tt>
	 * @param sid  The sid to set.
	 * @uml.property  name="sid"
	 */
	public void setSid(long sid) {
		this.sid = sid;
	}
	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}    
	
	public long getUnique_id() {
		return unique_id;
	}

	public void setUnique_id(long unique_id) {
		this.unique_id = unique_id;
	}

	public String getFavourite_clubs() {
		return favourite_clubs;
	}

	public void setFavourite_clubs(String favourite_clubs) {
		this.favourite_clubs = favourite_clubs;
	}

	public String getFavourite_players() {
		return favourite_players;
	}

	public void setFavourite_players(String favourite_players) {
		this.favourite_players = favourite_players;
	}	

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}	
	
	public boolean isAccountNonExpired() 
	{
		return true;
	}

	public boolean isAccountNonLocked() 
	{ 
		return true;
	}

	public boolean isCredentialsNonExpired() 
	{
		return true;
	}

	public boolean isEnabled() 
	{
		return true;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", name=" + name + ", nickname="
				+ nickname + ", password=" + password + ", passwordConfirm="
				+ passwordConfirm + ", email=" + email + ", joindate="
				+ joindate + ", profile=" + profile + ", mailing=" + mailing
				+ ", point=" + point + ", sid=" + sid + ", unique_id="
				+ unique_id + ", favourite_clubs=" + favourite_clubs
				+ ", favourite_players=" + favourite_players + ", role=" + role
				+ ", accessToken=" + accessToken + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((accessToken == null) ? 0 : accessToken.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result
				+ ((favourite_clubs == null) ? 0 : favourite_clubs.hashCode());
		result = prime
				* result
				+ ((favourite_players == null) ? 0 : favourite_players
						.hashCode());
		result = prime * result
				+ ((joindate == null) ? 0 : joindate.hashCode());
		result = prime * result + ((mailing == null) ? 0 : mailing.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result
				+ ((passwordConfirm == null) ? 0 : passwordConfirm.hashCode());
		result = prime * result + (int) (point ^ (point >>> 32));
		result = prime * result + ((profile == null) ? 0 : profile.hashCode());
		result = prime * result + ((role == null) ? 0 : role.hashCode());
		result = prime * result + (int) (sid ^ (sid >>> 32));
		result = prime * result + (int) (unique_id ^ (unique_id >>> 32));
		result = prime * result
				+ ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (accessToken == null) {
			if (other.accessToken != null)
				return false;
		} else if (!accessToken.equals(other.accessToken))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (favourite_clubs == null) {
			if (other.favourite_clubs != null)
				return false;
		} else if (!favourite_clubs.equals(other.favourite_clubs))
			return false;
		if (favourite_players == null) {
			if (other.favourite_players != null)
				return false;
		} else if (!favourite_players.equals(other.favourite_players))
			return false;
		if (joindate == null) {
			if (other.joindate != null)
				return false;
		} else if (!joindate.equals(other.joindate))
			return false;
		if (mailing == null) {
			if (other.mailing != null)
				return false;
		} else if (!mailing.equals(other.mailing))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (nickname == null) {
			if (other.nickname != null)
				return false;
		} else if (!nickname.equals(other.nickname))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (passwordConfirm == null) {
			if (other.passwordConfirm != null)
				return false;
		} else if (!passwordConfirm.equals(other.passwordConfirm))
			return false;
		if (point != other.point)
			return false;
		if (profile == null) {
			if (other.profile != null)
				return false;
		} else if (!profile.equals(other.profile))
			return false;
		if (role == null) {
			if (other.role != null)
				return false;
		} else if (!role.equals(other.role))
			return false;
		if (sid != other.sid)
			return false;
		if (unique_id != other.unique_id)
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

}