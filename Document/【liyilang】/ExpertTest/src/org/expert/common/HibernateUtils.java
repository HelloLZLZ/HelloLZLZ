package org.expert.common;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
	private static final ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();
	private static SessionFactory sessionFactory;
	static {
		try {
			sessionFactory = new Configuration().configure()
					.buildSessionFactory();
		} catch (Throwable ex) {
			ex.printStackTrace();
			System.out.println("Initial SessionFactory creation failed.");
			throw new ExceptionInInitializerError(ex);
		}
	}
	public static SessionFactory getSessionFactory() throws HibernateException{
		   return sessionFactory;  
	}
	//session close
			public static void closeSession()throws HibernateException{
				Session session=(Session)threadLocal.get();
				threadLocal.set(null);
				if(session!=null)
					session.close();
			}
}
