package org.expert.service.impl;
/**
 * @author Seth
 * 
 */
import java.util.List; 

import org.expert.common.HibernateUtils;
import org.expert.model.Business;
import org.expert.model.Project;
import org.expert.service.BusinessService;
import org.hibernate.Query;
import org.hibernate.Session;

public class BusinessServiceBean implements BusinessService {

	public boolean save(Business business) {
		// TODO Auto-generated method stub
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			session.persist(business);
			session.getTransaction().commit();
			return true;
		} catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			HibernateUtils.closeSession();
		}
		return false;
	}

	public boolean update(Business business) {
		// TODO Auto-generated method stub
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			session.merge(business);
			session.getTransaction().commit();
			return true;
		} catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			HibernateUtils.closeSession();
		}
		return false;
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			session.delete(session.load(Business.class, id));
			session.getTransaction().commit();
		} catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			HibernateUtils.closeSession();
		}
	}

	public Business get(int id) {
		// TODO Auto-generated method stub
		Business business=null;
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			business =  (Business) session.get(Business.class, id);
			session.getTransaction().commit(); //--- must commit £¡£¡ Even get()
		} catch(RuntimeException e) {
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			HibernateUtils.closeSession();
		}
		return business;
	}

	public List<Business> getList() {
		// TODO Auto-generated method stub
		Query query=null;
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			query = session.createQuery(
					"from Business order by bid desc");
		} catch(RuntimeException e) {
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			HibernateUtils.closeSession();
		}
		return (List<Business>) query.list();
	}
	

	public List<Business> getList(int begin, int end) {
		// TODO Auto-generated method stub
		return null;
	}

	public Long totalNum() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Business> query(String hql, List<?> values, int begin, int end) {
		// TODO Auto-generated method stub
		return null;
	}

	public Long queryNum(String hql, List<?> values) {
		// TODO Auto-generated method stub
		return null;
	}

}
