package org.expert.service.impl;

import java.util.List;

import org.expert.common.HibernateUtils;
import org.expert.model.Expert;
import org.expert.service.ExpertService;
import org.hibernate.Query;
import org.hibernate.Session;


public class ExpertServiceBean implements ExpertService{

	/************ 保存专家用户Profile资料 ******************/
	public boolean save(Expert expert) {
		// TODO Auto-generated method stub
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			session.persist(expert);
			session.getTransaction().commit();
			return true;
		} catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}

	public void update(Expert expert) {
		// TODO Auto-generated method stub
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			session.merge(expert);
			//session.update(expert);  // ??? ---different from merge?
			session.getTransaction().commit();
		} catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			session.delete(session.load(Expert.class, id));
			session.getTransaction().commit(); // must commit when delete & add & update except for search
		} catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public Expert get(int id) {
		// TODO Auto-generated method stub
		Expert expert = null;
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			expert =  (Expert) session.get(Expert.class, id);
			session.getTransaction().commit(); //--- must commit ！！ Even get()
		} catch(RuntimeException e) {
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		} 
		return expert;
	}

	public List<Expert> getList() {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin(); 
		Query query = session.createQuery(
				"from User order by userid desc");
		return (List<Expert>) query.list();
	}

	public List<Expert> getList(int begin, int end) {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		Query query = session.createQuery(
				"from User order by userid desc");
		query.setFirstResult(begin);
		query.setMaxResults(end);
		return (List<Expert>) query.list();
	}

	public Long totalNum() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Expert> query(String hql, List<?> values, int begin, int end) {
		// TODO Auto-generated method stub
		return null;
	}

	public Long queryNum(String hql, List<?> values) {
		// TODO Auto-generated method stub
		return null;
	}
}
