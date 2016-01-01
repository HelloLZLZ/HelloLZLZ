package org.expert.service.impl;

import java.util.List;

import org.expert.common.HibernateUtils;
import org.expert.model.Expert;
import org.expert.model.Project;
import org.expert.service.ExpertService;
import org.hibernate.Query;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;

/**
 * 
 * @author zhugexubin
 *
 */
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
	/************ 修改专家用户Profile资料 ******************/
	public boolean update(Expert expert) {
		// TODO Auto-generated method stub
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			session.merge(expert);
			//session.update(expert);  // ??? ---different from merge?
			session.getTransaction().commit();
			return true;
		} catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
			return false;
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
	
	//获取专家用户列表
	public List<Expert> getList() {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin(); 
		Query query = session.createQuery(
				"from Expert order by eid desc");
		return (List<Expert>) query.list();
	}

	public List<Expert> getList(int begin, int end) {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		Query query = session.createQuery(
				"from Expert order by eid desc");
		query.setFirstResult(begin);
		query.setMaxResults(end);
		return (List<Expert>) query.list();
	}

	public Long totalNum() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Expert> query(String hql) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		
		Query query = session.createQuery(hql);
		 
		return (List<Expert>) query.list();
	}
	
	public List<Expert> query(String hql, List<?> values, int begin, int end) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		
		Query query = session.createQuery(hql);
		int N = values.size();
		for (int i = 0; i < N; i++) {
			query.setParameter(i, values.get(i));
		}
		query.setFirstResult(begin);
		query.setMaxResults(end);
		return (List<Expert>) query.list();
	}

	public Long queryNum(String hql, List<?> values) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<Project> getProjectList() {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		ActionContext ctx = ActionContext.getContext();
		int eid = (Integer) ctx.getSession().get("euserid");
		String hql = "from Project where eid=:eid "+
					"order by pid desc";
		Query query = session.createQuery(hql).setInteger("eid", eid);
		
		System.out.println("size:"+query.list().size());
	
		return (List<Project>) query.list();
	}
	
	public List<Project> getApyProjectList() {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		ActionContext ctx = ActionContext.getContext();
		int eid = (Integer) ctx.getSession().get("euserid");
		String hql = "from Project where eid=:eid and schedule=:schedule "+
					"order by pid desc";
		Query query = session.createQuery(hql).setInteger("eid", eid).setInteger("schedule", 0);
	
		return (List<Project>) query.list();
	}
	public List<Project> getCurProjectList() {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		ActionContext ctx = ActionContext.getContext();
		int eid = (Integer) ctx.getSession().get("euserid");
		String hql = "from Project where eid=:eid and schedule=:schedule "+
					"order by pid desc";
		Query query = session.createQuery(hql).setInteger("eid", eid).setInteger("schedule", 1);
	
		return (List<Project>) query.list();
	}
	public List<Project> getFinProjectList() {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		ActionContext ctx = ActionContext.getContext();
		int eid = (Integer) ctx.getSession().get("euserid");
		String hql = "from Project where eid=:eid and schedule=:schedule "+
					"order by pid desc";
		Query query = session.createQuery(hql).setInteger("eid", eid).setInteger("schedule", 2);
	
		return (List<Project>) query.list();
	}
}
