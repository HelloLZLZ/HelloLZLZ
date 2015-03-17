package org.expert.service.impl;

import java.util.List;

import org.expert.common.HibernateUtils;
import org.expert.model.Project;
import org.expert.service.ProjectService;
import org.hibernate.Session;

public class ProjectServiceBean implements ProjectService{

	public boolean save(Project project) {
		// TODO Auto-generated method stub
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			session.persist(project);
			session.getTransaction().commit();
			return true;
		} catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}

	public void update(Project project) {
		// TODO Auto-generated method stub
		
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	public Project get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Project> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Project> getList(int begin, int end) {
		// TODO Auto-generated method stub
		return null;
	}

}
