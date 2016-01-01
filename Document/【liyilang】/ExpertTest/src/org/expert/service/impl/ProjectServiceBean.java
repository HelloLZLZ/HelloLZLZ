package org.expert.service.impl;
/**
 * @author Seth 
 * 
 */

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException; 
import java.util.ArrayList;
import java.util.List;  
import java.util.Map;

import org.expert.common.DbUtils;
import org.expert.common.HibernateUtils;
import org.expert.model.Expert;
import org.expert.model.Project;
import org.expert.service.ProjectService;
import org.hibernate.Query;
import org.hibernate.Session;









import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
 
public class ProjectServiceBean implements ProjectService{

	public boolean save(Project project) {
		// TODO Auto-generated method stub
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			session.persist(project);
			session.getTransaction().commit();
			
		} catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
			return false;
		}finally{
			HibernateUtils.closeSession();
		}
		return true;
	}

	public boolean update(Project project) {
		// TODO Auto-generated method stub
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			session.update(project);
			session.getTransaction().commit();
			
		} catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
			return false;
		}finally{
			HibernateUtils.closeSession();
		}
		return true;
		
		
	}

	public boolean delete(int id) {
		// TODO Auto-generated method stub
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			session.delete(session.load(Project.class, id));
			session.getTransaction().commit();
			
		} catch(RuntimeException e){
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
			return false;
		}finally{
			HibernateUtils.closeSession();
		}
		return true;
	}

	public Project get(int id) {
		// TODO Auto-generated method stub
		Project project = null;
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			project =  (Project) session.get(Project.class, id);
			session.getTransaction().commit(); //--- must commit ���� Even get()
		} catch(RuntimeException e) {
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			HibernateUtils.closeSession();
		}
		return project;
	}

	public List<Project> getList() {
		// TODO Auto-generated method stub
		Query query=null;
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			query = session.createQuery(
					"from Project order by pid desc");
		} catch(RuntimeException e) {
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			HibernateUtils.closeSession();
		}
		return (List<Project>) query.list();
	}

	public List<Project> getList(int begin, int end) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//obtain the projects list of expert
	public List<Project> getListByE(int id){
		Query query=null;
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin(); 
			String hql="from Project p where p.expert.eid='"+id+"'";
			query = session.createQuery(
					hql);
		} catch(RuntimeException e) {
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			HibernateUtils.closeSession();
		}
		return (List<Project>) query.list();
	}
	
	//obtain the project list of business
	public List<Project> getListByB(int id ){
		Query query=null;
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin();
			//String hql="select distinct p from Project p inner join p.business b where b.bid=?";
     		String hql="from Project p where p.business.bid='"+id+"'";
			query = session.createQuery(
					hql);
			//query.setParameter(0, String.valueOf(id));
		} catch(RuntimeException e) {
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			HibernateUtils.closeSession();
		}
		return (List<Project>) query.list();
	}
	
	//not finished
	//obtain the project list through keyword
	public List<Project> getListByK(String hql){
		Query query=null;
		
		try{
			Session session = HibernateUtils.getSessionFactory().getCurrentSession();
			session.getTransaction().begin();
			//String hql="select distinct p from Project p inner join p.business b where b.bid=?";
     		//String hql="from Project p where p."+keyword.toString()+"='"+keyword.get(keyword.toString())+"'";
			query = session.createQuery(hql);
			//query.setParameter(0, String.valueOf(id));
		} catch(RuntimeException e) {
			HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			HibernateUtils.closeSession();
		}
		return (List<Project>) query.list();
		
	}
	
	public boolean createSQL(String SQL){
		
		try {
			Connection connection=(Connection) DbUtils.getConnection();
			PreparedStatement statement=(PreparedStatement) connection.prepareStatement(SQL);
			
			statement.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	
	}
	
	public ResultSet createSQLquery(String SQL){
		
		ResultSet set=null;
		
		try {
			Connection connection=(Connection) DbUtils.getConnection();
			PreparedStatement statement=(PreparedStatement) connection.prepareStatement(SQL);
			
			set=statement.executeQuery();
			
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return set;
	}
	
	public ArrayList<ArrayList<Expert>> getApplyedList(int id) {
		String SQL="select eid,checked from expert."+id;
		ResultSet set=createSQLquery(SQL);
		ArrayList<Expert> list0=new ArrayList<Expert>();
		ArrayList<Expert> list1=new ArrayList<Expert>();
		ExpertServiceBean es=new ExpertServiceBean();
		try {
			while(set.next()){
				if(set.getInt("checked")==0)
					list0.add(es.get(set.getInt("eid")));
				else {
					list1.add(es.get(set.getInt("eid")));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<ArrayList<Expert>> list=new ArrayList<ArrayList<Expert>>();
		list.add(list0);
		list.add(list1);
		return list;
		
		
	}
	


}
