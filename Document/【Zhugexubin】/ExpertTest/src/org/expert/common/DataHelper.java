package org.expert.common;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
/**
 * 
 * @author zhugexubin
 *
 */
public class DataHelper {
	
	//从数据库获取行业信息
	public static List<String> getBusinessList(){
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		String hql = "select name from Vocation";
		
		@SuppressWarnings("unchecked")
		ArrayList<String> list = (ArrayList<String>) session.createQuery(hql).list();
		
		Iterator i = list.iterator();
		while(i.hasNext()){
			System.out.println(i.next()+"--");
		}
		return list;
	}
	//从数据库获取领域信息
	public static List<String> getJobList(){
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		String hql = "select name from Domain";
		
		@SuppressWarnings("unchecked")
		ArrayList<String> list = (ArrayList<String>) session.createQuery(hql).list();
		
		Iterator<String> i = list.iterator();
		while(i.hasNext()){
			System.out.println(i.next()+"--");
		}
		return list;
	}
	//从数据库获取预算信息
	public static List<String> getBudgetList(){
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		String hql = "select name from Budget";
		
		@SuppressWarnings("unchecked")
		ArrayList<String> list = (ArrayList<String>) session.createQuery(hql).list();
		
		Iterator<String> i = list.iterator();
		while(i.hasNext()){
			System.out.println(i.next()+"--");
		}
		return list;
	}
	//从数据库获取隐私度信息
	public static List<String> getPrivacyList(){
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		String hql = "select name from Privacy";
		
		@SuppressWarnings("unchecked")
		ArrayList<String> list = (ArrayList<String>) session.createQuery(hql).list();
		
		Iterator<String> i = list.iterator();
		while(i.hasNext()){
			System.out.println(i.next()+"--");
		}
		return list;
	}
	//主方法测试
	public static void main(String args[]){
		getBusinessList();
		
		getJobList();
		
		getPrivacyList();
		
		getBudgetList();
	}
	
	
}
