package ro.bibliardar.users.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ro.bibliardar.users.model.User;

@Repository
public class UserDaoImpl implements UserDao 
{
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public User findByUserName(String username) 
	{
		List<User> users = new ArrayList<User>();

		//users = sessionFactory.getCurrentSession().createQuery("from Users where username=?").setParameter(0, username).list();
		users = sessionFactory.getCurrentSession()
		        .createQuery("from User where username = :username")
		        .setString("username", username)
		        .list();
		
		if (users.size() > 0)
			return users.get(0);
		else
			return null;
	}

}