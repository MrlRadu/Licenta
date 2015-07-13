package ro.bibliardar.variants.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ro.bibliardar.variants.model.Variant;

@Repository
public class VariantDaoImpl implements VariantDao 
{
	@Autowired
	private SessionFactory sessionFactory;

	private Session getCurrentSession() 
	{
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	public List<Variant> getVariants() 
	{
		return getCurrentSession().createQuery("from Variant").list();
	}

	@Override
	public Variant getVariant(int id) 
	{
		return (Variant) getCurrentSession().get(Variant.class, id);
	}

	/*@Override
	public void addVariant(String q, String a1, String a2, String a3, String a4, String ac) 
	{
		Query q = getCurrentSession().createSQLQuery("update V set sold = :theSold where username = :theUsername");
		q.setParameter("theSold", sold);
		q.setParameter("theUsername", username);

		q.executeUpdate();
	}*/
	
	@Override
	public void addVariant(String q, String a1, String a2, String a3, String a4, String sac) 
	{
		int ac = Integer.parseInt(sac);
		System.out.println("ac: " + ac);
		Query sql = getCurrentSession().createSQLQuery("insert into Variants (question, answer1, answer2, answer3, answer4, answerc) values (?, ?, ?, ?, ?, ?)");
		sql.setString(0, q);
		sql.setString(1, a1);
		sql.setString(2, a2);
		sql.setString(3, a3);
		sql.setString(4, a4);
		sql.setInteger(5, ac);
		sql.executeUpdate();
		
		//getCurrentSession().createSQLQuery("insert into Variants (question, answer1, answer2, answer3, answer4, answerc) values ('q', 'a1', 'a2', 'a3', 'a4', ac)").executeUpdate();

	}

}