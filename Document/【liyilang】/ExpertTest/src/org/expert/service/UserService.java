package org.expert.service;

import java.util.List;

import org.expert.model.User;

public interface UserService {
	public void save(User o);

	public void update(User o);

	public void delete(int id);

	public User get(int id);
	
	public List<User> getList();
	
	public List<User> getList(int begin, int end);
	
	public Long totalNum();
	
	public List<User> query(String hql, List<?> values, int begin, int end);
	
	public Long queryNum(String hql, List<?> values);
	
}
