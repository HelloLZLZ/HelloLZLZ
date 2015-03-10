package org.expert.service.impl;

import java.sql.Timestamp;

import org.expert.common.HibernateUtils;
import org.expert.model.Business;
import org.expert.model.Expert;
import org.expert.model.User;
import org.expert.service.LoginService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class LoginServiceBean implements LoginService{

	
	public boolean hasUser(String name) {
		// TODO Auto-generated method stub
		
		return false;
	}

	public boolean checkUserLogin(User user) {
		// TODO Auto-generated method stub
		User usertmp = getUserFromName(user.getUsername()); //-- get user from username
		//User usertmp = getUserFromId(user.getUserid()); //-- get user from userid
		//System.out.println(usertmp.getUsername()+"----"+usertmp.getPassword());
		if (usertmp != null && usertmp.getPassword().equals(user.getPassword())) {
			System.out.println("user check success");
			return true;
		}
		System.out.println("user check fail");
		return false;
	}
	public boolean checkExpertLogin(Expert expert) {
		// TODO Auto-generated method stub
		Expert usertmp = getExpertFromName(expert.getEusername()); //-- get user from username
		if (usertmp != null && usertmp.getEpwd().equals(expert.getEpwd())) {
			System.out.println("expert check success");
			return true;
		}
		System.out.println("expert check fail");
		return false;
	}
	public boolean checkBusinessLogin(Business business) {
		// TODO Auto-generated method stub
		System.out.println(business.getBusername());
		Business usertmp = getBusinessFromName(business.getBusername()); //-- get user from username
		if (usertmp != null && usertmp.getBpwd().equals(business.getBpwd())) {
			System.out.println("business check success");
			return true;
		}
		System.out.println("business check fail");
		return false;
	}

	public User getUserFromName(String name) {
		// TODO Auto-generated method stub
		User user = null;
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin();
			Query query = session.createQuery("from User as u where u.username=:name").setString("name", name);
			user = (User) query.uniqueResult();
		}catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}
		return user;
	}
	
	public Expert getExpertFromName(String name) {
		// TODO Auto-generated method stub
		Expert expert = null;
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin();
			Query query = session.createQuery("from Expert as e where e.eusername=:name").setString("name", name);
			expert = (Expert) query.uniqueResult();
		}catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}
		return expert;
	}
	public Business getBusinessFromName(String name) {
		// TODO Auto-generated method stub
		Business business = null;
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin();
			Query query = session.createQuery("from Business as b where b.busername=:name").setString("name", name);
			business = (Business) query.uniqueResult();
		}catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}
		return business;
	}
	public int register(User user) {
		// TODO Auto-generated method stub
		int result = 0; // 0--失败, 1--用户名已存在, 2--注册成功
		if(getUserFromName(user.getUsername()) != null){
			result = 1;
		}
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin();
			session.save(user);
			result = 2;
			session.getTransaction().commit();
		}catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}
		return result;
	}


	public int expertRegister(Expert expert) {
		// TODO Auto-generated method stub
		System.out.println("expertReigsreter------------");
		int result = 0; // 0--失败, 1--用户名已存在, 2--注册成功
		if(getExpertFromName(expert.getEusername()) != null){
			result = 1;
			System.out.println("用户名已存在！！！");
		} else{
			try{
				Session session = HibernateUtils.getSessionFactory().getCurrentSession();
				session.getTransaction().begin();
				session.persist(expert);
				result = 2;
				session.getTransaction().commit();
			}catch(RuntimeException e){
				HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
				e.printStackTrace();
			}
		}
		return result;
	}

	public int businessRegister(Business business) {
		// TODO Auto-generated method stub
		System.out.println("businessReigsreter------------");
		int result = 0; // 0--失败, 1--用户名已存在, 2--注册成功
		if(getBusinessFromName(business.getBusername()) != null){
			result = 1;
		}
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin();
			session.persist(business);
			result = 2;
			session.getTransaction().commit();
		}catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}
		return result;
	}
	
	public void updateLoginInfo(User user) {
		// TODO Auto-generated method stub
		
	}
}
