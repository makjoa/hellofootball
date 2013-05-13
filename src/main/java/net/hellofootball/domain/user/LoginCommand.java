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
	
	public LoginCommand() {}
	
	public LoginCommand(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}

}