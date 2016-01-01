package org.expert.service;

import java.util.List;

import org.expert.model.Business;
/**
 * 
 * @author Seth
 *
 */

public interface BusinessService {
	
	public boolean save(Business business);

	public boolean update(Business business);

	public void delete(int id);

	public Business get(int id);
	
	public List<Business> getList();
	
	public List<Business> getList(int begin, int end);
	
	public Long totalNum();
	
	public List<Business> query(String hql, List<?> values, int begin, int end);
	
	public Long queryNum(String hql, List<?> values);

}
