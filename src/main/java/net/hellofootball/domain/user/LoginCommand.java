package net.hellofootball.domain.user;


import javax.validation.constraints.*;


import org.hibernate.validator.constraints.NotEmpty;



/**
 * @author  makjoa
 */
public class LoginCommand {
	/**
	 * @uml.property  name="username"
	 */
	@NotEmpty
	@Size(min = 2, max = 30)
	@Pattern(regexp = "[_a-z0-9-]*")
	private String username;
	/**
	 * @uml.property  name="password"
	 */
	@NotEmpty
	@Size(min = 2, max = 30)
	private String password;
	
	private String remember_login;
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRemember_login() {
		return remember_login;
	}

	public void setRemember_login(String remember_login) {
		this.remember_login = remember_login;
	}
	
	public LoginCommand() {}
	
	public LoginCommand(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	@Override
	public String toString() {
		return "LoginCommand [username=" + username + ", password=" + password
				+ ", remember_login=" + remember_login + "]";
	}



}