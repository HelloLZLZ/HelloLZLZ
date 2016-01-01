package org.expert.service;

import java.util.List;

import org.expert.model.Project;

public interface ProjectService {
	public boolean save(Project project);

	public boolean update(Project project);

	public boolean delete(int id);

	public Project get(int id);
	
	public List<Project> getList();
	
	public List<Project> getList(int begin, int end);
}
