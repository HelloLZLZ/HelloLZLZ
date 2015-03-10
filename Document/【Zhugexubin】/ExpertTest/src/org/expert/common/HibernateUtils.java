package org.expert.common;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
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
}
