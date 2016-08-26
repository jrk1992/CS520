package csjobs.model.dao;

import java.util.List;

import csjobs.model.User;

public interface UserDao {

	List<User> getUsers();

	User getUser(long id);
	
	 User getUser( String email );
	
	User saveUser(User user);

}
