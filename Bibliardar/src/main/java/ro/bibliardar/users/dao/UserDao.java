package ro.bibliardar.users.dao;

import ro.bibliardar.users.model.User;

public interface UserDao 
{
	User findByUserName(String username);
	
}