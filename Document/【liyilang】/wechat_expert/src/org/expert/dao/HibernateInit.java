package org.expert.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

@SuppressWarnings("deprecation")
public class HibernateInit {
	private static final ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();
	private static SessionFactory sessionFactory = null;
	static{
		try{
			Configuration cfg = new Configuration().configure();
			ServiceRegistry sr=new ServiceRegistryBuilder().applySettings(cfg.getProperties()).buildServiceRegistry();
			sessionFactory=cfg.buildSessionFactory(sr);
		}catch(Exception e){
			System.err.println("创建会话失败");
			e.printStackTrace();
		}
		
	}
	//get session
	public static Session getSession()throws HibernateException{
		Session session=(Session)threadLocal.get();
		if(session==null||!session.isOpen()){
			if(sessionFactory==null){
				rebuildSessionFactory();
			}
		session=(sessionFactory!=null)?sessionFactory.openSession():null;
		 threadLocal.set(session);
		}
		
		return session;
	}
	//rebuild session
	public static void rebuildSessionFactory(){
		try{
			Configuration cfg=new Configuration().configure();
			ServiceRegistry sr=new ServiceRegistryBuilder().applySettings(cfg.getProperties()).buildServiceRegistry();
			sessionFactory=cfg.buildSessionFactory(sr);
		}catch(Exception e){
			System.err.println("创建会话工厂失败");
		}
	}
	//get the object of SessionFactory
	public static SessionFactory getSessionFactory(){
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
