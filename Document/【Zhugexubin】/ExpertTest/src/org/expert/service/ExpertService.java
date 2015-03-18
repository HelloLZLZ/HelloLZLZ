package org.expert.service;

import java.util.List;

import org.expert.model.Expert;

public interface ExpertService {
	
	public boolean save(Expert expert);

	public boolean update(Expert expert);

	public void delete(int id);

	public Expert get(int id);
	
	public List<Expert> getList();
	
	public List<Expert> getList(int begin, int end);
	
	public Long totalNum();
	
	public List<Expert> query(String hql, List<?> values, int begin, int end);
	
	public Long queryNum(String hql, List<?> values);

}
